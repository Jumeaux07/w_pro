import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:w_pro/components/dropdownfield.dart';
import 'package:w_pro/components/myinputtext.dart';
import 'package:w_pro/config/colors.config.dart';
import 'package:w_pro/controllers/publicationform.controller.dart';

class PublicationFormScreen extends StatelessWidget {
   PublicationFormScreen({super.key});

  final  _publicationFromController = Get.put(PublicationFromController());

  @override
  Widget build(BuildContext context) {
    return Obx(() => Scaffold(
          appBar: AppBar(
            title: const Text("Publier un bien"),
            centerTitle: true,
          ),
          floatingActionButton: FloatingActionButton(onPressed: (){_publicationFromController.pickImages();}, child: const Icon(Icons.add_photo_alternate),),
          body: ListView(
            padding: const EdgeInsets.symmetric(vertical: 20),
            children: [
              _publicationFromController.imageList.isNotEmpty ?
           GridView.count(
                        shrinkWrap: true,
                        crossAxisCount: 3,
                        children: List.generate(
                            _publicationFromController.imageList.length, (index) {
                          return Card(
                            child: SizedBox(
                              height: 100,
                              width: 100,
                              child: Image.file(
                                  _publicationFromController.imageList[index], height: 100, width: 100, fit: BoxFit.fill,),
                            ),
                          );
                        }),
                      ) :  InkWell(
                        onTap: _publicationFromController.pickImages,
                        child: const  Center(child: Column(
                          children: [
                            Icon(Icons.image_not_supported, size: 100,),
                            Text("Importer une image")
                          ],
                        ),),
                      ),
              // formulaire de input et dropdown 
              DropdownField(options: const ["Villa","Magasin","Terrain"], label: 'Type de bien', selectedOption: ["Villa","Magasin","Terrai)n"].first.toString(),),
           const Row(
            children: [
              Expanded(child: MyInputText(placeholder: '40000', label: Text("Loyer"), obscureText: false, readonly: false, suffix: Text("F"), keyboardType: TextInputType.number, textDirection: TextDirection.rtl, hintTextDirection: TextDirection.rtl,)),
              Expanded(child: MyInputText(placeholder: '2', label: Text("Cuation"), obscureText: false, readonly: false, suffix: Text("mois"), keyboardType: TextInputType.number, textDirection: TextDirection.rtl, hintTextDirection: TextDirection.rtl,)),
            ],
           ),
           Row(
            children: [
              Expanded(child: DropdownField(options: const ["Yopougon","Angré","Abata"], label: 'Communes', selectedOption: ["Yopougon","Angré","Abata"].first.toString(),)),
              Expanded(child: DropdownField(options: const ["Koweit","Nouveau quartier","Complexe"], label: 'Quartier', selectedOption: ["Koweit","Nouveau quartier","Complexe"].first.toString(),)),
            ],
           ),
           Row(
            children: [
              Expanded(child: DropdownField(options: const ["Directe","Indirecte"], label: 'Type de marché', selectedOption: ["Directe","Indirecte"].first.toString(),)),
              const Expanded(child: MyInputText(placeholder: '10', label: Text("Commission"), obscureText: false, readonly: false, suffix: Text(" %"), keyboardType: TextInputType.number, textDirection: TextDirection.rtl, hintTextDirection: TextDirection.rtl,)),
            ],
           ),

          DropdownField(options: const ["Bruit","Foutou","Salir"], label: 'Interdit', selectedOption: ["Bruit","Foutou","Salir"].first.toString(),),
          const Row(
            children: [
              Expanded(child: MyInputText(maxlines: 5, placeholder: 'Description....', label: Text("Description"), obscureText: false, readonly: false, suffix: Text(""), keyboardType: TextInputType.number, textDirection: TextDirection.ltr, hintTextDirection: TextDirection.ltr,)),
            ],
          ),

          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 18),
            child: Row(
              children: [
                Expanded(child: TextButton(onPressed: (){}, style: const ButtonStyle(backgroundColor: MaterialStatePropertyAll(AppColors.primaryColor), foregroundColor: MaterialStatePropertyAll(Colors.white) ), child: const Text("Publier")))
              ],
            ),
          )
           //Importation des images
        ],
      ),
    ));
  }
}