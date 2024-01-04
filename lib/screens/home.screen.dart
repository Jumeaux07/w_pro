import 'package:flutter/material.dart';
import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';
import 'package:w_pro/screens/profilseeting.screen.dart';
import 'package:w_pro/screens/publication/listepublication.screen.dart';
import 'package:w_pro/screens/publication/publicationform.screen..dart';
import 'package:w_pro/screens/rendez-vous/listerendezvous.screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  var _currentIndex = 0;
  PageController pageController = PageController(
    initialPage: 0,
    keepPage: true,
  );
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Card(
        child: SalomonBottomBar(
            currentIndex: _currentIndex,
            onTap: (i) {
              setState(() {
                _currentIndex = i;
                pageController.animateToPage(i,
                    duration: const Duration(milliseconds: 500),
                    curve: Curves.ease);
              });
            },
            items: [
              SalomonBottomBarItem(
                  icon: const Icon(Icons.newspaper_rounded),
                  title: const Text("Home")),
              SalomonBottomBarItem(
                  icon: const Icon(Icons.edit_note_outlined),
                  title: const Text("Publier")),
              SalomonBottomBarItem(
                  icon: const Icon(Icons.calendar_month_outlined),
                  title: const Text("RDV")),
              SalomonBottomBarItem(
                  icon: const Icon(Icons.settings),
                  title: const Text("Profil")),
            ]),
      ),
      body: PageView(
        controller: pageController,
        onPageChanged: (int index) {
          setState(() {
            _currentIndex = index;
          });
        },
        children: [
          const ListePublication(),
          PublicationFormScreen(),
          const ListeRendezvousScreen(),
          const ProfilSeetingScreen(),
        ],
      ),
    );
  }
}
