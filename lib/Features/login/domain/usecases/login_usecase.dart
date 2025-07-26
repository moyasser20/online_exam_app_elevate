import 'package:injectable/injectable.dart';
import 'package:online_exam_app_elevate/Features/login/data/models/login_response.dart';
import 'package:online_exam_app_elevate/Features/login/data/models/login_request.dart';
import 'package:online_exam_app_elevate/Features/login/domain/repositories/login_repo.dart';

@injectable
class LoginUseCase{
  final LoginRepo _repo;

  LoginUseCase(this._repo);

  Future<LoginResponse> call(loginRequest request){
    return _repo.login(request);
  }
}