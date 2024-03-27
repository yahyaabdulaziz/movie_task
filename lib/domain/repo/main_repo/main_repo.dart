import 'package:dartz/dartz.dart';
import 'package:movie_task/data/model/failure.dart';
import 'package:movie_task/data/model/responses/top_rated_response.dart';

abstract class MainRepo {
  Future<Either<Failure, List<Results>>> getTopRatedFilms();
}
