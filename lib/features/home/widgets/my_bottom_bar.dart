import 'package:flutter/material.dart';

class MyBottomBar extends StatefulWidget {
  //final void Function(int index) changePage;
  final ValueChanged<int> changePage;
  const MyBottomBar({Key? key, required this.changePage}) : super(key: key);

  @override
  State<MyBottomBar> createState() => _MyBottomBarState();
}

class _MyBottomBarState extends State<MyBottomBar> {
  var index = 0;
  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      onTap: (value) {
        setState(() {
          index = value;
        });
        widget.changePage(index);
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
