import 'dart:developer';

import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  ProfilePage({Key? key}) : super(key: key);
  final secondField = FocusNode();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile Page'),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8),
            child: TextField(
              textInputAction: TextInputAction.done,
              autocorrect: false,
              style: const TextStyle(color: Colors.green, fontSize: 30),

              onChanged: (value) {
                log('${value.length}');
              },
              // onEditingComplete: () {
              //   log('passou');
              //   secondField.requestFocus();
              // },
              // onSubmitted: (value) {
              //   log(value);
              // },
              maxLines: 5,
              //maxLength: 10,
              //obscureText: true,
              obscuringCharacter: '*',
              cursorColor: Colors.pink,
              decoration: const InputDecoration(),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8),
            child: TextField(
              focusNode: secondField,
            ),
          )
        ],
      ),
    );
  }
}
