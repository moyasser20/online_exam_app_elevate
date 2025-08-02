
import '../../data/models/user_data.dart';

abstract class ProfileRepo {


  Future<User> getProfileData();

}