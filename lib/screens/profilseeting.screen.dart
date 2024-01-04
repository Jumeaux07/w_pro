import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:w_pro/components/settingItem.dart';
import 'package:w_pro/config/colors.config.dart';
import 'package:w_pro/screens/auth/login.screen.dart';

class ProfilSeetingScreen extends StatefulWidget {
  const ProfilSeetingScreen({super.key});

  @override
  State<ProfilSeetingScreen> createState() => _ProfilSeetingScreenState();
}

class _ProfilSeetingScreenState extends State<ProfilSeetingScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Profil"),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          children: [
            //Avatar
            Container(
              height: 150,
              width: 150,
              decoration: BoxDecoration(
                  color: Colors.transparent,
                  borderRadius: BorderRadius.circular(100),
                  image: const DecorationImage(
                      image: AssetImage("assets/images/profil-avatar.png"))),
              child: const CircleAvatar(
                backgroundImage: AssetImage("assets/images/profil-avatar.png"),
              ),
            ),

            const Text(
              "Zouzoua Essis",
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            const Text(
              "Developpeur full-stack",
              style: TextStyle(fontSize: 13, fontWeight: FontWeight.w300),
            ),
            //Section compte du setting
            const Row(
              children: [
                Padding(
                  padding:
                      EdgeInsets.only(right: 20, left: 20, top: 20, bottom: 10),
                  child: Text(
                    "Compte",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: AppColors.texteDarkColor,
                        fontSize: 17),
                  ),
                ),
              ],
            ),
            const SettingItem(
              label: "Modifier mes informations",
              icon: Icon(Icons.person),
            ),
            const SettingItem(
              label: "Modifier mon mot de passe",
              icon: Icon(Icons.lock),
            ),
            //section Application du setting
            const Row(
              children: [
                Padding(
                  padding:
                      EdgeInsets.only(right: 20, left: 20, top: 20, bottom: 10),
                  child: Text(
                    "Application",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: AppColors.texteDarkColor,
                        fontSize: 17),
                  ),
                ),
              ],
            ),
            const SettingItem(
              label: "à propos ",
              icon: Icon(Icons.warning_rounded),
            ),
            const SettingItem(
              label: "termes et conditions d'utilisation",
              icon: Icon(Icons.privacy_tip),
            ),
            InkWell(
                onTap: () {
                  Get.to(() => Login());
                },
                child: const SettingItem(
                  label: "Déconnexion",
                  icon: Icon(Icons.privacy_tip),
                )),
          ],
        ),
      ),
    );
  }
}
