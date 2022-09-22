import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import '../model/contato.dart';
import 'widgets/contact.dart';

class HomePage extends StatefulWidget {
  final String title;
  const HomePage({Key? key, required this.title}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var valor = 0;
  final list = <Contato>[
    Contato(
      nome: 'Kaio',
      email: '',
      profissao: 'Revisor de conteúdo',
    ),
    Contato(
      nome: 'Jackson',
      email: '',
      profissao: 'aniversariante',
    ),
    Contato(
      nome: 'Luan',
      email: '',
      profissao: 'Bailarino',
    ),
    Contato(
      nome: 'Caio',
      email: '',
      profissao: 'filosofo',
    ),
  ];

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
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            alignment: Alignment.center,
            width: 80.0,
            height: 35.0,
            decoration: BoxDecoration(
              border: Border.all(
                width: 3.0,
                color: const Color.fromARGB(255, 26, 24, 30),
              ),
              borderRadius: BorderRadius.circular(36),
            ),
            child: const Text(
              "Login ahahhajjjjaaaa",
              softWrap: false,
              overflow: TextOverflow.ellipsis,
            ),
          ),
          ...blogPostList
              .map(
                (blogPost) => ContactWidget(
                  name: blogPost.id.toString(),
                  profissao: blogPost.title,
                ),
              )
              .toList()
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
