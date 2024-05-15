import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:cookie_game/models/factory.dart';

final factoryProvider =
    StateNotifierProvider<FactoryNotifier, List<Factory>>((ref) {
  return FactoryNotifier();
});

class FactoryNotifier extends StateNotifier<List<Factory>> {
  FactoryNotifier() : super([]);

  void addFactory(int factoryId, String name, int price, int production) {
    // if the state already contains a factory with the same id, update the factory amount + 1
    if (state.any((factory) => factory.factoryId == factoryId)) {
      state = [
        for (final factory in state)
          if (factory.factoryId == factoryId)
            Factory(
              factoryId: factory.factoryId,
              name: factory.name,
              price: factory.price,
              production: factory.production,
              amount: factory.amount + 1,
            )
          else
            factory,
      ];
    } else {
      // if the state does not contain a factory with the same id, add a new factory
      state = [
        ...state,
        Factory(
          factoryId: factoryId,
          name: name,
          price: price,
          production: production,
          amount: 1,
        ),
      ];
    }
  }

  int get totalProduction {
    return state.fold<int>(
        0, (total, factory) => total + factory.production * factory.amount);
  }
}
