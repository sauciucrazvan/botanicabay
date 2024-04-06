import 'package:flutter/material.dart';
import 'package:botanicabay/presentation/screens/dashboard/dashboard_screen.dart';

class BotanicaBay extends StatelessWidget {
  const BotanicaBay({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: DashboardScreen(),
    );
  }
}
