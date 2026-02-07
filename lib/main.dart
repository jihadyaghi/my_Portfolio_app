import 'package:flutter/material.dart';
import 'package:myportfolio_app/pages/about_page.dart';
import 'package:myportfolio_app/pages/contact_page.dart';
import 'package:myportfolio_app/pages/home_page.dart';
import 'package:myportfolio_app/pages/projects_page.dart';
import 'package:myportfolio_app/pages/skills_page.dart';
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
       debugShowCheckedModeBanner: false,
       title: 'Jihad Portfolio',
       theme: ThemeData(
        brightness: Brightness.dark,
        scaffoldBackgroundColor: const Color(0xFF07080B),
        appBarTheme: const AppBarTheme(
          backgroundColor: Color(0xFF0F1014),
          elevation: 0,
          centerTitle: true,
        )
       ),
       initialRoute: '/',
       routes: {
        '/':(_)=>const HomePage(),
        '/about':(_)=>const AboutPage(),
        '/skills':(_)=>const SkillsPage(),
        '/projects':(_)=>const ProjectsPage(),
        '/contact':(_)=>const ContactPage()
       },
    );
  }
}
