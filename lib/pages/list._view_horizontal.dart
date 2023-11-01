import 'package:flutter/material.dart';

class ListViewHorizontal extends StatelessWidget {
  const ListViewHorizontal({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(children: [
        Expanded(
          flex: 2,
          child: ListView(
            scrollDirection: Axis.horizontal,
            children: [
              Card(
                elevation: 8,
                child: Image.asset(
                  'assets/logo.png',
                ),
              ),
              Card(
                elevation: 8,
                child: Image.asset(
                  'assets/logo.png',
                ),
              ),
              Card(
                elevation: 8,
                child: Image.asset(
                  'assets/logo.png',
                ),
              ),
            ],
          ),
        ),
        Expanded(flex: 3, child: Container())
      ]),
    );
  }
}
