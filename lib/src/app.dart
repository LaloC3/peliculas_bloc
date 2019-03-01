import 'package:flutter/material.dart';
import 'package:peliculas/src/ui/lista_peliculas.dart';




class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: ThemeData.dark(),
        home: Scaffold(
          body: ListaPeliculas(),
        ),
      );
  }
}