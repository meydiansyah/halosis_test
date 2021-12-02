import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:halosis_test/model/user.dart';

class CardUser extends StatelessWidget {
  final UserModel userModel;
  const CardUser(this.userModel, {Key? key}) : super(key: key);

  String username(String? first, String? last) {
    return "$first  $last";
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(20, 0, 20, 10),
      margin: const EdgeInsets.symmetric(vertical: 5),
      child: InkWell(
        borderRadius: BorderRadius.circular(10),
        onTap: () {},
        child: Padding(
          padding: const EdgeInsets.fromLTRB(10, 5, 10, 0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              SizedBox(
                height: Get.height / 1.8,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Image.network(
                    userModel.imageUrl!,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              ListTile(
                title: Text(
                  username(
                    userModel.firstName,
                    userModel.lastName,
                  ),
                ),
                subtitle: Text(userModel.email!),
              )
            ],
          ),
        ),
      ),
    );
  }
}
