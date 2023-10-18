import 'package:flutter/material.dart';

class Day14NestedScrollView extends StatelessWidget {
  const Day14NestedScrollView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        body: NestedScrollView(
          headerSliverBuilder: (context, innerBoxIsScrolled) => [
            SliverAppBar(
              title: const Text('App Bar'),
              expandedHeight: 200,
              pinned: true,
              forceElevated: innerBoxIsScrolled,
              bottom: const TabBar(tabs: [
                Tab(text: 'Tab 1'),
                Tab(text: 'Tab 2'),
              ]),
            )
          ],
          body: TabBarView(
            children: [
              ListView.builder(
                itemBuilder: (context, index) => ListTile(
                  title: Text(
                    'Tab 1 content $index',
                  ),
                ),
              ),
              ListView.builder(
                itemBuilder: (context, index) => ListTile(
                  title: Text(
                    'Tab 2 content $index',
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
