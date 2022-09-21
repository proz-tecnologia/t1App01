import 'dart:developer';

import 'package:flutter/material.dart';

import 'widgets/contact.dart';

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

  @override
  Widget build(BuildContext context) {
    log('build');
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        centerTitle: true,
        elevation: 0,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ContactWidget(
            name: 'Kaio',
            profissao: 'Revisor de conteudo',
          ),
          ContactWidget(
            name: 'Jackson',
            profissao: 'Fera',
          ),
          ContactWidget(
            name: 'Luan',
            profissao: 'Bailarino',
          ),
          ContactWidget(
            name: 'Caio',
            profissao: 'Filosofo',
          ),
        ],
      ),
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

class MyBottomBar extends StatefulWidget {
  const MyBottomBar({Key? key}) : super(key: key);

  @override
  State<MyBottomBar> createState() => _MyBottomBarState();
}

class _MyBottomBarState extends State<MyBottomBar> {
  var index = 0;
  @override
  Widget build(BuildContext context) {
    log('build bottombar');
    return BottomNavigationBar(
      onTap: (value) {
        setState(() {
          index = value;
        });
      },
      showSelectedLabels: false,
      showUnselectedLabels: false,
      currentIndex: index,
      items: const [
        BottomNavigationBarItem(
          icon: Icon(Icons.person),
          label: 'Profile',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          label: 'Home',
        ),
      ],
    );
  }
}
