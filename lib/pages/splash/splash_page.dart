import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:my_wallet_sqflite/pages/bottom_navigation.dart';
import 'package:my_wallet_sqflite/pages/login/src/utils/password_view.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void didChangeDependencies() {
    Future.delayed(
      const Duration(
        seconds: 2,
      ),
    ).then(
      (value) => Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(
          builder: (context) => PasswordInputView(
            expectedCode: "0000",
            onSuccess: ()=>Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const BottomNavigationScreen(),
                )),
            onError: () {},
          ),
        ),
        (route) => false,
      ),
    );
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return   Scaffold(
      backgroundColor: Colors.deepPurple,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Lottie.asset("lib/icons/animations/splash_animation.json"),
            const Text(
              "Hamyon UZ",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 32,
                color: Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
