import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:http/http.dart' as http;

final photosProvider = FutureProvider<List<Map<String, dynamic>>>((ref) async {
  // ローディング表示を出すため２秒の待ち時間を設定
  final _ = await Future.delayed(const Duration(seconds: 2));
  final response = await http.get(Uri.parse('https://dummyjson.com/products?limit=20'));
  final result = json.decode(response.body) as Map<String, dynamic>;
  final products = result["products"] as List<dynamic>;
  return products.map((e) => e as Map<String, dynamic>).toList();
});

class Day20 extends ConsumerWidget {
  const Day20({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final photoList = ref.watch(photosProvider);
    return Scaffold(
        appBar: AppBar(),
        body: SafeArea(
          child: photoList.when(
              data: (value) {
                return ListView.builder(
                  itemCount: value.length,
                  itemBuilder: (context, index) {
                    return ListTile(
                      leading: Image.network(value[index]['thumbnail']),
                      title: Text(value[index]['title']),
                    );
                  },
                );
              },
              error: (error, stackTrace) => Center(child: Text('Error: $error')),
              loading: () => const Center(child: CircularProgressIndicator())),
        ));
  }
}
