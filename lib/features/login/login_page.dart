import 'dart:developer';

import 'package:first_app/design_system/my_images.dart';
import 'package:first_app/features/login/login_controller.dart';
import 'package:first_app/features/login/login_states.dart';
import 'package:first_app/shared/widgets/logo.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  static const routeName = '/login';
  LoginPage({Key? key}) : super(key: key);

  final controller = LoginController();
  final _formKey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  void onPressed() {
    log('Social Button');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
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
              TextFormField(
                validator: (value) {
                  if (value?.isEmpty ?? true) {
                    return 'Email obrigatório';
                  }
                  return null;
                },
                controller: emailController,
                decoration: InputDecoration(
                  labelText: 'Email',
                  labelStyle: Theme.of(context).textTheme.subtitle1,
                ),
              ),
              const SizedBox(height: 16),
              TextFormField(
                controller: passwordController,
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
                  onPressed: () async {
                    final navigator = Navigator.of(context);
                    if (_formKey.currentState?.validate() ?? false) {
                      final result = await controller.login(
                        emailController.text,
                        passwordController.text,
                      );
                      if (result is LoginStateError) {
                        showDialog(
                          context: context,
                          builder: (context) {
                            return AlertDialog(
                              title: const Text('Ops, algo deu errado'),
                              content: Center(
                                child: Text(result.error),
                              ),
                            );
                          },
                        );
                      }
                      if (result is LoginStateSuccess) {
                        navigator.pushReplacementNamed('home');
                      }
                    }
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
                    child: Text('ou',
                        style: Theme.of(context).textTheme.headline6),
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
