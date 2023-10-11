import 'package:flutter/material.dart';

class Day06Question02 extends StatelessWidget {
  const Day06Question02({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  "失敗しない！簡単ショートケーキ",
                  style: TextStyle(fontSize: 18),
                ),
                ElevatedButton.icon(onPressed: () {}, icon: const Icon(Icons.bookmark), label: const Text("保存"))
              ],
            ),
            Row(
              children: [
                Expanded(
                  child: Column(
                    children: [
                      Image.network("https://img.cpcdn.com/recipes/1075274/894x1461s/4030b027a039e1b6b4a6e61c2ed3dbb3")
                    ],
                  ),
                ),
                const Expanded(
                  child: Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Column(
                      children: [
                        Text("計量が簡単。ふんわりと高さがだせます。誕生日、クリスマス、バレンタインなどアレンジ無限大！2013.2.17話題入り♪"),
                        SizedBox(height: 10),
                        Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
                          Column(
                            children: [
                              Row(
                                children: [
                                  Icon(Icons.star),
                                  Icon(Icons.star),
                                  Icon(Icons.star),
                                ],
                              )
                            ],
                          ),
                          Column(
                            children: [Text("123 fav")],
                          )
                        ]),
                      ],
                    ),
                  ),
                )
              ],
            ),
            const Padding(
              padding: EdgeInsets.only(top: 10, bottom: 10),
              child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "材料",
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  )),
            ),
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [Text("卵"), Text("３個")],
            ),
            const Divider(thickness: 1),
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [Text("グラニュー糖"), Text("６０ｇ")],
            ),
            const Divider(thickness: 1),
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [Text("薄力粉"), Text("６０ｇ")],
            ),
            const Divider(thickness: 1),
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [Text("溶かしバター"), Text("２０ｇ")],
            ),
            const Divider(thickness: 1),
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [Text("生クリーム+砂糖"), Text("２００ｃｃ～+15ｇ～")],
            ),
            const Divider(thickness: 1),
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [Text("☆フルーツ缶のシロップ"), Text("大さじ３")],
            ),
            const Divider(thickness: 1),
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [Text("☆苺のリキュール(あれば)"), Text("大さじ１")],
            ),
            const Divider(thickness: 1),
          ]),
        ),
      ),
    );
  }
}
