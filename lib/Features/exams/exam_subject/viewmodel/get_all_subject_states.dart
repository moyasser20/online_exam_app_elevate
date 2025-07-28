import 'package:online_exam_app_elevate/Features/exams/domain/entity/subjects_entity.dart';

abstract class GetAllSubjectStates {}

class GetAllSubjectInitialState extends GetAllSubjectStates {}
class GetAllSubjectLoadingState extends GetAllSubjectStates {}
class GetAllSubjectSuccessState extends GetAllSubjectStates {
  final List<SubjectEntity> subjects;

  GetAllSubjectSuccessState(this.subjects);
}
class GetAllSubjectErrorState extends GetAllSubjectStates {
  final String message;

  GetAllSubjectErrorState(this.message);
}