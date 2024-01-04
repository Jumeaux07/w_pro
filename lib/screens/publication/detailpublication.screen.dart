import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:w_pro/config/colors.config.dart';

class DetailPublicationScreen extends StatefulWidget {
  const DetailPublicationScreen({super.key});

  @override
  State<DetailPublicationScreen> createState() => _DetailPublicationScreenState();
}

class _DetailPublicationScreenState extends State<DetailPublicationScreen> {
  DateTime? rdvDate = DateTime.now();
       DateTime? now = DateTime.now();
  void _showDatePicher()async{
    DateTime? picked = await showDatePicker(
      context: context,
      firstDate: now!,
      lastDate: now!.add(const Duration(days: 6)),
    );
    setState(() {
      rdvDate = picked;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        bottomNavigationBar: TextButton(
            style: const ButtonStyle(
                backgroundColor:
                    MaterialStatePropertyAll(AppColors.primaryColor),
                foregroundColor: MaterialStatePropertyAll(Colors.white)),
            onPressed: () {
              Get.bottomSheet(
                Card(
                  child: SizedBox(
                    height: 250,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Expanded(
                                child: Container(
                              height: 70,
                              color: Colors.amber,
                              child: Center(
                                  child: Text("${rdvDate!.day} / ${rdvDate!.month} / ${rdvDate!.year} ",
                                style: const TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 20),
                              )),
                            )),
                            Expanded(
                                child: Container(
                              height: 70,
                              color: Colors.grey,
                              child: Center(
                                  child: Text(
                                 DateTime.now().hour.toString() +
                                    ":" +
                                    DateTime.now().minute.toString(),
                                style: const TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 20),
                              )),
                            )),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Expanded(
                              child: TextButton.icon(
                                  onPressed: _showDatePicher,
                                  icon: const Icon(Icons.date_range),
                                  label: const Text("Choisir la date")),
                            ),
                            Expanded(
                              child: TextButton.icon(
                                  onPressed: () {},
                                  icon: const Icon(Icons.access_time_filled),
                                  label: const Text("Choisir l'heure")),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Expanded(
                                child: TextButton(
                                    style: const ButtonStyle(
                                        backgroundColor:
                                            MaterialStatePropertyAll(
                                                AppColors.primaryColor),
                                        foregroundColor:
                                            MaterialStatePropertyAll(
                                                Colors.white)),
                                    onPressed: () {},
                                    child: const Text("Valider"))),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
                barrierColor: Colors.black.withOpacity(0.5),
                isDismissible: true,
              );
            },
            child: const Text("Intersser")),
        body: CustomScrollView(
          slivers: [
            SliverAppBar(
              pinned: true,
              floating: true,
              expandedHeight: 300,
              flexibleSpace: FlexibleSpaceBar(
                title: const Text("Detail du bien"),
                background: Image.network(
                    fit: BoxFit.cover,
                    "https://images.unsplash.com/photo-1501183638710-841dd1904471?q=80&w=2070&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D"),
              ),
            ),
            const SliverToBoxAdapter(
              child: Padding(
                padding: EdgeInsets.all(20),
                child: Text(
                    "Description du bien... Description du bien... Description du bien... Description du bien... Description du bien... Description du bien... Description du bien... Description du bien... Description du bien... Description du bien... Description du bien... Description du bien... Description du bien... Description du bien... Description du bien... Description du bien... Description du bien... Description du bien... Description du bien... Description du bien... Description du bien... Description du bien... Description du bien... Description du bien... "),
              ),
            ),
            SliverToBoxAdapter(
                child: DataTable(columns: const [
              DataColumn(
                  label: Row(
                children: [Icon(Icons.roofing_rounded), Text("Type")],
              )),
              DataColumn(
                  label: Row(
                children: [Icon(Icons.bed), Text("Piece(s)")],
              )),
            ], rows: const [
              DataRow(cells: [DataCell(Text("Villa")), DataCell(Text("4"))]),
            ])),
            SliverToBoxAdapter(
                child: DataTable(columns: const [
              DataColumn(
                  label: Row(
                children: [Icon(Icons.wallet), Text("Loyer")],
              )),
              DataColumn(
                  label: Row(
                children: [Icon(Icons.handshake), Text("Caution")],
              )),
            ], rows: const [
              DataRow(
                  cells: [DataCell(Text("50000")), DataCell(Text("2 mois"))]),
            ]))
          ],
        ));
  }
}
