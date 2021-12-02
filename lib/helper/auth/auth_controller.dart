import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:halosis_test/pages/root.dart';
import 'package:http/http.dart' as http;

class AuthController extends GetxController {
  GetStorage authStorage = GetStorage('authStorage');

  var emailController = TextEditingController().obs;
  var passwordController = TextEditingController().obs;

  RxBool isLogin = false.obs;
  RxBool loading = false.obs;

  @override
  void onInit() {
    checkAuth();
    super.onInit();
  }

  checkAuth() {
    if (authStorage.read('isLogin') == null || !authStorage.read('isLogin')) {
      isLogin.value = false;
    } else {
      isLogin.value = true;
    }
  }

  Future login() async {
    try {
      String? message;
      Color? color;

      Map<String, String> headers = {'Content-Type': 'application/json'};
      final body = {
        "email": emailController.value.text,
        "password": passwordController.value.text,
      };

      var resp = await http.post(
        Uri.parse('https://reqres.in/api/login'),
        body: jsonEncode(body),
        headers: headers,
      );

      if (resp.statusCode == 200) {
        message = "Berhasil login";
        color = Colors.white;

        var data = json.decode(resp.body);
        authStorage.write('token', data['token']);
        authStorage.write('isLogin', true);

        isLogin.value = true;

        showMessage(message, color);

        cleanData();

        await Future.delayed(
          const Duration(milliseconds: 800),
          () => Get.offAll(const Root()),
        );
      }
    } catch (e) {
      log(e.toString());
    }
  }

  showMessage(String message, Color color) {
    loading.value = false;

    Fluttertoast.showToast(
      msg: message,
      textColor: Colors.blue,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.SNACKBAR,
      timeInSecForIosWeb: 1,
      backgroundColor: color,
      fontSize: 16.0,
    );
  }

  logOut() {
    authStorage.write('isLogin', false);
    authStorage.remove('token');
    isLogin.value = false;
  }

  cleanData() {
    emailController.value.clear();
    passwordController.value.clear();
  }

  @override
  void dispose() {
    cleanData();
    loading.value = false;
    super.dispose();
  }
}
