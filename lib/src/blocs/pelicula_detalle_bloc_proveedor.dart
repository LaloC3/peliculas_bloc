import 'package:flutter/material.dart';
import 'pelicula_detalle_bloc.dart';
export 'pelicula_detalle_bloc.dart';

class PeliculaDetalleBlocProveedor extends InheritedWidget{
  final PeliculaDetallesBloc bloc;

  PeliculaDetalleBlocProveedor({Key key, Widget child})
  :bloc =PeliculaDetallesBloc(),
  super(key:key, child:child);


  @override
  bool updateShouldNotify(_){
    return true;
  }

  static PeliculaDetallesBloc of (BuildContext contex){
    return (contex.inheritFromWidgetOfExactType(PeliculaDetalleBlocProveedor)
    as PeliculaDetalleBlocProveedor).bloc;
  }
}