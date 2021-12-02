import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:halosis_test/pages/auth/login.dart';
import 'package:halosis_test/widget/custom_linear_progress_indicator.dart';
import 'package:halosis_test/widget/title_app.dart';

class AuthPage extends StatefulWidget {
  const AuthPage({Key? key}) : super(key: key);

  @override
  _AuthPageState createState() => _AuthPageState();
}

class _AuthPageState extends State<AuthPage> {
  // AuthController authController = Get.find();

  @override
  Widget build(BuildContext context) {
    Future.delayed(const Duration(milliseconds: 5500), () {
      return Get.to(
        const LoginPage(),
        duration: const Duration(milliseconds: 2500),
      );
    });

    return Scaffold(
      backgroundColor: Colors.blue,
      body: SafeArea(
        child: Stack(
          children: const [
            SizedBox.expand(
              child: Center(
                child: TitleApp(Colors.white),
              ),
            ),
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: CustomLinearProgressIndicator(),
            )
          ],
        ),
      ),
    );
  }
}
