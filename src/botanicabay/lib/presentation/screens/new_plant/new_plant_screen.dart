import 'package:botanicabay/data/models/themes_model.dart';
import 'package:botanicabay/data/providers/theme_provider.dart';
import 'package:botanicabay/presentation/widgets/buttons/appbar_leading_button.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AddNewPlantScreen extends ConsumerWidget {
  const AddNewPlantScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    Themes theme = ref.watch(themesProvider);

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: theme.backgroundColor,
        leading: LeadingButton(
          iconColor: theme.textColor,
          backgroundColor: theme.primaryColor,
        ),
        title: Text(
          "ADD A NEW PLANT",
          style: GoogleFonts.rubik(
            color: theme.textColor,
            fontSize: 16,
          ),
        ),
      ),
      backgroundColor: theme.backgroundColor,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 16),

                // Picture
                Container(
                  decoration: BoxDecoration(
                    border: Border(
                      left: BorderSide(
                        color: theme.primaryColor,
                        width: 2.0,
                      ),
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Let's get you started - Choose a picture!",
                          style: GoogleFonts.openSans(
                            color: theme.textColor,
                            fontSize: 18,
                          ),
                        ),
                        Text(
                          "Choose whether you have a picture of the plant already or you want to take one right now.",
                          style: GoogleFonts.openSans(
                            color: theme.textColor,
                            fontSize: 14,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),

                const SizedBox(height: 16),

                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ElevatedButton.icon(
                      style: ElevatedButton.styleFrom(
                        padding: const EdgeInsets.all(12.0),
                        backgroundColor: theme.secondaryColor,
                      ),
                      onPressed: () {},
                      icon: Icon(
                        Icons.image,
                        color: theme.textColor,
                        size: 20,
                      ),
                      label: Text(
                        "Gallery",
                        style: GoogleFonts.openSans(
                          color: theme.textColor,
                          fontSize: 14,
                        ),
                      ),
                    ),
                    const SizedBox(width: 10),
                    Container(
                      width: 20,
                      height: 3,
                      decoration: BoxDecoration(color: theme.textColor),
                    ),
                    const SizedBox(width: 5),
                    Text(
                      "OR",
                      style: GoogleFonts.openSans(
                        color: theme.textColor,
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(width: 5),
                    Container(
                      width: 20,
                      height: 3,
                      decoration: BoxDecoration(color: theme.textColor),
                    ),
                    const SizedBox(width: 10),
                    ElevatedButton.icon(
                      style: ElevatedButton.styleFrom(
                        padding: const EdgeInsets.all(12.0),
                        backgroundColor: theme.secondaryColor,
                      ),
                      onPressed: () {},
                      icon: Icon(
                        Icons.camera_alt_rounded,
                        color: theme.textColor,
                        size: 20,
                      ),
                      label: Text(
                        "Camera",
                        style: GoogleFonts.openSans(
                          color: theme.textColor,
                          fontSize: 14,
                        ),
                      ),
                    ),
                  ],
                ),

                const SizedBox(height: 16),

                // Name
                Container(
                  decoration: BoxDecoration(
                    border: Border(
                      left: BorderSide(
                        color: theme.primaryColor,
                        width: 2.0,
                      ),
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Variables",
                          style: GoogleFonts.openSans(
                            color: theme.textColor,
                            fontSize: 18,
                          ),
                        ),
                        Text(
                          "• Display Name",
                          style: GoogleFonts.openSans(
                            color: theme.textColor,
                            fontSize: 14,
                          ),
                        ),
                        const SizedBox(height: 4),
                        Container(
                          decoration: BoxDecoration(
                            color: theme.secondaryColor,
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: TextField(
                            maxLines: 1,
                            maxLength: 24,
                            style: TextStyle(color: theme.textColor),
                            decoration: InputDecoration(
                              hintText: 'Name the plant...',
                              hintStyle: TextStyle(color: theme.textColor),
                              contentPadding: const EdgeInsets.all(8.0),
                              border: InputBorder.none,
                              counterText: "",
                            ),
                            cursorColor: theme.primaryColor,
                            textAlignVertical: TextAlignVertical.top,
                          ),
                        ),
                        const SizedBox(height: 4),
                        Text(
                          "• Description",
                          style: GoogleFonts.openSans(
                            color: theme.textColor,
                            fontSize: 14,
                          ),
                        ),
                        const SizedBox(height: 4),
                        Container(
                          decoration: BoxDecoration(
                            color: theme.secondaryColor,
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: TextField(
                            maxLines: 15,
                            style: TextStyle(color: theme.textColor),
                            decoration: InputDecoration(
                              hintText: 'Additional details...',
                              hintStyle: TextStyle(color: theme.textColor),
                              contentPadding: const EdgeInsets.all(8.0),
                              border: InputBorder.none,
                            ),
                            cursorColor: theme.primaryColor,
                            textAlignVertical: TextAlignVertical.top,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),

                const SizedBox(height: 16),

                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ElevatedButton.icon(
                      style: ElevatedButton.styleFrom(
                        padding: const EdgeInsets.all(12.0),
                        backgroundColor: theme.secondaryColor,
                      ),
                      onPressed: () {},
                      icon: Icon(
                        Icons.timer,
                        color: theme.textColor,
                        size: 20,
                      ),
                      label: Text(
                        "Timer",
                        style: GoogleFonts.openSans(
                          color: theme.textColor,
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    const SizedBox(width: 8),
                    ElevatedButton.icon(
                      style: ElevatedButton.styleFrom(
                        padding: const EdgeInsets.all(12.0),
                        backgroundColor: theme.secondaryColor,
                      ),
                      onPressed: () {},
                      icon: Icon(
                        Icons.sync_rounded,
                        color: theme.textColor,
                        size: 20,
                      ),
                      label: Text(
                        "Sync",
                        style: GoogleFonts.openSans(
                          color: theme.textColor,
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    const SizedBox(width: 8),
                    ElevatedButton.icon(
                      style: ElevatedButton.styleFrom(
                        padding: const EdgeInsets.all(12.0),
                        backgroundColor: theme.secondaryColor,
                      ),
                      onPressed: () {},
                      icon: Icon(
                        Icons.check,
                        color: theme.primaryColor,
                        size: 20,
                      ),
                      label: Text(
                        "Save",
                        style: GoogleFonts.openSans(
                          color: theme.primaryColor,
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),

                const SizedBox(height: 24),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
