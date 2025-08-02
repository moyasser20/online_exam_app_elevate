import '../../data/models/user_data.dart';

abstract class ProfileStates {}

class ProfileInitialState extends ProfileStates {}

class ProfileLoadingState extends ProfileStates {}

class ProfileSuccessState extends ProfileStates {
  final User user;

  ProfileSuccessState(this.user);
}


class ProfileErrorState extends ProfileStates {
  final String message;

  ProfileErrorState(this.message);
}
