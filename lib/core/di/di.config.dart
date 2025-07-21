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

import '../../Features/forgetPassword/api/client/forget_password_client.dart'
    as _i117;
import '../../Features/forgetPassword/api/dataSource_implementation/forget_password_remote_datasource.dart'
    as _i104;
import '../../Features/forgetPassword/data/dataSource/forget_password_datasource.dart'
    as _i959;
import '../../Features/forgetPassword/data/repositories_implmentation/forget_repo_imp.dart'
    as _i340;
import '../../Features/forgetPassword/domain/repositories/forget_password_repo.dart'
    as _i134;
import '../../Features/forgetPassword/domain/usecases/forget_password_usecase.dart'
    as _i587;
import '../../Features/forgetPassword/domain/usecases/reset_password_usecase.dart'
    as _i1050;
import '../../Features/forgetPassword/domain/usecases/verify_code_usecase.dart'
    as _i2;
import '../../Features/forgetPassword/presentation/viewmodel/forget_password_viewmodel.dart'
    as _i489;
import '../../Features/forgetPassword/presentation/viewmodel/reset_password_cubit.dart'
    as _i439;
import '../../Features/forgetPassword/presentation/viewmodel/verify_code_cubit.dart'
    as _i867;
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
import 'dio_module/dio_module.dart' as _i484;

extension GetItInjectableX on _i174.GetIt {
  // initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(this, environment, environmentFilter);
    final dioModule = _$DioModule();
    gh.factory<_i439.ResetPasswordCubit>(() => _i439.ResetPasswordCubit());
    gh.factory<String>(() => dioModule.baseUrl, instanceName: 'baseurl');
    gh.lazySingleton<_i361.Dio>(
      () => dioModule.dio(gh<String>(instanceName: 'baseurl')),
    );
    gh.factory<_i545.loginApiClient>(
      () => _i545.loginApiClient(
        gh<_i361.Dio>(),
        baseUrl: gh<String>(instanceName: 'baseurl'),
      ),
    );
    gh.factory<_i117.ForgetPasswordApiClient>(
      () => _i117.ForgetPasswordApiClient(
        gh<_i361.Dio>(),
        baseUrl: gh<String>(instanceName: 'baseurl'),
      ),
    );
    gh.lazySingleton<_i713.loginRemoteDataSource>(
      () => _i261.LoginRemoteDataSourceImpl(gh<_i545.loginApiClient>()),
    );
    gh.factory<_i959.ForgetPasswordDataSource>(
      () => _i104.ForgetPasswordRemoteDataSourceImp(
        gh<_i117.ForgetPasswordApiClient>(),
      ),
    );
    gh.factory<_i554.loginRepo>(
      () => _i946.loginRepoImplemnation(gh<_i713.loginRemoteDataSource>()),
    );
    gh.factory<_i134.ForgetPasswordRepo>(
      () => _i340.ForgetPasswordRepoImp(gh<_i959.ForgetPasswordDataSource>()),
    );
    gh.factory<_i587.ForgetPasswordUseCase>(
      () => _i587.ForgetPasswordUseCase(gh<_i134.ForgetPasswordRepo>()),
    );
    gh.factory<_i1050.ResetPasswordUseCase>(
      () => _i1050.ResetPasswordUseCase(gh<_i134.ForgetPasswordRepo>()),
    );
    gh.factory<_i2.VerifyCodeUseCase>(
      () => _i2.VerifyCodeUseCase(gh<_i134.ForgetPasswordRepo>()),
    );
    gh.factory<_i489.ForgetPasswordCubit>(
      () => _i489.ForgetPasswordCubit(gh<_i587.ForgetPasswordUseCase>()),
    );
    gh.factory<_i643.LoginUseCase>(
      () => _i643.LoginUseCase(gh<_i554.loginRepo>()),
    );
    gh.factory<_i867.VerifyCodeCubit>(
      () => _i867.VerifyCodeCubit(gh<_i2.VerifyCodeUseCase>()),
    );
    gh.factory<_i538.LoginViewModel>(
      () => _i538.LoginViewModel(gh<_i643.LoginUseCase>()),
    );
    return this;
  }
}

class _$DioModule extends _i484.DioModule {}
