import 'package:flutter/material.dart';
import 'package:glassmorphism_ui/glassmorphism_ui.dart';
import 'package:w_pro/config/colors.config.dart';

class PublicationCard extends StatelessWidget {
  const PublicationCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 10),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(20),
        child: Column(
          children: [
            //Bloc de la photo
            Expanded(
              flex: 4,
              child: Container(
                  padding: const EdgeInsets.all(10),
                  decoration: const BoxDecoration(
                      image: DecorationImage(
                          fit: BoxFit.cover,
                          image: NetworkImage(
                              "https://images.unsplash.com/photo-1501183638710-841dd1904471?q=80&w=2070&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D"))),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      //Ligne du type de bien
                      Row(
                        children: [
                          GlassContainer(
                            borderRadius: BorderRadius.circular(16),
                            shadowColor: Colors.white.withOpacity(0.24),
                            blur: 7,
                            child: Container(
                              margin: const EdgeInsets.all(10),
                              child: const Text(
                                "MAGAZIN",
                                style: TextStyle(
                                    color: Colors.redAccent,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                          )
                        ],
                      ),

                      //Prix du bien
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            padding: const EdgeInsets.all(7),
                            decoration: BoxDecoration(
                                color: AppColors.accentColor,
                                borderRadius: BorderRadius.circular(20)),
                            child: const Text("20000F"),
                          ),
                          GlassContainer(
                            color: AppColors.primaryColor.withOpacity(0.2),
                            opacity: 0.1,
                            borderRadius: BorderRadius.circular(16),
                            shadowColor:
                                AppColors.primaryColor.withOpacity(0.24),
                            blur: 7,
                            child: Container(
                                margin: const EdgeInsets.all(10),
                                child: const Row(
                                  children: [
                                    Icon(
                                      Icons.thumb_up,
                                      color: Colors.white,
                                    ),
                                    Text(
                                      "Intersser",
                                      style: TextStyle(color: Colors.white),
                                    ),
                                  ],
                                )),
                          )
                        ],
                      )
                    ],
                  )),
            ),
            //Bloc des infos courts
            Expanded(
              flex: 2,
              child: Container(
                padding: const EdgeInsets.only(right: 10),
                child: const Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    //Premiere ligne ( Lieu et nombre de pieces)
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Icon(
                              Icons.location_on_sharp,
                              color: AppColors.texteColor,
                            ),
                            Text(
                              "Abidjan, Yopougon",
                              style: TextStyle(fontWeight: FontWeight.bold),
                            )
                          ],
                        ),
                        Row(
                          children: [
                            // Icon(Icons.bed, color:AppColors.texteColor,),
                            Text(
                              "4 ",
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            Text(
                              "Pièces",
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                      ],
                    ),

                    //Deuxieme ligne info annonceur
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            CircleAvatar(
                              backgroundImage:
                                  AssetImage("assets/images/profil-avatar.png"),
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Text(
                              "Annonceur",
                            )
                          ],
                        ),
                        Row(
                          children: [
                            Text(
                              "Caution ",
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            Text(
                              " X 3",
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                          ],
                        )
                      ],
                    ),

                    //Troisieme ligne pour les options
                    Text("Cool")
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
