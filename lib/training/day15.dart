// ignore_for_file: lines_longer_than_80_chars, flutter_style_todos, no_literal_bool_comparisons

import 'package:flutter/material.dart';

class Day15 extends StatefulWidget {
  const Day15({super.key});

  @override
  State<StatefulWidget> createState() => TodoListPageState<Day15>();
}

class TodoModel {
  TodoModel({required this.todoName});
  bool isChecked = false;
  String todoName = '';
}

class TodoListPageState<TodoListPage> extends State {
  final List<TodoModel> _todoList = <TodoModel>[];
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _inputValueController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Todo List'),
      ),
      body: _todoList.isNotEmpty
          ? ListView.builder(
              itemCount: _todoList.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(
                    _todoList[index].todoName,
                    style: TextStyle(
                      decoration: _todoList[index].isChecked ? TextDecoration.lineThrough : TextDecoration.none,
                      color: _todoList[index].isChecked ? Colors.grey : null,
                      decorationThickness: 3,
                    ),
                  ),
                  trailing: Checkbox(
                    value: _todoList[index].isChecked,
                    onChanged: (value) {
                      setState(() {
                        _todoList[index].isChecked = value ?? false;
                      });
                    },
                  ),
                );
              },
            )
          : const Center(
              child: Text('ToDoがありません。', style: TextStyle(fontSize: 20)),
            ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () {
          showDialog<void>(
            context: context,
            builder: (context) {
              return AlertDialog(
                title: const Text('To Do Add'),
                content: Form(
                  key: _formKey,
                  child: TextFormField(
                    autofocus: true,
                    controller: _inputValueController,
                    validator: (value) {
                      if (value?.isEmpty ?? true) {
                        return 'タスク名を入れてください';
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
                          if (_formKey.currentState!.validate()) {
                            setState(() {
                              _todoList.add(TodoModel(todoName: _inputValueController.text));
                              _inputValueController.clear();
                            });
                            Navigator.of(context).pop();
                          }
                        },
                        child: const Text('ToDo 追加'),
                      ),
                    ],
                  ),
                ],
              );
            },
          );
        },
      ),
    );
  }
}
