import 'package:cookie_game/pages/factorypage.dart';
import 'package:cookie_game/pages/home.dart';
import 'package:cookie_game/pages/upgradepage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

void main() {
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Cookie Game',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.brown),
        useMaterial3: true,
      ),
      home: const HomePage(),
      routes: {
        '/home': (context) => const HomePage(),
        '/upgrades': (context) => const UpgradesPage(),
        '/factory': (context) => const FactoryPage(),
      },
    );
  }
}
