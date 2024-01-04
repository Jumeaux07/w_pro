import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:w_pro/components/appbarauth.dart';
import 'package:w_pro/components/inputtext.dart';
import 'package:w_pro/components/mytoast.dart';
import 'package:w_pro/config/colors.config.dart';
import 'package:w_pro/controllers/auth/auth.controller.dart';
import 'package:w_pro/screens/auth/login.screen.dart';
import 'package:w_pro/screens/home.screen.dart';

class Register extends StatefulWidget {
  Register({super.key});

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  final authController = Get.put(AuthController());
  FToast? fToast;

  @override
  void initState() {
    super.initState();
    fToast = FToast();
    fToast?.init(context);
  }

  @override
  Widget build(BuildContext context) {
    return Obx(() => Scaffold(
          // appBar: PreferredSize(
          //   preferredSize: Size.fromHeight(Get.height * 0.3),
          //   child: const AppBarAuth(),
          // ),
          bottomNavigationBar: Padding(
            padding: const EdgeInsets.all(8.0),
            child: RichText(
                textAlign: TextAlign.center,
                text: const TextSpan(
                    text: "Copy Right ",
                    style: TextStyle(color: AppColors.texteColor, fontSize: 16),
                    children: <InlineSpan>[
                      TextSpan(
                          text: "WATTANDOH",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 18,
                              color: AppColors.accentColor))
                    ])),
          ),
          body: ListView(
            children: [
              //Logo
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                height: Get.height * 0.4,
                width: Get.width,
                child: Image.asset("assets/logos/logo.png"),
              ),
              //Formulaire
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                child: Inputtext(
                  label: 'Nom et prénoms',
                  placeholder: 'Essis cedric',
                  controller: authController.nomprenomTextEditing.value,
                  prefix: const Icon(Icons.person),
                  pass: false,
                  keyboaedtype: TextInputType.text,
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                child: Inputtext(
                  length: 10,
                  label: 'Numéro de téléphone',
                  placeholder: '0102030405',
                  controller: authController.phoneTextEditing.value,
                  prefix: const Icon(Icons.phone_android_sharp),
                  pass: false,
                  keyboaedtype: TextInputType.phone,
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                child: Inputtext(
                  keyboaedtype: TextInputType.text,
                  label: 'Mot de passe',
                  placeholder: 'xxxxxxxx',
                  controller: authController.passwordTextEditing.value,
                  prefix: const Icon(Icons.lock),
                  pass: true,
                  sufix: const Icon(Icons.remove_red_eye),
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                child: Inputtext(
                  keyboaedtype: TextInputType.text,
                  label: 'Confirmation',
                  placeholder: 'xxxxxxxx',
                  controller: authController.confirmationTextEditing.value,
                  prefix: const Icon(Icons.lock),
                  pass: true,
                  sufix: const Icon(Icons.remove_red_eye),
                ),
              ),
              //bouton
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Expanded(
                        child: TextButton(
                      onPressed: () {
                        authController.register(
                            authController.nomprenomTextEditing.value.text,
                            authController.phoneTextEditing.value.text,
                            authController.passwordTextEditing.value.text,
                            authController.confirmationTextEditing.value.text);
                      },
                      style: const ButtonStyle(
                          foregroundColor:
                              MaterialStatePropertyAll(Colors.white),
                          backgroundColor:
                              MaterialStatePropertyAll(AppColors.primaryColor)),
                      child: authController.isLoading.value
                          ? const Center(
                              child: CircularProgressIndicator(
                                color: Colors.white,
                              ),
                            )
                          : const Text("INSCRIPTION"),
                    )),
                  ],
                ),
              ),

              //Inscription
              InkWell(
                onTap: () {
                  Get.off(() => Login());
                },
                child: RichText(
                    textAlign: TextAlign.center,
                    text: const TextSpan(
                        text: "Vous avez un compte ? ",
                        style: TextStyle(
                            color: AppColors.texteColor, fontSize: 16),
                        children: <InlineSpan>[
                          TextSpan(
                              text: "Connectez-vous",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 18))
                        ])),
              )
            ],
          ),
        ));
  }
}
