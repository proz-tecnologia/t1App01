import 'dart:developer';

import 'package:flutter/material.dart';

class MyWidget extends StatelessWidget {
  final int index;
  const MyWidget(this.index, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    log('$index');
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ExpansionTile(
        title: Text('$index'),
        children: const [
          Text('Jessica'),
        ],
      ),
    );
  }
}
