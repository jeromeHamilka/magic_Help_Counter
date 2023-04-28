import 'package:flutter/material.dart';
import 'package:magic_help_counter/home.dart';
import 'package:magic_help_counter/providers/card_list_provider.dart';
import 'package:magic_help_counter/providers/counter_life_provider.dart';
import 'package:magic_help_counter/widgets/form_card_name_autocomplete.dart';
import 'package:provider/provider.dart';
import 'dart:io';

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

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => CardListProvider()),
        ChangeNotifierProvider(create: (context) => CounterLifeProvider()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        routes: {
          '/': (context) => const Home(),
          FormCardName.routename: (context) => const FormCardName(),
        },
      ),
    );
  }
}
