import 'package:flutter/material.dart';

class MyGridView extends StatelessWidget {
  const MyGridView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate:
          const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
      itemCount: 10,
      itemBuilder: (context, index) {
        return Container(
          color: Colors.primaries[index],
        );
      },
    );
  }
}
