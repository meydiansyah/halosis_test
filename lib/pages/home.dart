import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:halosis_test/helper/api_controller.dart';
import 'package:halosis_test/model/user.dart';
import 'package:halosis_test/widget/custom_appbar.dart';
import 'package:halosis_test/widget/custom_card.dart';
import 'package:halosis_test/widget/custom_linear_progress_indicator.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final controller = Get.put(ApiController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            CustomAppBar(),
            FutureBuilder<List<UserModel>>(
              future: controller.getAllUsers(),
              builder: (context, snapshot) {
                if (!snapshot.hasData) {
                  return const CustomLinearProgressIndicator();
                } else {
                  return Column(
                    children: snapshot.data!.map((e) => CardUser(e)).toList(),
                  );
                }
              },
            )
          ],
        ),
      ),
    );
  }
}
