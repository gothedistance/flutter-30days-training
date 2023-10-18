import 'package:flutter/material.dart';

class Day14CustomScrollView extends StatelessWidget {
  const Day14CustomScrollView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('CustomScrollView'),
      ),
      body: CustomScrollView(
        slivers: [
          const SliverAppBar(
            pinned: true,
            centerTitle: true,
            automaticallyImplyLeading: false,
            expandedHeight: 160.0,
            flexibleSpace: FlexibleSpaceBar(
              title: Text('SliverAppBar'),
              background: FlutterLogo(),
            ),
          ),
          const SliverToBoxAdapter(
            child: SizedBox(
              height: 100,
              child: Center(
                child: Text('SliverToBoxAdapter Samples'),
              ),
            ),
          ),
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (BuildContext context, int index) {
                return ListTile(title: Text("縦スクロールのリストビュー: index:${index + 1}"));
              },
              childCount: 20,
            ),
          ),
          SliverGrid(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                mainAxisSpacing: 8.0, crossAxisSpacing: 8.0, crossAxisCount: 3),
            delegate: SliverChildBuilderDelegate(
              (BuildContext context, int index) {
                return Image.network("https://picsum.photos/${100 + index}");
              },
              childCount: 20,
            ),
          ),
        ],
      ),
    );
  }
}
