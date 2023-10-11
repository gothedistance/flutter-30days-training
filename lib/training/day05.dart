import 'package:flutter/material.dart';

class Day05 extends StatelessWidget {
  const Day05({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          children: [
            Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(3.0),
                  child: SizedBox(
                    height: 48,
                    child: ClipOval(
                      child: Image.network(
                          "https://yt3.ggpht.com/NFQJYn7Sot_OgAZai_ctvl2BVWAPf6xbDOFjlGAhtilvfoM8-Xd8sViPqGEbEWLwlmj5qMGrxw=s88-c-k-c0x00ffffff-no-rj"),
                    ),
                  ),
                )
              ],
            ),
            const SizedBox(width: 8),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 4),
                const Text(
                  "THE FIRST TAKE",
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
                Text(
                  "チャンネル登録者数 823万人",
                  style: TextStyle(fontSize: 12, color: Colors.grey[700]),
                )
              ],
            )
          ],
        ),
      )),
    );
  }
}
