import 'package:cookie_game/models/upgrade_c.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final upgradesProvider =
    StateNotifierProvider<UpgradesNotifier, List<UpgradeC>>((ref) {
  return UpgradesNotifier();
});

class UpgradesNotifier extends StateNotifier<List<UpgradeC>> {
  UpgradesNotifier() : super([]);

  void addUpgrade(int upgradeId, String name, int price, int power) {
    // if the state already contains an upgrade with the same id, update the upgrade amount + 1
    if (state.any((upgrade) => upgrade.upgradeId == upgradeId)) {
      state = [
        for (final upgrade in state)
          if (upgrade.upgradeId == upgradeId)
            UpgradeC(
              upgradeId: upgrade.upgradeId,
              name: upgrade.name,
              price: upgrade.price,
              power: upgrade.power,
              amount: upgrade.amount + 1,
            )
          else
            upgrade,
      ];
    } else {
      // if the state does not contain a upgrade with the same id, add a new upgrade
      state = [
        ...state,
        UpgradeC(
          upgradeId: upgradeId,
          name: name,
          price: price,
          power: power,
          amount: 1,
        ),
      ];
    }
  }

  int get totalPower {
    return state.fold<int>(
        1, (total, upgrade) => total + upgrade.power * upgrade.amount);
  }
}
