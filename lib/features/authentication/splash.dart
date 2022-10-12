import 'package:first_app/shared/widgets/logo.dart';
import 'package:flutter/material.dart';

import '../login/login_page.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 3)).then((value) {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(
          builder: (context) => const LoginPage(),
          fullscreenDialog: true,
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final logoHeight = size.height * 0.25;
    final innerHeight = size.height * 0.10;

    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              children: [
                LogoWidget(
                  logoHeight: logoHeight,
                  innerHeight: innerHeight,
                )
              ],
            ),
            SizedBox(height: innerHeight),
            // Container(
            //   alignment: Alignment.center,
            //   padding: const EdgeInsets.all(68),
            //   width: logoWidth, //0.47
            //   height: logoHeight, //0.26
            //   decoration: const BoxDecoration(
            //     color: Color(0xFFFFC82C),
            //     shape: BoxShape.circle,
            //   ),
            //   child: Container(
            //     decoration: const BoxDecoration(
            //       color: Colors.black,
            //       shape: BoxShape.circle,
            //     ),
            //   ),
            // ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24.0),
              child: Text(
                'PROJETO RUNAS',
                textAlign: TextAlign.center,
                style: Theme.of(context)
                    .textTheme
                    .headline4
                    ?.apply(fontSizeFactor: 0.8),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24.0),
              child: Text(
                'One rune to rule them all',
                style: Theme.of(context)
                    .textTheme
                    .headline6
                    ?.apply(fontSizeFactor: 0.8),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
