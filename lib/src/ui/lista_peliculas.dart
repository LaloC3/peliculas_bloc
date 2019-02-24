import 'package:flutter/material.dart'; 




/* ========================================================================== */
/*                         CLASE "LISTA DE PELICULAS"                         */
/* ========================================================================== */
class ListaPeliculas extends StatefulWidget {
  _ListaPeliculasState createState() => _ListaPeliculasState();
}


class _ListaPeliculasState extends State<ListaPeliculas> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: new Text("Peliculas Populares"),
      ),
      body: StreamBuilder(
        
      ),
    );
  }
}