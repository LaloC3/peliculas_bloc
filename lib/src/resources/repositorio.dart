import 'dart:async';
import 'package:peliculas/src/models/trailer_modelo.dart';

import 'pelicula_api_proveedor.dart';
import '../models/objeto_modelo.dart';



class Repositorio {
  final peliculasProveedor = PeliculaProveedor();

  Future<ObjetoModelo> obtenerTodasPeliculas() => peliculasProveedor.obtenerPeliculaLista();

  Future<TrailerModelo> obtenerTrailer(int peliculaID) => peliculasProveedor.obtenerTrailer(peliculaID);
}