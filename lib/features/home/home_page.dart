import 'dart:developer';

import 'package:flutter/material.dart';

import 'widgets/widgets.dart';

class HomePage extends StatefulWidget {
  final String title;
  const HomePage({Key? key, required this.title}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var valor = 0;

  void increment() {
    setState(() {
      valor++;
    });
  }

  final items = List.generate(2000, (index) => MyWidget(index));
  final isSmallScreen = false;

  @override
  Widget build(BuildContext context) {
    //print(MediaQuery.of(context).size.height);
    final isSmallScreen = MediaQuery.of(context).size.width < 400;
    log('$isSmallScreen');
    return Scaffold(
      appBar: AppBar(
        title: Text(
          widget.title,
          style: Theme.of(context)
              .textTheme
              .bodyLarge
              ?.copyWith(fontWeight: FontWeight.w500),
        ),
        centerTitle: true,
        elevation: 0,
      ),
      body: const MyGridView(),
      floatingActionButtonLocation:
          FloatingActionButtonLocation.miniCenterDocked,
      floatingActionButton: FloatingActionButton(
        onPressed: increment,
        child: const Icon(Icons.add),
      ),
      bottomNavigationBar: const MyBottomBar(),
    );
  }
}
