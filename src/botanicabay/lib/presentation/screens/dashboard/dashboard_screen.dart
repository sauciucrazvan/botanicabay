import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:botanicabay/data/providers/test_provider.dart';

class DashboardScreen extends ConsumerWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final String value = ref.watch(helloWorldProvider);

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
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
            child: Center(
              child: Text(
                value,
                style: const TextStyle(
                  color: Color(0xFFFFFFFF),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
