import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'training/day03.dart';
import 'training/day04.dart';
import 'training/day05.dart';
import 'training/day06_question01.dart';
import 'training/day06_question02.dart';
import 'training/day07.dart';
import 'training/day07_fixed_footer.dart';
import 'training/day07_grid_view.dart';
import 'training/day07_list_view.dart';
import 'training/day08.dart';
import 'training/day09.dart';
import 'training/day11.dart';
import 'training/day14.dart';
import 'training/day15.dart';
import 'training/day16.dart';
import 'training/day17.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ProviderScope(
      child: MaterialApp(
        home: Scaffold(
          appBar: AppBar(title: const Text("Flutter UI実装トレーニング")),
          body: ListView(children: [
            _GalleryItem(
              title: 'Day03 Hello World',
              builder: (context) => const Day03(),
            ),
            _GalleryItem(
              title: 'Day04 ボックスを作って表示する',
              builder: (context) => const Day04(),
            ),
            _GalleryItem(
              title: 'Day05 YouTubeっぽいUI',
              builder: (context) => const Day05(),
            ),
            _GalleryItem(
              title: 'Day06 練習問題 No.1',
              builder: (context) => const Day06Question01(),
            ),
            _GalleryItem(
              title: 'Day06 練習問題 No.2',
              builder: (context) => const Day06Question02(),
            ),
            _GalleryItem(
              title: 'Day07 SingleChildScrollView',
              builder: (context) => const Day07(),
            ),
            _GalleryItem(
              title: 'Day07 SingleChildScrollView with 固定フッター',
              builder: (context) => const Day07FixedFooter(),
            ),
            _GalleryItem(
              title: 'Day07 ListViewサンプル',
              builder: (context) => const Day07ListView(),
            ),
            _GalleryItem(
              title: 'Day07 GridViewサンプル',
              builder: (context) => const Day07GridView(),
            ),
            _GalleryItem(
              title: 'Day08 お問合せフォーム',
              builder: (context) => Day08(),
            ),
            _GalleryItem(
              title: 'Day09 ダイアログを表示する',
              builder: (context) => const Day09(),
            ),
            _GalleryItem(
              title: 'Day11 ListViewとFutureBuilder',
              builder: (context) => const Day11(),
            ),
            _GalleryItem(
              title: 'Day14 カウンターアプリ(setState)',
              builder: (context) => const Day14(title: "カウンターアプリ"),
            ),
            _GalleryItem(
              title: 'Day15 Todoアプリ(setState)',
              builder: (context) => const Day15(),
            ),
            _GalleryItem(
              title: 'Day16 無限スクロール',
              builder: (context) => const Day16(),
            ),
            _GalleryItem(
              title: 'Day17 カウンターアプリ(Riverpod)',
              builder: (context) => const Day17(),
            ),
          ]),
        ),
      ),
    );
  }
}

class _GalleryItem extends StatelessWidget {
  const _GalleryItem({required this.title, required this.builder});

  final String title;
  final WidgetBuilder builder;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(title),
      leading: const Icon(Icons.star),
      trailing: const Icon(Icons.chevron_right),
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute<void>(
            builder: builder,
          ),
        );
      },
    );
  }
}
