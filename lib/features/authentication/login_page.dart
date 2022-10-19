import 'dart:developer';

import 'package:first_app/design_system/my_images.dart';
import 'package:first_app/shared/widgets/logo.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  static const routeName = '/login';
  const LoginPage({Key? key}) : super(key: key);

  void onPressed() {
    log('Social Button');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            const SizedBox(height: 64),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(
                  height: 50,
                  width: 50,
                  child: LogoWidget(logoHeight: 50, innerHeight: 25),
                ),
                const SizedBox(
                  width: 12.0,
                ),
                Text('PROJETO RUNAS',
                    style: Theme.of(context).textTheme.headline5),
              ],
            ),
            const SizedBox(height: 32),
            TextField(
              decoration: InputDecoration(
                labelText: 'Email',
                labelStyle: Theme.of(context).textTheme.subtitle1,
              ),
            ),
            const SizedBox(height: 16),
            TextField(
              decoration: InputDecoration(
                labelStyle: Theme.of(context).textTheme.subtitle1,
                labelText: 'Senha',
                suffixIcon: IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.visibility_off,
                    color: Color(0xFFBAC9D4),
                  ),
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 12.0),
                  child: Text('Recuperar senha',
                      style: Theme.of(context).textTheme.subtitle1),
                ),
              ],
            ),
            const SizedBox(height: 24),
            SizedBox(
              width: double.infinity,
              height: 48,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.of(context).pushNamed('home');
                },
                child: const Text(
                  'Entrar',
                  style: TextStyle(
                      color: Color(0xFF262D2A), fontWeight: FontWeight.bold),
                ),
              ),
            ),
            const SizedBox(height: 12),
            OutlinedButton(
              onPressed: () {},
              style: OutlinedButton.styleFrom(
                backgroundColor: Colors.transparent,
                foregroundColor: const Color(0xFFFFC82C),
              ),
              child: const Text('Cadastre-se'),
            ),
            const SizedBox(height: 16),
            Row(
              children: [
                const Expanded(child: Divider(color: Colors.white)),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child:
                      Text('ou', style: Theme.of(context).textTheme.headline6),
                ),
                const Expanded(child: Divider(color: Colors.white)),
              ],
            ),
            const SizedBox(height: 24),
            SocialButton(
              imagePath: google,
              text: 'Login with Google',
              onPressed: onPressed,
            ),
          ],
        ),
      ),
    );
  }
}

class SocialButton extends StatelessWidget {
  final String text;
  final String imagePath;
  final VoidCallback onPressed;

  const SocialButton({
    Key? key,
    required this.imagePath,
    required this.text,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.black,
        fixedSize: const Size.fromHeight(50),
      ),
      onPressed: onPressed,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Image.asset(
            imagePath,
            color: const Color(0xFFFFC82C),
            height: 32,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Text(
              text,
              style: const TextStyle(
                color: Color(0xFFFFC82C),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
