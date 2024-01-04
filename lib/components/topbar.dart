import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:w_pro/config/colors.config.dart';
import 'package:w_pro/screens/profilseeting.screen.dart';

// ignore: must_be_immutable
class TopBarRecherche extends StatelessWidget {
  TopBarRecherche({
    super.key,
  });

  List<String> boulo = ["Tous","Servante", "Chauffeur", "Nounou", "Cusiner", "Nettoyage"];
  List<String> niveauDetude = ["Tous","Analphabet", "Un peu lettré", "Primaire", "Collège", "Lycée","Université","Profesionnel"];
  List<String> tempDeTravail = ["Heure","Jounalier","Semaine"];


  @override
  Widget build(BuildContext context) {
    return Column(
          children: [
    Stack(children: [
      //Bloc de l'appbar
      Container(
        width: Get.width,
        height: Get.height * 0.20,
        color: AppColors.primaryColor,
      ),
    
      //TopBar Logo et Info App
      Positioned(
        top: 50,
        child: Container(
          height: 60,
          width: Get.width,
          child: Row(
            children: [
              Expanded(
                flex: 5,
                child: Container(
                  child: Row(
                    children: [
                      const Padding(padding: EdgeInsets.only(left: 18), child: const Icon(Icons.menu, color: Colors.white,size: 35,)),
                  Container(
                    margin: const  EdgeInsets.only(left: 18),
                      width: 90,
                      height: 70,
                      child: Image.asset("assets/logos/logo.png", color: Colors.white,)
                    ),
                    ],
                  ),
                ),
              ),
    
              Expanded(
                flex: 1,
                child: InkWell(
                  onTap:(){
                    Get.to(()=>ProfilSeetingScreen());
                  },
                  child: Container(
                    child: Row(
                      children: [
                    Container(
                        width: 50,
                        height: 50,
                        child: const CircleAvatar( backgroundImage: AssetImage("assets/images/profil-avatar.png"))
                      ),
                      ],
                    ),
                  ),
                ),
              ),
    
            ],
          ),
        ),
      ),
    
      //Le formulaire de recherche
      Positioned(
        top: 115,
        right: 10,
        left: 10,
        child: Container(
          height: 50,
          width: Get.width * 9.99,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20), color: Colors.white),
    
          //elment dans le bloc pour la recherche
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              //Button Filter
              InkWell(
                onTap: (){
                  Get.defaultDialog(
                    title: "RCHERCHE AVANCEE",
                    titleStyle: TextStyle(fontSize: 15),
                    radius: 5,
                    content: Column(
                      children: []
                    ),
                  );
                },
                child: Expanded(
                  flex: 1,
                  child: Container(
                    height: 50,
                    width: 50,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: AppColors.accentColor,
                    ),
                    child: const Icon(
                      Icons.filter_list_outlined,
                      color: Colors.white,
                      size: 40,
                    ),
                  ),
                ),
              ),

              //Champs input
              Expanded(
                flex: 6,
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  height: 50,
                  width: 50,
                  child: const TextField(
                    decoration:
                        InputDecoration(hintText: "Que cherchez-vous ?"),
                  ),
                ),
              ),
              //icon de recherche
              Expanded(
                flex: 1,
                child: Container(
                  height: 50,
                  width: 50,
                  color: AppColors.accentColor,
                  child: const Icon(
                    Icons.search,
                    color: Colors.white,
                    size: 40,
                  ),
                ),
              )
            ],
          ),
        ),
      ),

      //Dopdown button
      Positioned(
        top: 177,
        child: Container(
          // color: Colors.white,
          height: 60,
          width: Get.width,
          child: const Row(
            children: [
              // DropdownBoutton()
            ],
          ),
        ),
      ),
    ]),
          ],
        );
  }
}