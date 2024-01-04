import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:w_pro/components/appbarauth.dart';
import 'package:w_pro/components/inputtext.dart';
import 'package:w_pro/config/colors.config.dart';
import 'package:w_pro/controllers/auth/auth.controller.dart';
import 'package:w_pro/screens/auth/register.screen.dart';
import 'package:w_pro/screens/home.screen.dart';

class Login extends StatelessWidget {
  Login({super.key});
  final authController = Get.put(AuthController());
  @override
  Widget build(BuildContext context) {
    return Obx(() => Scaffold(
          // appBar: PreferredSize(
          //   preferredSize: Size.fromHeight(Get.height * 0.4),
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
              //logo
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
                  length: 10,
                  label: 'Téléphone',
                  placeholder: '0103772742',
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
              //Mot de passe oublié ?
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [Text("Mot de passe oublié ?")],
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
                        authController.login(
                            authController.phoneTextEditing.value.text,
                            authController.passwordTextEditing.value.text);
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
                          : const Text("CONNEXION"),
                    )),
                  ],
                ),
              ),

              //Inscription
              InkWell(
                onTap: () {
                  Get.off(() => Register());
                },
                child: RichText(
                    textAlign: TextAlign.center,
                    text: const TextSpan(
                        text: "Vous n'avez pas un compte ? ",
                        style: TextStyle(
                            color: AppColors.texteColor, fontSize: 16),
                        children: <InlineSpan>[
                          TextSpan(
                              text: "Inscrivez-vous",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 18))
                        ])),
              )
            ],
          ),
        ));
  }
}
