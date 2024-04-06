import 'package:botanicabay/presentation/screens/new_plant/steps/new_plant_step3.dart';
import 'package:botanicabay/presentation/widgets/elevated_notification.dart';
import 'package:lottie/lottie.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:botanicabay/data/models/themes_model.dart';
import 'package:botanicabay/data/providers/theme_provider.dart';
import 'package:botanicabay/presentation/widgets/buttons/appbar_leading_button.dart';
import 'package:page_transition/page_transition.dart';

class AddNewPlantStepTwo extends ConsumerWidget {
  const AddNewPlantStepTwo({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    Themes theme = ref.watch(themesProvider);
    TextEditingController nameController = TextEditingController();

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: theme.backgroundColor,
        leading: LeadingButton(
          iconColor: theme.textColor,
          backgroundColor: theme.primaryColor,
        ),
        title: Text(
          "ADD A NEW PLANT (2/3)",
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
                  Lottie.asset("assets/animations/name_your_plant.json",
                      width: 128, height: 128),

                  Column(
                    children: [
                      Text(
                        "Let's give your plant a name...",
                        style: GoogleFonts.openSans(
                          color: theme.textColor,
                          fontSize: 18,
                        ),
                      ),
                      Text(
                        "This will help you identify it later. You can use anything you want - the limit is your imagination!",
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

                  Container(
                    decoration: BoxDecoration(
                      color: theme.secondaryColor,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: TextField(
                      controller: nameController,
                      maxLines: 1,
                      maxLength: 24,
                      style: TextStyle(color: theme.textColor),
                      decoration: InputDecoration(
                        hintText: 'Display name',
                        hintStyle: TextStyle(color: theme.textColor),
                        contentPadding: const EdgeInsets.all(8.0),
                        border: InputBorder.none,
                        counterText: "",
                      ),
                      cursorColor: theme.primaryColor,
                      textAlignVertical: TextAlignVertical.top,
                    ),
                  ),

                  const SizedBox(height: 32),
                  ElevatedButton.icon(
                    onPressed: () {
                      if (nameController.text.isEmpty) {
                        showElevatedNotification(
                          context,
                          "You need to name your plant.",
                          theme.secondaryColor,
                        );
                        return;
                      }

                      Navigator.push(
                        context,
                        PageTransition(
                          child: const AddNewPlantStepThree(),
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
                      "Next step",
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
