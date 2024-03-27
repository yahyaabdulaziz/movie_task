import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:movie_task/domain/usecases/get_top_rated_use_case.dart';
import 'package:movie_task/presentation/utils/base_request_states.dart';

@injectable
class HomeViewModel extends Cubit<BaseRequestStates> {
  GetTopRatedFilmsUseCase getTopRatedUseCase;

  HomeViewModel(this.getTopRatedUseCase) : super(BaseRequestInitialState());

  void loadTopRatedFilms() {
    getTopRatedUseCase.execute();
  }
}
