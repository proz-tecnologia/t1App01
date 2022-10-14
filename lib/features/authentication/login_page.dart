import 'package:first_app/design_system/my_images.dart';
import 'package:first_app/shared/widgets/logo.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  static const routeName = '/login';
  const LoginPage({Key? key}) : super(key: key);

  void onPressed() {
    print('outrooo clicou');
  }

  void outro() {
    print('kaioo legal');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const SizedBox(height: kToolbarHeight),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ///TODO: Ajeitar o espaçamento aqui
                const Spacer(),
                const LogoWidget(
                  logoHeight: 50,
                  innerHeight: 25,
                ),
                const SizedBox(width: 8),
                Text('PROJETO RUNAS',
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.headline5),
                const Spacer(),
              ],
            ),
            const SizedBox(height: 16),
            const TextField(),
            const SizedBox(height: 16),
            TextField(
              decoration: InputDecoration(
                suffixIcon: IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.visibility_off),
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 8.0),
                  child: Text('Recuperar senha',
                      style: Theme.of(context).textTheme.subtitle1),
                ),
              ],
            ),
            const SizedBox(height: 16),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.of(context).pushNamed('home');
                },
                child: const Text('Entrar'),
              ),
            ),
            const SizedBox(height: 16),
            OutlinedButton(
              onPressed: () {},
              child: const Text('Olaa'),
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
            const SizedBox(height: 16),
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
        primary: Colors.black,
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
