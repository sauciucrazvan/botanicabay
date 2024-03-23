import 'package:botanicabay/presentation/screens/dashboard/models/viewtype_model.dart';
import 'package:botanicabay/presentation/screens/dashboard/providers/viewtype_provider.dart';
import 'package:botanicabay/presentation/themes/dark_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';

class DashboardScreen extends ConsumerWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: DarkTheme.backgroundColor,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Image.asset(
              "assets/appLogo.png",
              width: 192,
              height: 48,
            ),
            const Spacer(),
            IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.add_a_photo,
                color: DarkTheme.textColor,
                size: 24,
              ),
            ),
            IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.settings,
                color: DarkTheme.textColor,
                size: 24,
              ),
            ),
          ],
        ),
      ),
      backgroundColor: DarkTheme.backgroundColor,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(height: 24),

              // Title
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      "Plants",
                      style: GoogleFonts.openSans(
                        color: DarkTheme.textColor,
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const Spacer(),
                    Row(
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            color: ref.watch(viewTypeProvider) == ViewType.list
                                ? DarkTheme.focusColor
                                : DarkTheme.secondaryColor,
                            borderRadius: const BorderRadius.horizontal(
                                left: Radius.circular(16)),
                          ),
                          child: IconButton(
                            onPressed: () {
                              ref.read(viewTypeProvider.notifier).state =
                                  ViewType.list;
                            },
                            splashColor: Colors.transparent,
                            highlightColor: Colors.transparent,
                            icon: const Icon(
                              Icons.view_list,
                              color: DarkTheme.textColor,
                              size: 20,
                            ),
                          ),
                        ),
                        Container(
                          decoration: BoxDecoration(
                            color: ref.watch(viewTypeProvider) == ViewType.grid
                                ? DarkTheme.focusColor
                                : DarkTheme.secondaryColor,
                            borderRadius: const BorderRadius.horizontal(
                                right: Radius.circular(16)),
                          ),
                          child: IconButton(
                            onPressed: () {
                              ref.read(viewTypeProvider.notifier).state =
                                  ViewType.grid;
                            },
                            splashColor: Colors.transparent,
                            highlightColor: Colors.transparent,
                            icon: const Icon(
                              Icons.grid_view_rounded,
                              color: DarkTheme.textColor,
                              size: 20,
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
      ),
    );
  }
}
