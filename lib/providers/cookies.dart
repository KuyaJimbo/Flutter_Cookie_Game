import 'package:flutter_riverpod/flutter_riverpod.dart';

final cookieProvider = StateNotifierProvider<CookieNotifier, int>((ref) {
  return CookieNotifier();
});

class CookieNotifier extends StateNotifier<int> {
  CookieNotifier() : super(0);

  void incrementBy(int value) {
    state += value;
  }

  void decrementBy(int value) {
    state -= value;
  }
}
