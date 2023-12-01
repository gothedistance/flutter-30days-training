import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_30days_training/freezed/user.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:http/http.dart' as http;

class UserNotifier extends FamilyAsyncNotifier<User, int> {
  @override
  FutureOr<User> build(int arg) async {
    final response = await http.get(Uri.parse('https://dummyjson.com/users/$arg'));
    final result = json.decode(response.body) as Map<String, dynamic>;
    return User.fromJson(result);
  }

  void updateFirstName(String firstName) {
    state = AsyncValue.data(state.requireValue.copyWith(firstName: firstName));
  }

  void updateLastName(String lastName) {
    state = AsyncValue.data(state.requireValue.copyWith(lastName: lastName));
  }

  void updateGender(String? gender) {
    state = AsyncValue.data(state.requireValue.copyWith(gender: gender ?? "none"));
  }
}

final userProvider = AsyncNotifierProvider.family<UserNotifier, User, int>(UserNotifier.new);

class Day21UserProfile extends ConsumerWidget {
  const Day21UserProfile({super.key, required this.userId});

  final int userId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final user = ref.watch(userProvider.call(userId));
    final notifier = ref.watch(userProvider.call(userId).notifier);

    return Scaffold(
      appBar: AppBar(),
      body: SafeArea(
        child: user.when(
          data: (data) {
            return SingleChildScrollView(
              child: Form(
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      TextFormField(
                        initialValue: data.firstName,
                        onChanged: notifier.updateFirstName,
                        decoration: const InputDecoration(
                          hintText: 'FirstName',
                          label: Text("FirstName"),
                          border: OutlineInputBorder(),
                        ),
                      ),
                      const SizedBox(height: 16),
                      TextFormField(
                        initialValue: data.lastName,
                        onChanged: notifier.updateFirstName,
                        decoration: const InputDecoration(
                          hintText: 'LastName',
                          label: Text("LastName"),
                          border: OutlineInputBorder(),
                        ),
                      ),
                      const SizedBox(height: 16),
                      const Text("gender"),
                      Row(
                        children: [
                          Row(children: [
                            Radio(
                              value: 'female',
                              groupValue: data.gender,
                              onChanged: notifier.updateGender,
                            ),
                            const Text("women")
                          ]),
                          Row(children: [
                            Radio(
                              value: 'male',
                              groupValue: data.gender,
                              onChanged: notifier.updateGender,
                            ),
                            const Text("men"),
                          ]),
                          Row(children: [
                            Radio(
                              value: 'none',
                              groupValue: data.gender,
                              onChanged: notifier.updateGender,
                            ),
                            const Text("non binary"),
                          ]),
                        ],
                      ),
                      SizedBox(
                        width: double.infinity,
                        child: ElevatedButton(
                          onPressed: () async {
                            print(data.toJson());
                          },
                          child: const Padding(
                            padding: EdgeInsets.all(8),
                            child: Text('Confirm', style: TextStyle(fontSize: 20)),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            );
          },
          error: (error, stackTrace) => Text('$error'),
          loading: () => const Center(
            child: CircularProgressIndicator(),
          ),
        ),
      ),
    );
  }
}
