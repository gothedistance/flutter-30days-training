import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Day11 extends StatelessWidget {
  const Day11({super.key});

  Future<List<Map<String, dynamic>>> getPhoto() async {
    // ローディング表示を出すため２秒の待ち時間を設定
    final _ = await Future.delayed(const Duration(seconds: 2));
    final response = await http.get(Uri.parse('https://jsonplaceholder.typicode.com/photos?limit=10'));
    if (response.statusCode == 200) {
      final result = json.decode(response.body) as List<dynamic>;
      return result.map((e) => e as Map<String, dynamic>).toList();
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
          return Scaffold(
            body: ListView.builder(
              itemCount: snapshot.data?.length,
              itemBuilder: (context, index) {
                return ListTile(
                  leading: Image.network(snapshot.data?[index]['thumbnailUrl']),
                  title: Text(snapshot.data?[index]['title']),
                );
              },
            ),
          );
        }
        return const Center(child: CircularProgressIndicator());
      }),
    );
  }
}
