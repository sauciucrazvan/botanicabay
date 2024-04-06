import 'package:botanicabay/logic/localization/localization_handler.dart';
import 'package:botanicabay/presentation/screens/new_plant/steps/new_plant_step2.dart';
import 'package:lottie/lottie.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:botanicabay/data/models/themes_model.dart';
import 'package:botanicabay/data/providers/theme_provider.dart';
import 'package:botanicabay/presentation/widgets/buttons/appbar_leading_button.dart';
import 'package:page_transition/page_transition.dart';

class AddNewPlantStepOne extends ConsumerWidget {
  const AddNewPlantStepOne({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    Themes theme = ref.watch(themesProvider);
    LocalizationHandler localizationHandler = LocalizationHandler();

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: theme.backgroundColor,
        leading: LeadingButton(
          iconColor: theme.textColor,
          backgroundColor: theme.primaryColor,
        ),
        title: Text(
          "${localizationHandler.getMessage(ref, "add_plant")} (1/3)"
              .toUpperCase(),
          style: GoogleFonts.rubik(
            color: theme.textColor,
            fontSize: 16,
          ),
        ),
      ),
      backgroundColor: theme.backgroundColor,
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Column(
                children: [
                  // Choose a picture
                  Lottie.asset("assets/animations/taking_a_picture.json",
                      width: 128, height: 128),

                  Column(
                    children: [
                      Text(
                        localizationHandler.getMessage(
                            ref, "add_plant_choose_picture"),
                        style: GoogleFonts.openSans(
                          color: theme.textColor,
                          fontSize: 18,
                        ),
                      ),
                      Text(
                        localizationHandler.getMessage(
                            ref, "add_plant_picture_description"),
                        style: GoogleFonts.openSans(
                          color: theme.textColor,
                          fontSize: 14,
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(height: 8),
                  Container(
                    decoration: BoxDecoration(color: theme.primaryColor),
                    width: MediaQuery.of(context).size.width - 50,
                    height: 4,
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
                          localizationHandler.getMessage(
                              ref, "add_plant_gallery"),
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
                        localizationHandler.getMessage(ref, "or").toUpperCase(),
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
                          localizationHandler.getMessage(
                              ref, "add_plant_camera"),
                          style: GoogleFonts.openSans(
                            color: theme.textColor,
                            fontSize: 14,
                          ),
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(height: 32),
                  ElevatedButton.icon(
                    onPressed: () {
                      Navigator.push(
                        context,
                        PageTransition(
                          child: const AddNewPlantStepTwo(),
                          type: PageTransitionType.bottomToTop,
                        ),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.all(12.0),
                      backgroundColor: theme.primaryColor,
                    ),
                    icon: Icon(
                      Icons.keyboard_arrow_right_rounded,
                      color: theme.textColor,
                      size: 20,
                    ),
                    label: Text(
                      localizationHandler.getMessage(ref, "next_step"),
                      style: GoogleFonts.openSans(
                        color: theme.textColor,
                        fontSize: 14,
                      ),
                    ),
                  ),
                  const SizedBox(height: 16),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
