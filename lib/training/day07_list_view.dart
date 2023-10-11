import 'package:flutter/material.dart';

class Day07ListView extends StatelessWidget {
  const Day07ListView({super.key});

  @override
  Widget build(BuildContext context) {
    final items = List.generate(100, (index) => "${index + 1}");
    return Scaffold(
      appBar: AppBar(),
      body: SafeArea(
        child: ListView.builder(
          itemCount: items.length,
          itemBuilder: (context, index) {
            return ListTile(
              title: Text(items[index]),
              tileColor: index.isEven ? Colors.transparent : Colors.black12,
            );
          },
        ),
      ),
    );
  }
}
