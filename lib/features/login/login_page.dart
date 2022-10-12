import 'package:first_app/shared/widgets/logo.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
            const TextField(),
          ],
        ),
      ),
    );
  }
}
