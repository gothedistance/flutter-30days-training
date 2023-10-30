import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class Day23CounterApp extends HookWidget {
  const Day23CounterApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final count = useState(0);

    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '${count.value}',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => count.value++,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}
