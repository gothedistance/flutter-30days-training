import 'dart:async';
import 'dart:convert';
import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Todo {
  const Todo({required this.id, required this.description, required this.completed});

  final String id;
  final String description;
  final bool completed;

  Todo copyWith({String? id, String? description, bool? completed}) {
    return Todo(
      id: id ?? this.id,
      description: description ?? this.description,
      completed: completed ?? this.completed,
    );
  }

  factory Todo.fromJson(Map<String, dynamic> json) {
    return Todo(
      id: json['id'] as String,
      description: json['description'] as String,
      completed: json['completed'] as bool,
    );
  }

  Map<String, dynamic> toJson() => {
        "id": id,
        "description": description,
        "completed": completed,
      };
}

class ToDoListAsyncNotifier extends AsyncNotifier<List<Todo>> {
  final String key = "todo_list";

  @override
  FutureOr<List<Todo>> build() async {
    return _load();
  }

  Future<void> toggle(String id) async {
    state = const AsyncLoading();
    state = await AsyncValue.guard(() async {
      final todoList = [
        for (final todo in state.requireValue)
          if (todo.id == id) todo.copyWith(completed: !todo.completed) else todo,
      ];
      await save(todoList);
      return _load();
    });
  }

  Future<void> save(List<Todo> todoList) async {
    final pref = await SharedPreferences.getInstance();
    final json = jsonEncode(todoList);
    await pref.setString(key, json);
  }

  Future<List<Todo>> _load() async {
    final pref = await SharedPreferences.getInstance();
    final json = pref.getString(key);
    if (json == null) {
      return [];
    }
    final list = jsonDecode(json) as List<dynamic>;
    return list.map((e) => Todo.fromJson(e as Map<String, dynamic>)).toList();
  }

  Future<void> add(Todo todo) async {
    state = const AsyncLoading();
    state = await AsyncValue.guard(() async {
      final todoList = [...state.requireValue, todo];
      await save(todoList);
      return _load();
    });
  }
}

final toDoListProvider = AsyncNotifierProvider<ToDoListAsyncNotifier, List<Todo>>(ToDoListAsyncNotifier.new);

class Day21 extends HookConsumerWidget {
  const Day21({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final todoList = ref.watch(toDoListProvider);
    final controller = useTextEditingController();
    return Scaffold(
      appBar: AppBar(),
      body: switch (todoList) {
        AsyncData(value: final todoList) => ListView(children: [
            for (final todo in todoList)
              CheckboxListTile(
                value: todo.completed,
                onChanged: (value) => ref.read(toDoListProvider.notifier).toggle(todo.id),
                title: Text(
                  todo.description,
                  style: todo.completed ? const TextStyle(decoration: TextDecoration.lineThrough) : null,
                ),
              ),
          ]),
        AsyncError(:final error) => Text('Error: $error'),
        _ => const CircularProgressIndicator(),
      },
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showDialog<void>(
            context: context,
            builder: (context) {
              return AlertDialog(
                title: const Text('Todo追加'),
                content: Form(
                  child: TextFormField(
                    controller: controller,
                    autofocus: true,
                    validator: (value) {
                      if (value != null && value.isEmpty) {
                        return 'タスク名を入れて下さい';
                      }
                      return null;
                    },
                  ),
                ),
                actions: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      ElevatedButton(
                        onPressed: () {
                          ref.read(toDoListProvider.notifier).add(
                                Todo(
                                    id: math.Random().nextDouble().toString(),
                                    description: controller.text,
                                    completed: false),
                              );
                          controller.clear();
                          Navigator.of(context).pop();
                        },
                        child: const Text('追加'),
                      )
                    ],
                  )
                ],
              );
            },
          );
        },
        tooltip: 'Add Todo',
        child: const Icon(Icons.add),
      ), // This trailing com
    );
  }
}
