import 'package:flutter_riverpod/flutter_riverpod.dart';

final counterProvider = NotifierProvider<_CounterProvider, int>(
  () => _CounterProvider(),
);

class _CounterProvider extends Notifier<int> {

  @override
  int build() {
    return 0;
  }

  void increment() {
    state++;
  }

  void decrement() {
    state--;
  }

  void reset() {
    state = 0;
  }
  
}
