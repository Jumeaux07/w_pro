import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:w_pro/components/publicationcard.dart';
import 'package:w_pro/config/colors.config.dart';
import 'package:w_pro/screens/publication/detailpublication.screen.dart';

class ListePublication extends StatefulWidget {
  const ListePublication({super.key});

  @override
  State<ListePublication> createState() => _ListePublicationState();
}

class _ListePublicationState extends State<ListePublication> {
  final _currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      initialIndex: _currentIndex,
      length: 2,
      child: Scaffold(
          appBar: AppBar(
            backgroundColor: AppColors.primaryColor,
            foregroundColor: Colors.white,
            title: const Text("Publications"),
            bottom: const TabBar(
                indicatorColor: Colors.white,
                labelColor: Colors.white,
                unselectedLabelStyle: TextStyle(
                  color: Colors.white,
                ),
                tabs: [
                  Tab(
                    child: Text("Location"),
                  ),
                  Tab(
                    child: Text("Vente"),
                  )
                ]),
          ),
          body: TabBarView(
            children: [
              ListView.builder(
                itemCount: 20,
                padding:
                    const EdgeInsets.symmetric(vertical: 30, horizontal: 10), itemBuilder: (BuildContext context, int index) { 
                      return  SizedBox(
                    height: 290,
                    child: InkWell(onTap: (){Get.to(()=>const DetailPublicationScreen());}, child: const PublicationCard()),
                  );
                     },
                
              ),
              ListView(
                children: const [
                  Text("Vente"),
                ],
              ),
            ],
          )),
    );
  }
}