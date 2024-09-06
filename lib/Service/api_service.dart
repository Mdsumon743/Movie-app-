import 'dart:convert';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:movie_app/Constant/const.dart';
import 'package:movie_app/Model/movie_model.dart';
import 'package:movie_app/Model/tv_model.dart';

class ApiService extends GetxController {
  Constant constant = Constant();

  Future<MovieModel?> getDataApi(String category) async {
    String url = constant.baseurl + category + constant.apiKey;
    try {
      var response = await http.get(Uri.parse(url));
      var data = jsonDecode(response.body.toString());
      if (response.statusCode == 200) {
        return MovieModel.fromJson(data);
      } else {}
      {}
      return null;
    } catch (e) {
      rethrow;
    }
  }

  Future<MovieModel?> getDataApiTrending() async {
    var load =
        'https://api.themoviedb.org/3/trending/movie/week?api_key=98a009235bc6ca303df7c782c158fd6a';
    try {
      var response = await http.get(Uri.parse(load));
      var data = jsonDecode(response.body.toString());
      if (response.statusCode == 200) {
        return MovieModel.fromJson(data);
      } else {}
      {}
      return null;
    } catch (e) {
      rethrow;
    }
  }

  Future<TvModel?> getDataApiTv(String category) async {
    final tvUrl = Constant().baseurltv + category + Constant().apiKey;

    try {
      final response = await http.get(Uri.parse(tvUrl));
      var data = jsonDecode(response.body.toString());
      if (response.statusCode == 200) {
        return TvModel.fromJson(data);
      } else {
        return null;
      }
    } catch (e) {
      rethrow;
    }
  }
}
