import 'package:cookie_game/providers/cookies.dart';
import 'package:cookie_game/providers/upgrades.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class UpgradesPage extends ConsumerWidget {
  const UpgradesPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // Create a Cookie Counter
    int totalCookies = ref.watch(cookieProvider);
    int totalPower = ref.watch(upgradesProvider.notifier).totalPower;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text("Cookies: $totalCookies"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Total Power: $totalPower"),

            // Upgrade 1: Increase Power by 1, cost 10 cookies
            ElevatedButton(
              onPressed: () {
                if (totalCookies >= 10) {
                  ref.read(cookieProvider.notifier).decrementBy(10);
                  // add upgrade
                  ref
                      .read(upgradesProvider.notifier)
                      .addUpgrade(1, "Upgrade 1", 10, 1);
                }
              },
              child:
                  const Text('Upgrade 1: Increase Power by 1, cost 10 cookies'),
            ),

            // Upgrade 2: Increase Power by 3, cost 20 cookies
            ElevatedButton(
              onPressed: () {
                if (totalCookies >= 20) {
                  ref.read(cookieProvider.notifier).decrementBy(20);
                  // add upgrade
                  ref
                      .read(upgradesProvider.notifier)
                      .addUpgrade(2, "Upgrade 2", 20, 3);
                }
              },
              child:
                  const Text('Upgrade 2: Increase Power by 3, cost 20 cookies'),
            ),

            // Upgrade 3: Increase Power by 5, cost 30 cookies
            ElevatedButton(
              onPressed: () {
                if (totalCookies >= 30) {
                  ref.read(cookieProvider.notifier).decrementBy(30);
                  // add upgrade
                  ref
                      .read(upgradesProvider.notifier)
                      .addUpgrade(3, "Upgrade 3", 30, 5);
                }
              },
              child:
                  const Text('Upgrade 3: Increase Power by 5, cost 30 cookies'),
            ),

            ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text('Back'),
            ),
          ],
        ),
      ),
    );
  }
}
