import 'package:flutter/material.dart';
import 'pages/home_page.dart';
import 'pages/search_page.dart';
import 'pages/detail_page.dart';
import 'models/slug_model.dart'; // Adicionar importação do modelo

void main() {
  runApp(SlugterraApp());
}

class SlugterraApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Slugterra Slugdex',
      theme: ThemeData(
        primaryColor: Colors.blue[900],
        colorScheme: ColorScheme.fromSwatch().copyWith(secondary: Colors.orange), // Corrigir accentColor
        fontFamily: 'Roboto',
        textTheme: const TextTheme(
          displayLarge: TextStyle(fontSize: 32, fontWeight: FontWeight.bold, color: Colors.orange, fontFamily: 'Orbitron'), // Corrigir headline1
          bodyLarge: TextStyle(fontSize: 16, color: Colors.white70), // Corrigir bodyText1
        ),
        scaffoldBackgroundColor: Colors.grey[900],
        appBarTheme: AppBarTheme(
          backgroundColor: Colors.blue[900],
          titleTextStyle: TextStyle(
            fontFamily: 'Orbitron',
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Colors.orange,
          ),
        ),
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => HomePage(),
        '/search': (context) => SearchPage(),
      },
      onGenerateRoute: (settings) {
        if (settings.name == '/detail') {
          final Slug slug = settings.arguments as Slug;
          return MaterialPageRoute(
            builder: (context) => DetailPage(slug: slug),
          );
        }
        return null;
      },
    );
  }
}