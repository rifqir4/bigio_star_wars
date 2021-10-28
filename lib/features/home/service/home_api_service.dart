import 'package:dio/dio.dart';

class HomeApiService {
  static Future<dynamic> fetchFilmsList() async {
    final response = await Dio().get('https://swapi.dev/api/films');

    if (response.statusCode != 200) throw "Terjadi Kesalahan";

    return response.data['results'];
  }

  static Future<dynamic> fetchFilmDetail(String url) async {
    final response = await Dio().get(url);

    if (response.statusCode != 200) throw "Terjadi Kesalahan";

    return response.data;
  }
}
