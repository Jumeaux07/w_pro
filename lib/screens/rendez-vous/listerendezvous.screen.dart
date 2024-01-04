import 'package:flutter/material.dart';

class ListeRendezvousScreen extends StatefulWidget {
  const ListeRendezvousScreen({super.key});

  @override
  State<ListeRendezvousScreen> createState() => _ListeRendezvousScreenState();
}

class _ListeRendezvousScreenState extends State<ListeRendezvousScreen> {
  DateTime? rdvDate = DateTime.now();

  DateTime? now = DateTime.now();

  void _showDatePicher() async {
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
      appBar: AppBar(
        title: const Text("Mes Rendez-Vous"),
      ),
      body: ListView(
        children: [
          Card(
            child: SizedBox(
              height: 150,
              child: SizedBox(
                child: Row(
                  children: [
                    //Image du bien
                    Expanded(
                      child: Container(
                        decoration: const BoxDecoration(
                            image: DecorationImage(
                                fit: BoxFit.cover,
                                image: NetworkImage(
                                    "https://images.unsplash.com/photo-1501183638710-841dd1904471?q=80&w=2070&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D"))),
                      ),
                    ),

                    //Information du rendez-vous
                    Expanded(
                      flex: 2,
                      child: Column(
                        children: [
                          const Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Padding(
                                padding: EdgeInsets.all(8.0),
                                child: Text(
                                  "Magasin",
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                ),
                              ),
                            ],
                          ),
                          const Row(
                            children: [
                              Icon(Icons.location_on),
                              Text("Abidjan Yopougon"),
                            ],
                          ),
                          const Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Row(
                              children: [Text("Date: 27/09/2021")],
                            ),
                          ),
                          Row(
                            children: [
                              TextButton.icon(
                                  onPressed: () {},
                                  icon:
                                      const Icon(Icons.edit_calendar_outlined),
                                  label: const Text("")),
                              TextButton.icon(
                                  onPressed: () {},
                                  icon: const Icon(Icons.close),
                                  label: const Text("")),
                              TextButton.icon(
                                  onPressed: () {},
                                  icon: const Icon(Icons.check),
                                  label: const Text("")),
                              TextButton.icon(
                                  onPressed: () {},
                                  icon: const Icon(Icons.phone),
                                  label: const Text("")),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
