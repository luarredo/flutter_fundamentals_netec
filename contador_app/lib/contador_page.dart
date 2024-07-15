import 'package:contador_app/count_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

class ContadorPage extends ConsumerWidget {
  const ContadorPage({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Contador App'),
      ),
      body: SizedBox(
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'Contador:',
            ),
            Text(
              '${ref.watch(counterProvider)}',
              style: const TextStyle(
                fontSize: 48,
              ),
            ),
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          FloatingActionButton(
            onPressed: () => ref.read(counterProvider.notifier).increment(),
            child: Icon(PhosphorIcons.plus()),
          ),
          const SizedBox(width: 24),
          FloatingActionButton(
            onPressed: () => ref.read(counterProvider.notifier).decrement(),
            child: Icon(PhosphorIcons.minus()),
          ),
          const SizedBox(width: 24),
          FloatingActionButton(
            onPressed: () => ref.read(counterProvider.notifier).reset(),
            child: Icon(PhosphorIcons.arrowClockwise()),
          ),
        ],
      ),
    );
  }
}
