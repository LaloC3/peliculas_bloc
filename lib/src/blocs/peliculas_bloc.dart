import '../resources/repositorio.dart';
import '../models/objeto_modelo.dart';
import 'package:rxdart/rxdart.dart';

class PeliculasBloc{
final _repositorio = Repositorio();
final _peliculasObtener =PublishSubject<ObjetoModelo>();

Observable<ObjetoModelo> get todasPeliculas => _peliculasObtener.stream;

obtenerTodasPeliculas()async{
  ObjetoModelo objetoModelo =await _repositorio.obtenerTodasPeliculas();
  _peliculasObtener.sink.add(objetoModelo);
}

dispose(){
  _peliculasObtener.close();
}

}

final bloc =PeliculasBloc();