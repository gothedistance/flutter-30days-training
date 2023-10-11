import 'package:flutter/material.dart';

class Day09 extends StatelessWidget {
  const Day09({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SafeArea(
        child: Center(
          child: ElevatedButton(
            onPressed: () async {
              final result = await showDialog<bool>(
                context: context,
                builder: (_) {
                  return AlertDialog(
                    title: const Text("最終確認"),
                    content: const Text("送信していいとも？"),
                    actions: <Widget>[
                      // ボタン領域
                      TextButton(
                        child: const Text("キャンセル"),
                        onPressed: () => Navigator.of(context).pop(false),
                      ),
                      TextButton(
                        child: const Text("いいとも"),
                        onPressed: () => Navigator.of(context).pop(true),
                      ),
                    ],
                  );
                },
              );
              if (result ?? false) {
                print("いいとも！");
              }
            },
            child: const Text("test"),
          ),
        ),
      ),
    );
  }
}
