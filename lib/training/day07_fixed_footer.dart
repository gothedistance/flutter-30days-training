import 'package:flutter/material.dart';

class Day07FixedFooter extends StatelessWidget {
  const Day07FixedFooter({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: Scrollbar(
                child: SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                      const Text("SingleChildScrollViewのサンプル"),
                      const SizedBox(height: 10),
                      const Text("childで指定したUIが一度にすべてビルドされる。利用頻度はそんなに高くない"),
                      const SizedBox(height: 10),
                      const Text("デバイスの高さを超えたUIを作る場合、スクロールできるビューを使わ兄とRender Overflowエラーが発生する"),
                      const SizedBox(height: 10),
                      const SizedBox(height: 10),
                      TextFormField(
                        maxLength: 30,
                        decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: '貴社名',
                          suffixIcon: Icon(Icons.store),
                        ),
                      ),
                      const SizedBox(height: 10),
                      TextFormField(
                        maxLength: 20,
                        decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: 'おふりがな',
                          hintText: 'かな・カナどちらでも',
                        ),
                      ),
                      const SizedBox(height: 10),
                      TextFormField(
                        maxLength: 60,
                        decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: 'メールアドレス',
                          suffixIcon: Icon(Icons.mail),
                        ),
                      ),
                      const SizedBox(height: 10),
                      TextFormField(
                        maxLength: 40,
                        decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: 'パスワード',
                          hintText: '',
                        ),
                      ),
                      const SizedBox(height: 10),
                      TextFormField(
                        maxLength: 10,
                        decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: '郵便番号',
                        ),
                      ),
                      const SizedBox(height: 10),
                      TextFormField(
                        maxLength: 60,
                        decoration: const InputDecoration(border: OutlineInputBorder(), labelText: 'ご住所'),
                      ),
                      const SizedBox(height: 10),
                      TextFormField(
                        maxLength: 40,
                        decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: '建物名など',
                        ),
                      ),
                      const SizedBox(height: 10),
                      TextFormField(
                        maxLength: 20,
                        decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: 'TEL',
                          hintText: '電話番号',
                          suffixIcon: Icon(Icons.phone),
                        ),
                      ),
                      const SizedBox(height: 10),
                      TextFormField(
                        maxLength: 20,
                        decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: 'FAX',
                          hintText: 'FAX',
                          suffixIcon: Icon(Icons.print),
                        ),
                      ),
                      const SizedBox(height: 10),
                      TextFormField(
                        decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: 'ホームページ等',
                          hintText: 'その他WebページやSNSのアドレス',
                          suffixIcon: Icon(Icons.web),
                        ),
                      ),
                    ]),
                  ),
                ),
              ),
            ),
            ElevatedButton(
              onPressed: () {},
              child: const Text("この内容で送信する"),
            ),
          ],
        ),
      ),
    );
  }
}
