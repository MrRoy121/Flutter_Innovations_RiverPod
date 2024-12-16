import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../model/counter.dart';

class CounterNotifier extends StateNotifier<Counter> {
  CounterNotifier() : super(Counter(0));

  void increment() {
    state.increment();
    state = Counter(state.value);
  }
}

final counterProvider = StateNotifierProvider<CounterNotifier, Counter>((ref) {
  return CounterNotifier();
});