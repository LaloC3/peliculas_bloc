import 'dart:async';
import 'pelicula_api_proveedor.dart';
import '../models/objeto_modelo.dart';



class Repositorio {
  final peliculasProveedor = PeliculaProveedor();

  Future<ObjetoModelo> obtenerTodasPeliculas() => peliculasProveedor.obtenerPeliculaLista();
}