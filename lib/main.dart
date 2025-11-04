import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'screens/home_screen.dart'; // Importamos la pantalla principal

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    // Definimos los colores basados en el logo que enviaste
    const Color colorPrincipal = Color(0xFFF9E0D4); // Rosa/Durazno pálido
    const Color colorTexto = Color(0xFF6D5F5C); // Gris/Marrón oscuro del texto

    return MaterialApp(
      title: 'Taller de Cerámica Ricardo Rojas',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        // Tema principal
        scaffoldBackgroundColor: colorPrincipal,
        primaryColor: colorPrincipal,
        colorScheme: ColorScheme.fromSeed(seedColor: colorPrincipal),
        
        // Tema de texto
        textTheme: GoogleFonts.latoTextTheme(Theme.of(context).textTheme).apply(
          bodyColor: colorTexto,
          displayColor: colorTexto,
        ),
      ),
      home: const HomeScreen(),
    );
  }
}