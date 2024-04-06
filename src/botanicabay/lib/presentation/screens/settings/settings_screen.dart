import 'dart:io';

import 'package:flutter/material.dart';
import 'package:botanicabay/config.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:botanicabay/data/models/themes_model.dart';
import 'package:botanicabay/data/providers/theme_provider.dart';
import 'package:botanicabay/presentation/themes/dark_theme.dart';
import 'package:botanicabay/presentation/themes/green_theme.dart';
import 'package:botanicabay/presentation/themes/light_theme.dart';
import 'package:botanicabay/logic/settings_logic/settings_handler.dart';
import 'package:botanicabay/presentation/widgets/buttons/appbar_leading_button.dart';

class SettingsScreen extends ConsumerWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    Themes theme = ref.watch(themesProvider);
    SettingsHandler settingsHandler = SettingsHandler();

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: theme.backgroundColor,
        leading: LeadingButton(
          iconColor: theme.textColor,
          backgroundColor: theme.primaryColor,
        ),
        title: Text(
          "SETTINGS",
          style: GoogleFonts.rubik(
            color: theme.textColor,
            fontSize: 16,
          ),
        ),
      ),
      backgroundColor: theme.backgroundColor,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(height: 16),

              // Title
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      "Choose your theme",
                      style: GoogleFonts.openSans(
                        color: theme.textColor,
                        fontSize: 15,
                      ),
                    ),
                    const Spacer(),
                    Row(
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            color: theme.id == 0
                                ? theme.primaryColor
                                : theme.secondaryColor,
                            borderRadius: const BorderRadius.horizontal(
                                left: Radius.circular(16)),
                          ),
                          child: IconButton(
                            onPressed: () {
                              ref.read(themesProvider.notifier).state =
                                  DarkTheme();

                              settingsHandler.setValue('app_theme', 'dark');
                            },
                            splashColor: Colors.transparent,
                            highlightColor: Colors.transparent,
                            color: theme.textColor,
                            icon: const Icon(
                              Icons.nightlight,
                              size: 20,
                            ),
                          ),
                        ),
                        Container(
                          decoration: BoxDecoration(
                            color: theme.id == 1
                                ? theme.primaryColor
                                : theme.secondaryColor,
                          ),
                          child: IconButton(
                            onPressed: () {
                              ref.read(themesProvider.notifier).state =
                                  GreenTheme();
                              settingsHandler.setValue('app_theme', 'green');
                            },
                            splashColor: Colors.transparent,
                            highlightColor: Colors.transparent,
                            color: theme.textColor,
                            icon: const Icon(
                              Icons.forest,
                              size: 20,
                            ),
                          ),
                        ),
                        Container(
                          decoration: BoxDecoration(
                            color: theme.id == 2
                                ? theme.primaryColor
                                : theme.secondaryColor,
                            borderRadius: const BorderRadius.horizontal(
                                right: Radius.circular(16)),
                          ),
                          child: IconButton(
                            onPressed: () {
                              ref.read(themesProvider.notifier).state =
                                  LightTheme();
                              settingsHandler.setValue('app_theme', 'light');
                            },
                            splashColor: Colors.transparent,
                            highlightColor: Colors.transparent,
                            color: theme.textColor,
                            icon: const Icon(
                              Icons.sunny,
                              size: 20,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 16),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  "Currently using $applicationVersion\n(running on ${Platform.operatingSystem})",
                  style: GoogleFonts.openSans(
                    color: theme.textColor,
                    fontSize: 14,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
