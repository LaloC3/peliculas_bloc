import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' show Client;
import '../models/objeto_modelo.dart';

class PeliculaProveedor {
  Client cliente = Client();
  final _apiKey = '802b2c4b88ea1183e50e6b285a27696e';
  final _baseUrl = "http://api.themoviedb.org/3/movie"; 

  Future<ObjetoModelo> obtenerPeliculaLista() async{
    final response =await cliente.get("$_baseUrl/popular?api_key=$_apiKey");
    if (response.statusCode == 200) {
      return ObjetoModelo.fromJson(json.decode(response.body));
    } else {
      throw Exception('Fallo al obtener los datos');
    }
  }
}