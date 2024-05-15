import 'package:cookie_game/providers/cookies.dart';
import 'package:cookie_game/providers/upgrades.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class HomePage extends ConsumerWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // Create a Cookie Counter
    int totalCookies = ref.watch(cookieProvider);
    // Create a variable for the total power
    int totalPower = ref.watch(upgradesProvider.notifier).totalPower;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text("Cookies: $totalCookies"),
      ),

      // Create a Cookie Counter
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Create a Cookie Counter Button
            ElevatedButton(
              onPressed: () {
                ref.read(cookieProvider.notifier).incrementBy(totalPower);
              },
              child: const Icon(Icons.add),
            ),

            // Create 2 buttons to navigate to the Upgrades and Factory pages
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/upgrades');
              },
              child: const Text('Upgrades'),
            ),

            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/factory');
              },
              child: const Text('Factory'),
            ),
          ],
        ),
      ),
    );
  }
}
