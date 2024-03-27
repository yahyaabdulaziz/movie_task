import 'package:dartz/dartz.dart';
import 'package:movie_task/data/model/failure.dart';
import 'package:movie_task/data/model/responses/top_rated_response.dart';

abstract class MainOnlineDS {
  Future<Either<Failure, List<Results>>> getTopRatedFilms();
}
