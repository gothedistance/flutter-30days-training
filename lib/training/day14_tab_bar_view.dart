import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Day14TabBarView extends StatelessWidget {
  const Day14TabBarView({super.key});

  @override
  Widget build(BuildContext context) {
    final tabHeaders = [
      "smartphones",
      "laptops",
      "fragrances",
      "skincare",
    ];
    return DefaultTabController(
      length: tabHeaders.length,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Tab Controller'),
          bottom: PreferredSize(
            preferredSize: const Size.fromHeight(30.0),
            child: TabBar(
              isScrollable: true,
              tabs: tabHeaders.map((String tab) {
                return Tab(text: tab);
              }).toList(),
            ),
          ),
        ),
        body: TabBarView(children: tabHeaders.map((tab) => EachTabPage(title: tab)).toList()),
      ),
    );
  }
}

class EachTabPage extends StatelessWidget {
  const EachTabPage({super.key, required this.title});
  final String title;

  Future<List<Map<String, dynamic>>> getPhoto() async {
    // ローディング表示を出すため２秒の待ち時間を設定
    final _ = await Future.delayed(const Duration(seconds: 2));
    final response = await http.get(Uri.parse('https://dummyjson.com/products/category/$title'));
    if (response.statusCode == 200) {
      final result = json.decode(response.body) as Map<String, dynamic>;
      final products = result["products"] as List<dynamic>;
      return products.map((e) => e as Map<String, dynamic>).toList();
    } else {
      throw Exception('Failed to load photos');
    }
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: getPhoto(),
      builder: ((context, snapshot) {
        if (snapshot.hasError) {
          return Text(snapshot.error.toString());
        }
        if (snapshot.hasData) {
          return ListView.builder(
            itemCount: snapshot.data!.length,
            itemBuilder: (context, index) {
              return ListTile(
                leading: Image.network(snapshot.data![index]['thumbnail']),
                title: Text(snapshot.data![index]['title']),
              );
            },
          );
        }
        return const Scaffold(body: Center(child: CircularProgressIndicator()));
      }),
    );
  }
}
