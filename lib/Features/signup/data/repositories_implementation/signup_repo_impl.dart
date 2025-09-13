import 'package:injectable/injectable.dart';
import 'package:online_exam_app_elevate/Features/signup/api/models/signup_request.dart';
import 'package:online_exam_app_elevate/Features/signup/api/models/signup_response.dart';
import 'package:online_exam_app_elevate/Features/signup/data/datasource/signup_remote_datasource.dart';
import '../../domain/repositories/signup_repo.dart';

@Injectable(as: SignupRepo)
class SignupRepoImpl extends SignupRepo {
  final SignupRemoteDatasource _remoteDatasource;

  SignupRepoImpl(this._remoteDatasource);

  @override
  Future<SignupResponse> signup(SignupRequest request) {
    return _remoteDatasource.signup(request);
  }
}
