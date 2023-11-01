import 'package:flutter/material.dart';
import 'package:trilhaapp/pages/main_page.dart';
import 'package:trilhaapp/pages/login_pages.dart';
import 'package:trilhaapp/pages/aula_teste.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.blue),
      //textTheme: GoogleFonts.robotoTextTheme()),
      home: const MainPage(),
    );
  }
}
