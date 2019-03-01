import 'dart:async';
import 'package:rxdart/rxdart.dart';
import '../models/trailer_modelo.dart';
import '../resources/repositorio.dart';

class PeliculaDetallesBloc{
  final _repositorio =Repositorio();
  final _peliculaId =PublishSubject<int>();
  final _trailers =BehaviorSubject<Future<TrailerModelo>>();

  Function(int) get fetchTrailersById => _peliculaId.sink.add;
  Observable<Future<TrailerModelo>> get peliculaTrailers => _trailers.stream;

  PeliculaDetallesBloc(){
    _peliculaId.stream.transform(_itemTransformer()).pipe(_trailers);
  }

  disponse() async{
    _peliculaId.close();
    await _trailers.drain();
    _trailers.close();
  }

  _itemTransformer(){
    return ScanStreamTransformer(
      (Future<TrailerModelo> trailer, int id, int index){
        print(index);
        trailer =_repositorio.obtenerTrailer(id);
        return trailer;
      }
    );
  }
}