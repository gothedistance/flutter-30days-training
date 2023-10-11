import 'package:flutter/material.dart';

class Day07GridView extends StatelessWidget {
  const Day07GridView({super.key});

  @override
  Widget build(BuildContext context) {
    final items = List.generate(90, (index) => "${index + 1}");
    final colorList = [
      Colors.amber,
      Colors.blueGrey,
      Colors.brown[200],
    ];
    return Scaffold(
      appBar: AppBar(),
      body: SafeArea(
        child: GridView.builder(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
              mainAxisSpacing: 8,
              crossAxisSpacing: 8,
              childAspectRatio: 9 / 16,
            ),
            itemCount: items.length,
            itemBuilder: (BuildContext context, int index) {
              return Card(
                color: colorList[index % 3],
                child: Center(child: Text('${index + 1}')),
              );
            }),
      ),
    );
  }
}
