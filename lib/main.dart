import 'package:flutter/material.dart';
import 'package:magic_help_counter/form_card.dart';
import 'package:provider/provider.dart';
import 'card_provider.dart';
import 'dart:io';

import 'add_creature.dart';
import 'counter_player.dart';

void main() {
  runApp(const CounterMagic());
  HttpOverrides.global = MyHttpOverrides();
}

class CounterMagic extends StatefulWidget {
  const CounterMagic({Key? key}) : super(key: key);

  @override
  State<CounterMagic> createState() => _CounterMagicState();
}

class MyHttpOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext? context) {
    return super.createHttpClient(context)
      ..badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
  }
}

class _CounterMagicState extends State<CounterMagic> {
  int _selectedIndex = 0;
  late String result;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (BuildContext context) {
        return CardProvider();
      },
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          appBar: AppBar(title: const Text("Compteur Magic The Gathering")),
          body: <Widget>[
            const SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Column(
                children: [
                  CounterPlayer(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      AddCreature(),
                      AddCreature(),
                    ],
                  ),
                ],
              ),
            ),
            const FormCard(),
          ][_selectedIndex],
          bottomNavigationBar: BottomNavigationBar(
            currentIndex: _selectedIndex,
            onTap: (index) => _onItemTapped(index),
            type: BottomNavigationBarType.fixed,
            // selectedItemColor: Colors.indigoAccent,
            // unselectedItemColor: Colors.blueGrey,
            iconSize: 40,
            elevation: 20,
            items: const [
              BottomNavigationBarItem(
                icon: Icon(Icons.home),
                label: 'Accueil',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.add),
                label: 'Ajout créature',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
