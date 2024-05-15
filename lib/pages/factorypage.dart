import 'package:cookie_game/models/factory.dart';
import 'package:cookie_game/providers/cookies.dart';
import 'package:cookie_game/providers/factories.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class FactoryPage extends ConsumerWidget {
  const FactoryPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // Create a Cookie Counter
    int totalCookies = ref.watch(cookieProvider);
    // Create List of factories
    List<Factory> factories = ref.watch(factoryProvider);

    // total production
    int totalProduction = ref.watch(factoryProvider.notifier).totalProduction;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text("Cookies: $totalCookies"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Total Production: $totalProduction"),
            const SizedBox(height: 20),
            // for each factory in factories, show the factory name, amount, production, price, and amount
            for (final factory in factories)
              Column(
                children: [
                  Text("Name: ${factory.name}"),
                  Text("Amount: ${factory.amount}"),
                  Text("Production: ${factory.production}"),
                  Text("Price: ${factory.price}"),
                  ElevatedButton(
                    onPressed: () {
                      if (totalCookies >= factory.price) {
                        ref
                            .read(cookieProvider.notifier)
                            .decrementBy(factory.price);
                        ref.read(factoryProvider.notifier).addFactory(
                              factory.factoryId,
                              factory.name,
                              factory.price,
                              factory.production,
                            );
                      }
                    },
                    child: Text('Buy ${factory.name}'),
                  ),
                ],
              ),

            const SizedBox(height: 20),

            // Factory 1: Increase Production by 1, cost 10 cookies
            ElevatedButton(
              onPressed: () {
                if (totalCookies >= 10) {
                  ref.read(cookieProvider.notifier).decrementBy(10);
                  // add factory
                  ref
                      .read(factoryProvider.notifier)
                      .addFactory(1, "Factory 1", 10, 1);
                }
              },
              child: const Text(
                  'Factory 1: Increase Production by 1, cost 10 cookies'),
            ),

            // Factory 2: Increase Production by 3, cost 20 cookies
            ElevatedButton(
              onPressed: () {
                if (totalCookies >= 20) {
                  ref.read(cookieProvider.notifier).decrementBy(20);
                  // add factory
                  ref
                      .read(factoryProvider.notifier)
                      .addFactory(2, "Factory 2", 20, 3);
                }
              },
              child: const Text(
                  'Factory 2: Increase Production by 3, cost 20 cookies'),
            ),

            // Factory 3: Increase Production by 5, cost 30 cookies
            ElevatedButton(
              onPressed: () {
                if (totalCookies >= 30) {
                  ref.read(cookieProvider.notifier).decrementBy(30);
                  // add factory
                  ref
                      .read(factoryProvider.notifier)
                      .addFactory(3, "Factory 3", 30, 5);
                }
              },
              child: const Text(
                  'Factory 3: Increase Production by 5, cost 30 cookies'),
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
