import 'package:flutter/material.dart';

class Day14PageView extends StatefulWidget {
  const Day14PageView({super.key});

  @override
  State<Day14PageView> createState() => Day14PageViewState();
}

class Day14PageViewState extends State<Day14PageView> {
  final PageController controller = PageController();

  int currentPage = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SafeArea(
        child: Stack(
          children: [
            PageView(
              controller: controller,
              onPageChanged: (value) {
                setState(() {
                  currentPage = value.toInt();
                });
              },
              children: <Widget>[
                const Center(
                  child: Text(
                    'First Page',
                    style: TextStyle(fontSize: 24),
                  ),
                ),
                ColoredBox(
                  color: Colors.blue.shade100,
                  child: const Center(
                    child: Text(
                      'Second Page',
                      style: TextStyle(fontSize: 24),
                    ),
                  ),
                ),
                ColoredBox(
                  color: Colors.red.shade200,
                  child: const Center(
                    child: Text(
                      'Third Page',
                      style: TextStyle(fontSize: 24),
                    ),
                  ),
                ),
              ],
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Padding(
                  padding: const EdgeInsets.only(bottom: 20),
                  child: PageDotIndicator(
                    length: 3,
                    currentPage: currentPage,
                    onTap: (page) {
                      controller.jumpToPage(page);
                    },
                  )),
            )
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }
}

class PageDotIndicator extends StatelessWidget {
  const PageDotIndicator({
    super.key,
    required this.length,
    required this.currentPage,
    required this.onTap,
  });

  final int length;
  final int currentPage;
  final Function(int) onTap;

  @override
  Widget build(BuildContext context) {
    return Wrap(
      children: [
        for (final i in List.generate(length, (index) => index))
          InkWell(
            onTap: () => onTap(i),
            child: Container(
              width: 32,
              height: 32,
              margin: const EdgeInsets.all(4),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: i == currentPage ? Colors.blue : Colors.grey,
              ),
            ),
          ),
      ],
    );
  }
}
