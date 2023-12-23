import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final todoListProvider = NotifierProvider<TodoListNotifier, List<Todo>>(TodoListNotifier.new);

class Day19 extends ConsumerWidget {
  Day19({super.key});

  final controller = TextEditingController();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final todoList = ref.watch(todoListProvider);

    return Scaffold(
      appBar: AppBar(),
      body: ListView(
        children: [
          for (final todo in todoList)
            CheckboxListTile(
              value: todo.completed,
              onChanged: (value) => ref.read(todoListProvider.notifier).toggle(todo.id),
              title: Text(
                todo.description,
                style: todo.completed ? const TextStyle(decoration: TextDecoration.lineThrough) : null,
              ),
            ),
        ],
      ),
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
                          ref.read(todoListProvider.notifier).addTodo(
                                Todo(id: math.Random().toString(), description: controller.text, completed: false),
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
}

class TodoListNotifier extends Notifier<List<Todo>> {
  @override
  List<Todo> build() => [];

  // Todo の追加
  void addTodo(Todo todo) {
    // 既存 Todo と新規 Todo を含む新しいリストを作成します。
    // stateがfinalになっているため、スプレッド演算子を使います。
    // 配列にある要素を全て展開してくれる構文です。
    state = [...state, todo];
  }

  // Todo の完了ステータスの変更
  void toggle(String todoId) {
    state = [
      for (final todo in state)
        // ID がマッチした Todo のみ、完了ステータスを変更
        if (todo.id == todoId) todo.copyWith(completed: !todo.completed) else todo,
    ];
  }
}
