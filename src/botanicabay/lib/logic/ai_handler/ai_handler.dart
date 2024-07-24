import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:botanicabay/logic/settings_logic/settings_handler.dart';

class OpenAI {
  Future<String> prompt(String prompt) async {
    SettingsHandler settingsHandler = SettingsHandler();
    String apiKey = settingsHandler.getValue("openai_key") ?? "";
    String aiModel =
        settingsHandler.getValue("openai_model") ?? "gpt-3.5-turbo";

    if (apiKey.isEmpty) {
      return "An error occured: No API key provided!";
    }

    if (prompt.isEmpty) {
      return "An error occured: The prompt translation is invalid.";
    }

    // Sending a request to the OpenAI API
    String url = 'https://api.openai.com/v1/chat/completions';
    var response = await http.post(
      Uri.parse(url),
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $apiKey'
      },
      body: jsonEncode({
        'messages': [
          {"role": "user", "content": prompt}
        ],
        'model': aiModel,
      }),
    );

    var responseBody = jsonDecode(response.body);

    if (response.statusCode == 200 &&
        responseBody['choices'] != null &&
        responseBody['choices'].isNotEmpty) {
      return responseBody['choices'][0]['message']['content'];
    }

    return "An error occured: Please check your API key, your OpenAI wallet or your internet connection.";
  }
}
