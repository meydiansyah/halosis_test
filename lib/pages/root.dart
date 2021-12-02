import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:halosis_test/helper/auth/auth_controller.dart';
import 'package:halosis_test/pages/auth/auth.dart';
import 'package:halosis_test/pages/home.dart';

class Root extends GetWidget<AuthController> {
  const Root({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(() => Get.find<AuthController>().isLogin.value
        ? const HomePage()
        : const AuthPage());
  }
}
