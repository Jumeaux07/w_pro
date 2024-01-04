import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AppBarAuth extends StatelessWidget {
  const AppBarAuth({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 20),
        height: Get.height * 0.4,
        width: Get.width,
        child: Image.asset("assets/logos/logo.png"),
      ),
    );
  }
}
