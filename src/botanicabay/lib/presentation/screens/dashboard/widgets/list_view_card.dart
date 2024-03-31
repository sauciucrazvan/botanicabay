import 'package:botanicabay/data/models/themes_model.dart';
import 'package:botanicabay/data/providers/theme_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ListViewCard extends ConsumerWidget {
  final String backgroundImage;
  final String title;

  const ListViewCard({
    super.key,
    required this.backgroundImage,
    required this.title,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    Themes theme = ref.watch(themesProvider);

    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(6),
        child: SizedBox(
          width: MediaQuery.of(context).size.width - 50,
          height: 105,
          child: Stack(
            children: [
              Image.network(
                backgroundImage,
                fit: BoxFit.cover,
                width: double.infinity,
                height: double.infinity,
              ),
              Stack(
                children: [
                  Positioned.fill(
                    child: Container(
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          begin: Alignment.centerLeft,
                          end: Alignment.centerRight,
                          colors: [
                            Colors.black.withOpacity(1.0),
                            Colors.black.withOpacity(0.8),
                            Colors.black.withOpacity(0.8),
                            Colors.black.withOpacity(0.5),
                            Colors.black.withOpacity(0.0),
                          ],
                          stops: const [0.0, 0.2, 0.5, 0.8, 1.0],
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 250,
                    height: 120,
                    child: Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            title,
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(width: 4),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Icon(
                                Icons.water_drop,
                                color: theme.primaryColor,
                                size: 16,
                              ),
                              const SizedBox(width: 4),
                              const Text(
                                "Next watering in %time%",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 14,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.black.withOpacity(0.5),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: const Padding(
                        padding: EdgeInsets.all(4.0),
                        child: Icon(
                          Icons.menu,
                          color: Colors.white,
                          size: 20,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
