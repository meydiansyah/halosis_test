import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:halosis_test/helper/auth/auth_binding.dart';
import 'package:halosis_test/pages/root.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await GetStorage.init('authStorage');
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  void setStatusBar() {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
    ]);
  }

  @override
  Widget build(BuildContext context) {
    setStatusBar();
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Halosis Test',
      home: const Root(),
      builder: EasyLoading.init(),
      initialBinding: AuthBinding(),
    );
  }
}
