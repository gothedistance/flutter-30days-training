import 'package:flutter/material.dart';

class Day04 extends StatelessWidget {
  const Day04({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SafeArea(
          child: Center(
        child: DecoratedBox(
          decoration: BoxDecoration(border: Border.all()),
          child: const Padding(
            padding: EdgeInsets.all(24),
            child: Text("Flutterに興味を持ってくれてありがとう！"),
          ),
        ),
      )),
    );
  }
}
