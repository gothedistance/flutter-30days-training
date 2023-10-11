import 'package:flutter/material.dart';

class Day16 extends StatefulWidget {
  const Day16({
    Key? key,
  }) : super(key: key);

  @override
  Day16State createState() => Day16State();
}

class Day16State extends State<Day16> {
  late final ScrollController _controller;
  int page = 0;
  List<String> items = List.generate(30, (index) => "Item ${index + 1}");
  bool loading = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SafeArea(
        child: ListView.builder(
          itemCount: items.length,
          controller: _controller,
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

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  Future<void> _loadMoreData() async {
    loading = true;
    page++;
    final startIndex = 30 * page;
    await Future.delayed(const Duration(seconds: 1), () {
      setState(() {
        items.addAll(List.generate(30, (index) => "Item ${startIndex + index + 1}"));
        loading = false;
      });
    });
  }

  @override
  void initState() {
    super.initState();
    _controller = ScrollController();
    _controller.addListener(() {
      // 全体の90%までスクロールしたら次のデータを読み込む
      if (_controller.offset >= _controller.position.maxScrollExtent * 0.9 && loading == false) {
        _loadMoreData();
      }
    });
  }
}
