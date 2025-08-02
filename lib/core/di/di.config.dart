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
import '../../Features/layout/explore/api/client/exam_api_client.dart' as _i686;
import '../../Features/layout/explore/api/datasource_implementation/subject_remote_datasource_implementation.dart'
    as _i439;
import '../../Features/layout/explore/data/datasource/subject_remote_datasource.dart'
    as _i303;
import '../../Features/layout/explore/data/repositories_implementation/subject_repo_impl.dart'
    as _i1010;
import '../../Features/layout/explore/domain/repositories/subject_repo.dart'
    as _i738;
import '../../Features/layout/explore/domain/usecases/get_all_subject_usecase.dart'
    as _i405;
import '../../Features/layout/explore/presentation/viewmodel/get_all_subject_viewmodel.dart'
    as _i1065;
import '../../Features/layout/profile/api/client/profile_api_client.dart'
    as _i791;
import '../../Features/layout/profile/api/datasource_implemenation/profile_data_remote_datasource_imp.dart'
    as _i51;
import '../../Features/layout/profile/data/datasource/profile_data_remote_datasource.dart'
    as _i811;
import '../../Features/layout/profile/data/repositories_implemenation/profile_data_repo_impl.dart'
    as _i432;
import '../../Features/layout/profile/domain/repositories/profile_data_repo.dart'
    as _i609;
import '../../Features/layout/profile/domain/usecases/profile_data_usecase.dart'
    as _i880;
import '../../Features/layout/profile/presentation/viewmodel/profile_viewmodel.dart'
    as _i892;
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
import '../storage/token_storage.dart' as _i973;
import 'dio_module/dio_module.dart' as _i484;

extension GetItInjectableX on _i174.GetIt {
  // initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(this, environment, environmentFilter);
    final dioModule = _$DioModule();
    gh.lazySingleton<_i973.TokenStorage>(() => _i973.TokenStorage());
    gh.factory<String>(() => dioModule.baseUrl, instanceName: 'baseurl');
    gh.lazySingleton<_i361.Dio>(
      () => dioModule.dio(
        gh<String>(instanceName: 'baseurl'),
        gh<_i973.TokenStorage>(),
      ),
    );
    gh.factory<_i545.loginApiClient>(
      () => _i545.loginApiClient(
        gh<_i361.Dio>(),
        baseUrl: gh<String>(instanceName: 'baseurl'),
      ),
    );
    gh.factory<_i686.ExamApiClient>(
      () => _i686.ExamApiClient(
        gh<_i361.Dio>(),
        baseUrl: gh<String>(instanceName: 'baseurl'),
      ),
    );
    gh.factory<_i791.ProfileApiClient>(
      () => _i791.ProfileApiClient(
        gh<_i361.Dio>(),
        baseUrl: gh<String>(instanceName: 'baseurl'),
      ),
    );
    gh.singleton<_i117.ForgetPasswordApiClient>(
      () => _i117.ForgetPasswordApiClient(
        gh<_i361.Dio>(),
        baseUrl: gh<String>(instanceName: 'baseurl'),
      ),
    );
    gh.singleton<_i991.SignupApiClient>(
      () => _i991.SignupApiClient(
        gh<_i361.Dio>(),
        baseUrl: gh<String>(instanceName: 'baseurl'),
      ),
    );
    gh.lazySingleton<_i713.loginRemoteDataSource>(
      () => _i261.LoginRemoteDataSourceImpl(gh<_i545.loginApiClient>()),
    );
    gh.lazySingleton<_i811.ProfileDataRemoteDatasource>(
      () => _i51.ProfileRemoteDataSourceImpl(
        apiClient: gh<_i791.ProfileApiClient>(),
      ),
    );
    gh.lazySingleton<_i303.SubjectRemoteDataSource>(
      () => _i439.SubjectsRemoteDataSourceImpl(gh<_i686.ExamApiClient>()),
    );
    gh.factory<_i959.ForgetPasswordRemoteDataSource>(
      () => _i104.ForgetPasswordRemoteDataSourceImp(
        gh<_i117.ForgetPasswordApiClient>(),
      ),
    );
    gh.lazySingleton<_i776.SignupRemoteDatasource>(
      () => _i947.SignupRemoteDataSourceImpl(gh<_i991.SignupApiClient>()),
    );
    gh.factory<_i554.LoginRepo>(
      () => _i946.LoginRepoImplementation(gh<_i713.loginRemoteDataSource>()),
    );
    gh.factory<_i627.SignupRepo>(
      () => _i546.SignupRepoImpl(gh<_i776.SignupRemoteDatasource>()),
    );
    gh.factory<_i134.ForgetPasswordRepo>(
      () => _i340.ForgetPasswordRepoImp(
        gh<_i959.ForgetPasswordRemoteDataSource>(),
      ),
    );
    gh.factory<_i609.ProfileRepo>(
      () => _i432.ProfileDataRepoImpl(gh<_i811.ProfileDataRemoteDatasource>()),
    );
    gh.lazySingleton<_i738.SubjectRepo>(
      () => _i1010.SubjectsRepoImpl(gh<_i303.SubjectRemoteDataSource>()),
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
    gh.factory<_i228.SignupUseCase>(
      () => _i228.SignupUseCase(gh<_i627.SignupRepo>()),
    );
    gh.factory<_i489.ForgetPasswordCubit>(
      () => _i489.ForgetPasswordCubit(gh<_i587.ForgetPasswordUseCase>()),
    );
    gh.factory<_i643.LoginUseCase>(
      () => _i643.LoginUseCase(gh<_i554.LoginRepo>()),
    );
    gh.factory<_i405.GetAllSubjectUseCases>(
      () => _i405.GetAllSubjectUseCases(gh<_i738.SubjectRepo>()),
    );
    gh.factory<_i538.LoginViewModel>(
      () => _i538.LoginViewModel(
        gh<_i643.LoginUseCase>(),
        gh<_i973.TokenStorage>(),
      ),
    );
    gh.factory<_i880.ProfileDataUseCase>(
      () => _i880.ProfileDataUseCase(gh<_i609.ProfileRepo>()),
    );
    gh.factory<_i410.SignupViewModel>(
      () => _i410.SignupViewModel(
        gh<_i228.SignupUseCase>(),
        gh<_i973.TokenStorage>(),
      ),
    );
    gh.factory<_i867.VerifyCodeCubit>(
      () => _i867.VerifyCodeCubit(
        gh<_i2.VerifyCodeUseCase>(),
        gh<_i587.ForgetPasswordUseCase>(),
      ),
    );
    gh.factory<_i1065.GetAllSubjectViewModel>(
      () => _i1065.GetAllSubjectViewModel(gh<_i405.GetAllSubjectUseCases>()),
    );
    gh.factory<_i892.ProfileViewModel>(
      () => _i892.ProfileViewModel(gh<_i880.ProfileDataUseCase>()),
    );
    gh.factory<_i439.ResetPasswordCubit>(
      () => _i439.ResetPasswordCubit(
        gh<_i117.ForgetPasswordApiClient>(),
        gh<_i643.LoginUseCase>(),
      ),
    );
    return this;
  }
}

class _$DioModule extends _i484.DioModule {}
