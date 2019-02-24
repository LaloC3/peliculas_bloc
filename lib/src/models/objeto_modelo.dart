class ObjetoModelo{
  int _pagina;
  int _total_resultados;
  int _total_paginas;
  List<_Resultado> _resultados = [];

  ObjetoModelo.fromJson(Map<String, dynamic> parsedJson){
    print(parsedJson['results'].length);
    _pagina =parsedJson['page'];
    _total_resultados =parsedJson['total_results'];
    _total_paginas =parsedJson['total_pages'];
    List<_Resultado> temp = [];
    for (var i = 0; i < parsedJson['result'].length; i++) {
      _Resultado resultado = _Resultado(parsedJson['results'][i]);
      temp.add(resultado);
      
    }
    _resultados =temp;
  }

  List<_Resultado> get resultados => _resultados;

  int get total_paginas => _total_paginas;

  int get total_resultados => _total_resultados;

  int get pagina => _pagina;
}

class _Resultado{
  int _voto_contador;
  int _id;
  bool _video;
  String _voto_promedio;
  String _titulo;
  double _popularidad;
  String _directorio_poster;
 String _lenguaje_original;
 String _titulo_original;
 List <int> _genero_id = [];
 String _fondo_directorio;
 bool _adulto;
 String  _visto_general;
 String _fecha_realizada;


 _Resultado(resultado){
_voto_contador =resultado['vote_count'];
_id =resultado['id'];
_video =resultado['video'];
_voto_promedio =resultado['vote_average'].toString();
_titulo =resultado['title'];
_popularidad =resultado['popularity'];
_directorio_poster =resultado['poster_path'];
_lenguaje_original =resultado['original_language'];
_titulo_original =resultado['original_title'];

 }
}