import 'dart:developer';

import 'package:first_app/design_system/my_images.dart';
import 'package:flutter/material.dart';

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
      body: SingleChildScrollView(
        child: Column(
          children: [
            Center(
              child: SizedBox.square(
                dimension: 110,
                child: Stack(
                  //clipBehavior: Clip.none,
                  children: [
                    Align(
                      alignment: Alignment.bottomLeft,
                      child: Container(
                        height: 100,
                        width: 100,
                        color: Colors.amber,
                        child: Image.asset(
                          img01,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    Align(
                      alignment: Alignment.topRight,
                      child: Container(
                        width: 30,
                        height: 30,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.grey.shade300,
                        ),
                        child: const Icon(Icons.close),
                      ),
                    )
                  ],
                ),
              ),
            ),
            const SizedBox(height: 16),
            SizedBox(
              height: 380,
              child: ListView.builder(
                itemCount: blogPostList.length,
                itemBuilder: (context, index) {
                  final blog = blogPostList[index];
                  return ContactWidget(
                    name: '${blog.id}',
                    profissao: blog.title,
                  );
                },
              ),
            ),
          ],
        ),
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
