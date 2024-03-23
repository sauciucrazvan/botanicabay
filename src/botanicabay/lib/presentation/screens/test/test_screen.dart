import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:botanicabay/data/providers/test_provider.dart';

class TestScreen extends ConsumerWidget {
  const TestScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: const Color(0xFF121212),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              "assets/appLogo.png",
              width: 192,
              height: 48,
            ),
          ],
        ),
      ),
      backgroundColor: const Color(0xFF121212),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Text(
                ref.watch(counterProvider).toString(),
                style: const TextStyle(
                  color: Color(0xFFFFFFFF),
                ),
              ),
              ListTile(
                title: const Text(
                  "Add",
                  style: TextStyle(
                    color: Color(0xFFFFFFFF),
                  ),
                ),
                onTap: () {
                  ref.read(counterProvider.notifier).state++;
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
