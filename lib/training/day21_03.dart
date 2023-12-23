import 'dart:async';

import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class ItemList {
  final List<String> items;
  final int currentPage;
  final int perPage;
  ItemList({required this.items, this.currentPage = 0, this.perPage = 30});

  ItemList copyWith({List<String>? items, int? currentPage}) {
    return ItemList(items: items ?? this.items, currentPage: currentPage ?? this.currentPage);
  }
}

class ItemListNotifier extends AsyncNotifier<ItemList> {
  @override
  FutureOr<ItemList> build() async {
    // dummyData
    final items = List.generate(30, (index) => "Item ${index + 1}");
    return ItemList(items: items);
  }

  Future<void> loadMore() async {
    final startIndex = (state.requireValue.currentPage + 1) * state.requireValue.perPage;
    await Future.delayed(const Duration(seconds: 1), () {
      final appends = List.generate(30, (index) => "Item ${startIndex + index + 1}");
      state = AsyncData(state.requireValue
          .copyWith(items: state.requireValue.items + appends, currentPage: state.requireValue.currentPage + 1));
    });
  }
}

final itemListProvider = AsyncNotifierProvider<ItemListNotifier, ItemList>(ItemListNotifier.new);

class Day21_03 extends ConsumerWidget {
  const Day21_03({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final items = ref.watch(itemListProvider);
    final notifier = ref.watch(itemListProvider.notifier);

    return Scaffold(
      appBar: AppBar(),
      body: SafeArea(
          child: items.when(
              data: (data) {
                return ListView.builder(
                  itemCount: data.items.length,
                  itemBuilder: (context, index) {
                    if (data.items.length == index + 1) {
                      notifier.loadMore();
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    }

                    return ListTile(
                      title: Text(data.items[index]),
                      tileColor: index.isEven ? Colors.transparent : Colors.black12,
                    );
                  },
                );
              },
              error: ((error, stackTrace) => Text("$error")),
              loading: () => const Center(
                    child: CircularProgressIndicator(),
                  ))),
    );
  }
}
