// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:connectivity_plus/connectivity_plus.dart' as _i3;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import '../../data/repo/main_repo/data_source/main_online_ds_impl.dart' as _i5;
import '../../data/repo/main_repo/main_repo_impl.dart' as _i7;
import '../../presentation/screens/home_screen/home_screen_view_model.dart'
    as _i9;
import '../repo/main_repo/data_source/main_online_ds.dart' as _i4;
import '../repo/main_repo/main_repo.dart' as _i6;
import '../usecases/get_top_rated_use_case.dart' as _i8;
import 'app_module.dart' as _i10;

extension GetItInjectableX on _i1.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  _i1.GetIt init({
    String? environment,
    _i2.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i2.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    final appModule = _$AppModule();
    gh.factory<_i3.Connectivity>(() => appModule.getConnectivity());
    gh.factory<_i4.MainOnlineDS>(() => _i5.MainOnlineDSImpl());
    gh.factory<_i6.MainRepo>(() => _i7.MainRepoImpl(
          gh<_i3.Connectivity>(),
          gh<_i4.MainOnlineDS>(),
        ));
    gh.factory<_i8.GetTopRatedFilmsUseCase>(
        () => _i8.GetTopRatedFilmsUseCase(gh<_i6.MainRepo>()));
    gh.factory<_i9.HomeViewModel>(
        () => _i9.HomeViewModel(gh<_i8.GetTopRatedFilmsUseCase>()));
    return this;
  }
}

class _$AppModule extends _i10.AppModule {}
