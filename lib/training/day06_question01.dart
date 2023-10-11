import 'package:flutter/material.dart';

class Day06Question01 extends StatelessWidget {
  const Day06Question01({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              const Text("プレミアム苺ショートケーキ", style: TextStyle(fontSize: 20)),
              const Text("Patisserie Naohira",
                  style: TextStyle(decoration: TextDecoration.underline, color: Colors.brown)),
              const SizedBox(height: 10),
              const Text(
                  "国産苺を通常の2倍以上サンド、飾りに使用した季節限定の大人気商品\n\n※デコレーションケーキの仕上げが写真とは異なる場合がございます。詳細はスタッフまでお問い合わせください。\n\n※６月～１０月は苺の入荷次第となりますのでご相談ください。"),
              SizedBox(
                height: 200,
                child: Image.network(
                  "https://patisserie-naohira.com/wp/wp-content/uploads/2019/06/16.jpg",
                  fit: BoxFit.contain,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(24.0),
                child: DecoratedBox(
                  decoration: BoxDecoration(
                      border: Border.all(
                    color: Colors.black12,
                  )),
                  child: const Padding(
                    padding: EdgeInsets.all(16.0),
                    child: Text(
                      "4号￥3800（12ｃｍ/3～4名様分）\n5号￥5000（15ｃｍ/5～7名様分）\n6号￥6800（18ｃｍ/8～10名様分）\n7号￥10000（21ｃｍ/11名様以上）",
                      style: TextStyle(color: Colors.brown),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
