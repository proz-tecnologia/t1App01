import 'dart:developer';

import 'package:flutter/material.dart';

class MyTextFieldWithIcon extends StatelessWidget {
  final Widget? suffixIcon;
  const MyTextFieldWithIcon({
    Key? key,
    required this.suffixIcon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
      textInputAction: TextInputAction.done,
      autocorrect: false,
      style: const TextStyle(color: Colors.green),
      onChanged: (value) {
        log(value);
      },

      // onEditingComplete: () {
      //   log('passou');
      //   secondField.requestFocus();
      // },
      // onSubmitted: (value) {
      //   log(value);
      // },
      //maxLines: 5,
      maxLength: 10,
      //obscureText: true,
      obscuringCharacter: '*',
      cursorColor: Colors.pink,
      decoration: InputDecoration(
        suffixIcon: suffixIcon,
        hintText: 'Nome',
        labelText: 'Nome',
        labelStyle: const TextStyle(color: Colors.pink),
        //errorText: 'Kaio errou',
        helperText: 'Informe seu nome',

        // counterText: 'counter',
        // border: OutlineInputBorder(
        //   borderSide: BorderSide(color: Colors.green),
        // ),
      ),
    );
  }
}
