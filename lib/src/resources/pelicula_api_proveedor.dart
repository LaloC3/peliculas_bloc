import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' show Client;
import '../models/objeto_modelo.dart';
import '../models/trailer_modelo.dart';

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

  Future<TrailerModelo> obtenerTrailer(int peliculaId) async{
    final reponse =await cliente.get("$_baseUrl/$peliculaId/videos?api_key=$_apiKey");

    if (reponse.statusCode == 200){
      return TrailerModelo.fromJson(json.decode(reponse.body));
    }else{
      throw Exception('Fallo al cargar el trailer');
    }
  }
}