import 'package:flutter/material.dart';

class ContactModel {
  String email;
  String name;
  String content;
  ContactModel(this.email, this.name, this.content);
}

// ignore: must_be_immutable
class Day08 extends StatelessWidget {
  final formKey = GlobalKey<FormState>();
  final regex = RegExp(r'\b[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\.[A-Z|a-z]{2,}\b');
  var contact = ContactModel("", "", "");

  Day08({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(),
        body: SingleChildScrollView(
          child: Form(
            key: formKey,
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text("メールアドレス", style: TextStyle(fontWeight: FontWeight.bold)),
                  TextFormField(
                    decoration: const InputDecoration(
                      hintText: 'メールアドレス',
                      border: OutlineInputBorder(),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'メールアドレスが未入力です';
                      }
                      if (!regex.hasMatch(value)) {
                        return 'メールアドレスの形式が不正です';
                      }
                      return null;
                    },
                    onSaved: (newValue) => contact.email = newValue ?? "",
                  ),
                  const SizedBox(height: 20),
                  const Text("お名前", style: TextStyle(fontWeight: FontWeight.bold)),
                  TextFormField(
                    decoration: const InputDecoration(
                      hintText: 'お名前',
                      border: OutlineInputBorder(),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'お名前が未入力です';
                      }
                      return null;
                    },
                    onSaved: (newValue) => contact.name = newValue ?? "",
                  ),
                  const SizedBox(height: 20),
                  const Text("お問い合わせ内容", style: TextStyle(fontWeight: FontWeight.bold)),
                  TextFormField(
                    minLines: 5,
                    maxLines: 5,
                    decoration: const InputDecoration(
                      hintText: 'お問い合わせ内容',
                      border: OutlineInputBorder(),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'お問い合わせ内容が未入力です';
                      }
                      return null;
                    },
                    onSaved: (newValue) => contact.content = newValue ?? "",
                  ),
                  const SizedBox(height: 20),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                        onPressed: () async {
                          if (formKey.currentState!.validate()) {
                            formKey.currentState!.save();
                            await showDialog<void>(
                                context: context,
                                builder: (_) {
                                  return AlertDialog(
                                    content: Text(
                                        "メールアドレス\n${contact.email}\nお名前: ${contact.name}\n問い合わせ内容: ${contact.content}"),
                                  );
                                });
                          }
                        },
                        child: const Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Text("送信", style: TextStyle(fontSize: 20)),
                        )),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
