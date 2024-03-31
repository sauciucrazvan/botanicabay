import 'package:botanicabay/presentation/screens/journal/journal_screen.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:botanicabay/data/models/themes_model.dart';
import 'package:botanicabay/data/providers/theme_provider.dart';
import 'package:botanicabay/presentation/screens/settings/settings_screen.dart';
import 'package:botanicabay/presentation/screens/dashboard/models/viewtype_model.dart';
import 'package:botanicabay/presentation/screens/dashboard/widgets/list_view_card.dart';
import 'package:botanicabay/presentation/screens/dashboard/widgets/grid_view_card.dart';
import 'package:botanicabay/presentation/screens/dashboard/providers/viewtype_provider.dart';

class DashboardScreen extends ConsumerWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    Themes theme = ref.watch(themesProvider);

    // DEBUG DATA
    List<String> cardTitles = [
      'Debug Plant',
      'Test Plant',
      'Happy Plant',
      'Monstera Delicioasa',
      'Snake Plant',
      'Bonnie Plant',
      'Foli Plant',
    ];

    List<String> cardImages = [
      'https://i.imgur.com/U4Zkhpc.png',
      'https://bonnieplants.com/cdn/shop/files/plugs_on_ledge.jpg?v=1681134679&width=1200',
      'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRQHRfR0_6Dap1-Mv-yDe7Aj5otROVqVY5kvjyD1b_xHw&s',
      'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTwWI0Q8nwjFc2tF_1L4USB8xOydfojOSFeZRWcAPhubg&s',
      'https://asset.bloomnation.com/c_pad,d_vendor:global:catalog:product:image.png,f_auto,fl_preserve_transparency,q_auto/v1709703400/vendor/8469/catalog/product/2/0/20200304122155_file_5e5ef4a3ccb60_5e5ef7b7cd5fa_64306f77e15a0.jpg',
      'https://bonnieplants.com/cdn/shop/files/plugs_on_ledge.jpg?v=1681134679&width=1200',
      'https://foli.ca/cdn/shop/products/CPCo-0366_b4e112b7-aab7-44bd-b65f-ad033ba9bc88.jpg?v=1709518733&width=4096',
    ];
    // END DEBUG DATA

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: theme.backgroundColor,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Image.asset(
              "assets/appLogo.png",
              width: 192,
              height: 48,
            ),
            const Spacer(),
            Container(
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.all(
                  Radius.circular(16),
                ),
                color: theme.secondaryColor,
              ),
              child: Row(
                children: [
                  IconButton(
                    onPressed: () {},
                    color: theme.textColor,
                    icon: const Icon(
                      Icons.add_a_photo,
                      size: 24,
                    ),
                  ),
                  IconButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const JournalScreen(),
                        ),
                      );
                    },
                    color: theme.textColor,
                    icon: const Icon(
                      Icons.menu_book_rounded,
                      size: 24,
                    ),
                  ),
                  IconButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const SettingsScreen(),
                        ),
                      );
                    },
                    color: theme.textColor,
                    icon: Icon(
                      Icons.settings,
                      color: theme.textColor,
                      size: 24,
                    ),
                  ),
                ],
              ),
            ),
          ],
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
                      "Plants",
                      style: GoogleFonts.openSans(
                        color: theme.textColor,
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
                                ? theme.primaryColor
                                : theme.secondaryColor,
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
                            color: theme.textColor,
                            icon: const Icon(
                              Icons.view_list,
                              size: 20,
                            ),
                          ),
                        ),
                        Container(
                          decoration: BoxDecoration(
                            color: ref.watch(viewTypeProvider) == ViewType.grid
                                ? theme.primaryColor
                                : theme.secondaryColor,
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
                            color: theme.textColor,
                            icon: const Icon(
                              Icons.grid_view_rounded,
                              size: 20,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 8),

              // Cards
              if (ref.watch(viewTypeProvider) == ViewType.grid) ...[
                Wrap(
                  spacing: 8.0,
                  runSpacing: 8.0,
                  children: [
                    for (var i = 0; i < cardTitles.length; i++)
                      GridViewCard(
                        backgroundImage: cardImages[i],
                        title: cardTitles[i],
                        synced: i % 3 == 1,
                      ),
                  ],
                ),
              ],

              if (ref.watch(viewTypeProvider) == ViewType.list) ...[
                for (var i = 0; i < cardTitles.length; i++)
                  ListViewCard(
                    backgroundImage: cardImages[i],
                    title: cardTitles[i],
                    synced: i % 3 == 0,
                  ),
              ],
              const SizedBox(height: 32),
            ],
          ),
        ),
      ),
    );
  }
}
