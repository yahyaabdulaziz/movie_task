import 'dart:convert';

import 'package:http/http.dart';
import 'package:movie_task/data/model/top_rated_response.dart';

abstract class ApiManger {
  static const String baseUrl = "api.themoviedb.org";
  static const String apiKey = "c40915bb91d27f2f1cfdcaac2cd3eadc";
  static const String topRatedEndPoint = "/3/movie/top_rated";

  static Future<List<Results>> getTopRatedMovies() async {
    Uri url = Uri.parse(
        "https://api.themoviedb.org/3/movie/top_rated?api_key=c40915bb91d27f2f1cfdcaac2cd3eadc");
    Response serverResponse = await get(url);
    Map json = jsonDecode(serverResponse.body);
    TopRatedResponse topRatedResponse = TopRatedResponse.fromJson(json);
    if (serverResponse.statusCode >= 200 &&
        serverResponse.statusCode < 300 &&
        topRatedResponse.results?.isNotEmpty == true) {
      return topRatedResponse.results!;
    }
    throw Exception(topRatedResponse.statusMessage);
  }
}
