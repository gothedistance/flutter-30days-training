import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final tabHeaders = [
  "smartphones",
  "laptops",
  "fragrances",
  "skincare",
];

final dummyItemProvider = FutureProvider.family<List<String>, String>((ref, key) async {
  final random = math.Random();
  return Future.delayed(const Duration(seconds: 1), () {
    return List.generate(30, (page) => "$key: Item ${random.nextInt(1000)}");
  });
});

class Day22 extends StatelessWidget {
  const Day22({super.key});

  @override
  Widget build(BuildContext context) {
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
        body: TabBarView(children: tabHeaders.map((tab) => TabPage(title: tab)).toList()),
      ),
    );
  }
}

class TabPage extends ConsumerWidget {
  const TabPage({super.key, required this.title});

  final String title;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final items = ref.watch(dummyItemProvider.call(title));

    return items.when(
      data: (data) {
        return RefreshIndicator(
          onRefresh: () async => ref.invalidate(dummyItemProvider.call(title)),
          child: ListView.builder(
            itemCount: data.length,
            itemBuilder: (context, index) {
              return ListTile(
                title: Text(data[index]),
                tileColor: index.isEven ? Colors.transparent : Colors.black12,
              );
            },
          ),
        );
      },
      error: ((error, stackTrace) => Text("$error")),
      loading: () => const Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}
