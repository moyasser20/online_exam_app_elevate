// dart format width=80
// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:dio/dio.dart' as _i361;
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;

import '../../Features/login/api/client/login_api_client.dart' as _i545;
import '../../Features/login/api/datasource_implementation/login_remote_datasource_imp.dart'
    as _i261;
import '../../Features/login/data/datasource/login_remote_datasource.dart'
    as _i713;
import '../../Features/login/data/repositories_implmentation/login_repo_impl.dart'
    as _i946;
import '../../Features/login/domain/repositories/login_repo.dart' as _i554;
import '../../Features/login/domain/usecases/login_usecase.dart' as _i643;
import '../../Features/login/presentation/viewmodel/login_viewModel.dart'
    as _i538;
import '../../Features/signup/api/client/signup_api_client.dart' as _i991;
import '../../Features/signup/api/datasource_implementation/signup_remote_datasource_imlpl.dart'
    as _i947;
import '../../Features/signup/data/datasource/signup_remote_datasource.dart'
    as _i776;
import '../../Features/signup/data/repositories_implementation/signup_repo_impl.dart'
    as _i546;
import '../../Features/signup/domain/repositories/signup_repo.dart' as _i627;
import '../../Features/signup/domain/usecases/signup_usecase.dart' as _i228;
import '../../Features/signup/presentation/viewmodel/signup_view_model.dart'
    as _i410;
import 'dio_module/dio_module.dart' as _i484;

extension GetItInjectableX on _i174.GetIt {
  // initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(this, environment, environmentFilter);
    final dioModule = _$DioModule();
    gh.factory<String>(() => dioModule.baseUrl, instanceName: 'baseUrl');
    gh.lazySingleton<_i361.Dio>(
      () => dioModule.dio(gh<String>(instanceName: 'baseUrl')),
    );
    gh.factory<_i545.loginApiClient>(
      () => _i545.loginApiClient(
        gh<_i361.Dio>(),
        baseUrl: gh<String>(instanceName: 'baseUrl'),
      ),
    );
    gh.factory<_i991.signupApiClient>(
      () => _i991.signupApiClient(
        gh<_i361.Dio>(),
        baseUrl: gh<String>(instanceName: 'baseUrl'),
      ),
    );
    gh.lazySingleton<_i776.SignupRemoteDatasource>(
      () => _i947.SignupRemoteDataSourceImpl(gh<_i991.signupApiClient>()),
    );
    gh.factory<_i627.SignupRepo>(
      () => _i546.SignupRepoImpl(gh<_i776.SignupRemoteDatasource>()),
    );
    gh.lazySingleton<_i713.loginRemoteDataSource>(
      () => _i261.LoginRemoteDataSourceImpl(gh<_i545.loginApiClient>()),
    );
    gh.factory<_i228.SignupUseCase>(
      () => _i228.SignupUseCase(gh<_i627.SignupRepo>()),
    );
    gh.factory<_i554.loginRepo>(
      () => _i946.loginRepoImplemnation(gh<_i713.loginRemoteDataSource>()),
    );
    gh.factory<_i410.SignupViewModel>(
      () => _i410.SignupViewModel(gh<_i228.SignupUseCase>()),
    );
    gh.factory<_i643.LoginUseCase>(
      () => _i643.LoginUseCase(gh<_i554.loginRepo>()),
    );
    gh.factory<_i538.LoginViewModel>(
      () => _i538.LoginViewModel(gh<_i643.LoginUseCase>()),
    );
    return this;
  }
}

class _$DioModule extends _i484.DioModule {}
