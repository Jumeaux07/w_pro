import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:w_pro/config/colors.config.dart';
import 'package:w_pro/models/annonceur.model.dart';
import 'package:w_pro/screens/auth/login.screen.dart';
import 'package:w_pro/screens/home.screen.dart';
import 'package:w_pro/services/auth/login.service.dart';
import 'package:w_pro/services/auth/register.service.dart';

class AuthController extends GetxController {
  Rx<AnnonceurModel?> annonceurModel = Rx<AnnonceurModel?>(null);
  final phoneTextEditing = TextEditingController().obs;
  final nomprenomTextEditing = TextEditingController().obs;
  final passwordTextEditing = TextEditingController().obs;
  final confirmationTextEditing = TextEditingController().obs;
  final RxBool isLoading = false.obs;

  //login function
  void login(String phone, String password) async {
    if (phone.isEmpty || password.isEmpty) {
      Get.snackbar("Erreur", "Veuillez remplir tous les champs",
          backgroundColor: Colors.redAccent, colorText: Colors.white);
    } else {
      try {
        isLoading.value = true;
        final response = await LoginService().login(phone, password);
        if (response.statusCode == 200) {
          annonceurModel.value = AnnonceurModel.fromJson(response.body);
          log("${annonceurModel.value?.accessToken}");
          Get.to(() => const HomeScreen());
          isLoading.value = false;
        } else {
          log("Erreur login anoonceur => ${response.body}");
          Get.snackbar("Notification", "${response.body['message']}",
              backgroundColor: Colors.redAccent, colorText: Colors.white);
          isLoading.value = false;
        }
      } catch (e) {
        log("Exception login => $e");
        Get.snackbar("Notification",
            "Une erreur s'est produites lors de l'inscription, Exception : $e",
            backgroundColor: Colors.redAccent, colorText: Colors.white);
        isLoading.value = false;
      }
    }
  }

  void register(String nomprenoms, String phone1, String password,
      String confirmation) async {
    if (nomprenoms.isEmpty ||
        phone1.isEmpty ||
        password.isEmpty ||
        confirmation.isEmpty) {
      Get.snackbar("Erreur", "Veuillez remplir tous les champs",
          backgroundColor: Colors.redAccent, colorText: Colors.white);
    } else {
      try {
        isLoading.value = true;
        final response = await RegisterService()
            .register(nomprenoms, phone1, password, confirmation);
        if (response.statusCode == 201) {
          Get.to(() => Login());
          Get.snackbar("Notification",
              "Inscription réussie! Veuillez vous connecter svp.",
              backgroundColor: AppColors.primaryColor, colorText: Colors.white);
          isLoading.value = false;
        } else {
          Get.snackbar("Notification", "Informations invalident",
              backgroundColor: Colors.redAccent, colorText: Colors.white);
          log("Erreur register anoonceur => ${response.body}");
          isLoading.value = false;
        }
      } catch (e) {
        log("Exception => $e");
      }
    }
  }
}
