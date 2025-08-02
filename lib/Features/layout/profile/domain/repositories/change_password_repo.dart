import '../../data/models/change_password_request_model.dart';

abstract class ChangePasswordRepo {

  Future<String> changePassword(ChangePasswordRequestModel model);


}