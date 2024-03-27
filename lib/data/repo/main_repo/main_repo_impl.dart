import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:movie_task/data/model/failure.dart';
import 'package:movie_task/data/model/responses/top_rated_response.dart';
import 'package:movie_task/domain/repo/main_repo/data_source/main_online_ds.dart';
import 'package:movie_task/domain/repo/main_repo/main_repo.dart';
import 'package:movie_task/presentation/utils/constants.dart';
import 'package:movie_task/presentation/utils/exentions.dart';

@Injectable(as: MainRepo)
class MainRepoImpl extends MainRepo {
  Connectivity connectivity;
  MainOnlineDS mainOnlineDs;

  MainRepoImpl(this.connectivity, this.mainOnlineDs);

  @override
  Future<Either<Failure, List<Results>>> getTopRatedFilms() async {
    if (await connectivity.isInternetConnected) {
      return mainOnlineDs.getTopRatedFilms();
    } else {
      return Left(Failure(Constants.internetErrorMessage));
    }
  }
}
