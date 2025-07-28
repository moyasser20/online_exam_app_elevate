import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:online_exam_app_elevate/Features/exams/data/models/subject_model.dart';
import 'package:retrofit/dio.dart';
import 'package:retrofit/error_logger.dart';
import 'package:retrofit/http.dart';

part 'exam_api_client.g.dart';

@injectable
@RestApi()
abstract class ExamApiClient {
  @factoryMethod
  factory ExamApiClient(Dio dio, {@Named('baseurl') String? baseUrl}) =>
      _ExamApiClient(dio, baseUrl: baseUrl);

  @GET('/subjects')
  @Extra({'auth': true})
  Future<List<SubjectModel>> getAllSubjects();
}
