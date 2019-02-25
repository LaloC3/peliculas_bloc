import 'package:flutter/material.dart'; 
import '../models/objeto_modelo.dart';
import '../blocs/peliculas_bloc.dart';





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
        stream: bloc.todasPeliculas,
        builder: (context, AsyncSnapshot<ObjetoModelo> snapshot){
          if (snapshot.hasData) {
            return Text("Hay datis");
          } else if(snapshot.hasError) {
            return Text(snapshot.error.toString());
          }
          return Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
    );
  }
}