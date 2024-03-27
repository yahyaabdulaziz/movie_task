import 'package:dartz/dartz.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:movie_task/data/model/failure.dart';
import 'package:movie_task/data/model/responses/top_rated_response.dart';
import 'package:movie_task/domain/repo/main_repo/main_repo.dart';
import 'package:movie_task/presentation/utils/base_request_states.dart';

@injectable
class GetTopRatedFilmsUseCase extends Cubit {
  GetTopRatedFilmsUseCase(this.repo) : super(BaseRequestInitialState());
  MainRepo repo;

  void execute() async {
    Either<Failure, List<Results>> either = await repo.getTopRatedFilms();
    either.fold((failure) => emit(BaseRequestErrorState(failure.errorMessage)),
        (list) => emit(BaseRequestSuccessState<List<Results>>(data: list)));
  }
}
