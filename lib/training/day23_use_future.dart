import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class Day23UseFuture extends HookWidget {
  const Day23UseFuture({super.key});

  @override
  Widget build(BuildContext context) {
    final count = useState(0);
    final snapshot = useFuture(Future.microtask(() {
      print("aaa");
      return "useFuture";
    }));
    return Scaffold(
      appBar: AppBar(),
      body: snapshot.hasData
          ? Center(child: Text("${snapshot.data} pushed button at ${count.value} times"))
          : const Center(
              child: CircularProgressIndicator(),
            ),
      floatingActionButton: FloatingActionButton(
          onPressed: () {
            count.value += 1;
          },
          child: const Icon(Icons.add)),
    );
  }
}
