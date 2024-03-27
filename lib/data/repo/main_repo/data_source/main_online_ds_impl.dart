import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:http/http.dart';
import 'package:injectable/injectable.dart';
import 'package:movie_task/data/model/failure.dart';
import 'package:movie_task/data/model/responses/top_rated_response.dart';
import 'package:movie_task/domain/repo/main_repo/data_source/main_online_ds.dart';
import 'package:movie_task/presentation/utils/constants.dart';

@Injectable(as: MainOnlineDS)
class MainOnlineDSImpl extends MainOnlineDS {
  int pageNumber = 1;
  List<Results> topRatedMovies = []; // Maintain a list to store movies

  @override
  Future<Either<Failure, List<Results>>> getTopRatedFilms() async {
    try {
      Uri url = Uri.parse(
          "https://${Constants.baseUrl}${Constants.topRatedEndPoint}?api_key=${Constants.apiKey}&page=$pageNumber");
      Response serverResponse = await get(url);
      Map json = jsonDecode(serverResponse.body);
      TopRatedResponse response =
          TopRatedResponse.fromJson(jsonDecode(serverResponse.body));
      if (serverResponse.statusCode >= 200 &&
          serverResponse.statusCode < 300 &&
          response.results?.isNotEmpty == true) {
        List<Results> newMovies = response.results!;
        topRatedMovies.addAll(newMovies); // Append new movies to existing list
        pageNumber++; // Increase pageNumber for the next request
        return Right(topRatedMovies); // Return the updated list
      } else {
        return Left(
            Failure(response.statusMessage ?? Constants.defaultErrorMessage));
      }
    } catch (error, stacktrace) {
      print("Handling exception: ${error} , Stacktrace: $stacktrace");
      return Left(Failure(Constants.defaultErrorMessage));
    }
  }
}
