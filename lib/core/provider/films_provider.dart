import 'package:bigio_swars_app/core/model/film.dart';
import 'package:bigio_swars_app/features/home/service/home_api_service.dart';
import 'package:flutter/cupertino.dart';

class FilmsProvider extends ChangeNotifier {
  List listmovie = [];

  Future<List<Film>> loadFilms() async {
    final responeData = await HomeApiService.fetchFilmsList();
    List<Film> _listFilm = [];

    for (var i = 0; i < responeData.length; i++) {
      _listFilm.add(Film.fromJson(responeData[i]));
    }

    return _listFilm;
  }

  Future<Map> loadFilmDetail(String url) async {
    final responseData = await HomeApiService.fetchFilmDetail(url);

    return responseData;
  }
}
