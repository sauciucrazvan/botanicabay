import 'dart:typed_data';

import 'package:botanicabay/data/providers/plants_provider.dart';
import 'package:botanicabay/logic/localization/localization_handler.dart';
import 'package:botanicabay/presentation/widgets/confirm_dialog.dart';
import 'package:botanicabay/presentation/widgets/elevated_notification.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:botanicabay/data/models/themes_model.dart';
import 'package:botanicabay/data/providers/theme_provider.dart';
import 'package:hive/hive.dart';

class ViewCard extends ConsumerWidget {
  final Uint8List backgroundImage;
  final String title;
  final bool synced;
  final Map? variables;

  const ViewCard({
    super.key,
    required this.backgroundImage,
    required this.title,
    required this.synced,
    required this.variables,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    Themes theme = ref.watch(themesProvider);

    LocalizationHandler localizationHandler = LocalizationHandler();

    return Center(
      child: ClipRRect(
        borderRadius: BorderRadius.circular(16),
        child: Container(
          decoration: BoxDecoration(
            color: theme.backgroundColor,
          ),
          width: MediaQuery.of(context).size.width - 50,
          height: MediaQuery.of(context).size.height / 2,
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Image.memory(
                  backgroundImage,
                  fit: BoxFit.cover,
                  width: MediaQuery.of(context).size.width - 50,
                  height: 150,
                ),
                const SizedBox(height: 10),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        title,
                        style: TextStyle(
                          color: theme.textColor,
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 4),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          IconButton(
                            style: ElevatedButton.styleFrom(
                              padding: const EdgeInsets.all(8.0),
                              backgroundColor: theme.secondaryColor,
                            ),
                            onPressed: () {
                              showDialog(
                                context: context,
                                builder: (context) => ConfirmDialog(
                                  text: localizationHandler
                                      .getMessage(ref,
                                          "view_plants_delete_confirmation")
                                      .replaceAll("%plant_name%", title),
                                  confirm: () {
                                    Hive.box('plants').delete(title);
                                    ref.invalidate(plantsProvider);

                                    showElevatedNotification(
                                      context,
                                      localizationHandler
                                          .getMessage(ref,
                                              "view_plants_delete_notification")
                                          .replaceAll("%plant_name%", title),
                                      theme.primaryColor,
                                    );
                                    Navigator.popUntil(
                                        context, (route) => route.isFirst);
                                  },
                                ),
                              );
                            },
                            icon: const Icon(
                              Icons.delete,
                              color: Colors.red,
                              size: 20,
                            ),
                          ),
                          IconButton(
                            style: ElevatedButton.styleFrom(
                              padding: const EdgeInsets.all(8.0),
                              backgroundColor: theme.secondaryColor,
                            ),
                            onPressed: () {},
                            icon: const Icon(
                              Icons.edit_note_rounded,
                              color: Colors.amber,
                              size: 20,
                            ),
                          ),
                          IconButton(
                            style: ElevatedButton.styleFrom(
                              padding: const EdgeInsets.all(8.0),
                              backgroundColor: theme.secondaryColor,
                            ),
                            onPressed: () {},
                            icon: Icon(
                              Icons.edit_attributes_rounded,
                              color: theme.primaryColor,
                              size: 20,
                            ),
                          ),
                          IconButton(
                            style: ElevatedButton.styleFrom(
                              padding: const EdgeInsets.all(8.0),
                              backgroundColor: theme.secondaryColor,
                            ),
                            onPressed: () {},
                            icon: Icon(
                              synced
                                  ? Icons.sync_rounded
                                  : Icons.sync_disabled_rounded,
                              color: synced ? theme.primaryColor : Colors.red,
                              size: 20,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 4),
                      Text(
                        localizationHandler.getMessage(ref, "variables"),
                        style: TextStyle(
                          color: theme.textColor,
                          fontSize: 14,
                        ),
                      ),
                      const SizedBox(height: 4),
                      Container(
                        decoration: BoxDecoration(
                            color: theme.secondaryColor,
                            borderRadius: BorderRadius.circular(8)),
                        padding: const EdgeInsets.all(8),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            for (var variable in variables!.entries)
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  SizedBox(
                                    width: (MediaQuery.of(context).size.width -
                                            100) /
                                        2,
                                    child: Text(
                                      variable.key + ":",
                                      style: TextStyle(
                                        color: theme.textColor,
                                        fontSize: 12,
                                      ),
                                    ),
                                  ),
                                  const SizedBox(width: 4),
                                  SizedBox(
                                    width: (MediaQuery.of(context).size.width -
                                            100) /
                                        2,
                                    child: Text(
                                      variable.value,
                                      style: TextStyle(
                                        color: theme.textColor,
                                        fontSize: 12,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
