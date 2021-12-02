import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:halosis_test/helper/auth/auth_controller.dart';
import 'package:halosis_test/widget/title_app.dart';

class CustomAppBar extends StatelessWidget {
  CustomAppBar({Key? key}) : super(key: key);

  final authController = Get.put(AuthController());

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(20, 60, 20, 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  TitleApp(Colors.black),
                  SizedBox(height: 5),
                  Text.rich(
                    TextSpan(
                      children: [
                        TextSpan(text: 'List User : '),
                        TextSpan(
                          text: 'reqres.in',
                          style: TextStyle(
                            color: Colors.blue,
                            fontStyle: FontStyle.italic,
                          ),
                        ),
                      ],
                    ),
                    style: TextStyle(
                      fontSize: 16,
                    ),
                  )
                ],
              ),
              ElevatedButton(
                onPressed: () => authController.logOut(),
                child: const Text("Log out"),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
