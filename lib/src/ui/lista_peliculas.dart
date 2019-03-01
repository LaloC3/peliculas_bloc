import 'package:flutter/material.dart';
import 'package:peliculas/src/blocs/pelicula_detalle_bloc_proveedor.dart';
import 'package:peliculas/src/ui/detalles_peliculas.dart'; 
import '../models/objeto_modelo.dart';
import '../blocs/peliculas_bloc.dart';
import 'detalles_peliculas.dart';





/* ========================================================================== */
/*                         CLASE "LISTA DE PELICULAS"                         */
/* ========================================================================== */
class ListaPeliculas extends StatefulWidget {
  _ListaPeliculasState createState() => _ListaPeliculasState();
}


class _ListaPeliculasState extends State<ListaPeliculas> {
 @override
  void initState() {
    super.initState();
    bloc.obtenerTodasPeliculas();
  }

  @override
  void dispose() {
    bloc.dispose();
    super.dispose();
  }

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
            return buildList(snapshot);
          } else if(snapshot.hasError) {
            return Text(snapshot.error.toString());
          }
          return  CircularProgressIndicator();
          
         
        },
      ),
    );
  }

  Widget buildList(AsyncSnapshot<ObjetoModelo> snapshot) {
    return GridView.builder(
        itemCount: snapshot.data.resultados.length,
        gridDelegate:
        new SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
        itemBuilder: (BuildContext context, int index) {
          return GridTile(
            child: InkResponse(
              enableFeedback: true,
              child: Image.network(
                'https://image.tmdb.org/t/p/w185${snapshot.data
                    .resultados[index].directorio_poster}',
                fit: BoxFit.cover,
              ),
              onTap: () => abrirDetallesPagina(snapshot.data, index),
            ),
          );
        });
  }

  abrirDetallesPagina(ObjetoModelo data, int index){
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) {
        return PeliculaDetalleBlocProveedor(
          child: PeliculaDetalles(
            title: data.resultados[index].titulo,
            posterUrl: data.resultados[index].fondo_directorio,
            description: data.resultados[index].visto_general,
            releaseDate: data.resultados[index].fecha_realizada,
            voteAverage: data.resultados[index].voto_promedio.toString(),
            movieId: data.resultados[index].id,
          ),
        );
      }),
    );
  }
  }
