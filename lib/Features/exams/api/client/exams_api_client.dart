import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:online_exam_app_elevate/core/constants/api_constants/end_points.dart';
import 'package:retrofit/dio.dart';
import 'package:retrofit/error_logger.dart';
import 'package:retrofit/http.dart';
import '../../data/models/response/exam_details_response.dart';
import '../../data/models/response/exam_response.dart';
import '../../data/models/response/question_response.dart';

part 'exams_api_client.g.dart';

@injectable
@RestApi()
abstract class ExamsApiClient {
  @factoryMethod
  factory ExamsApiClient(Dio dio, {@Named('baseurl') String? baseUrl}) =>
      _ExamsApiClient(dio, baseUrl: baseUrl);

  @GET(EndPoints.exams)
  @Extra({'auth': true})
  Future<ExamResponse> getExamsBySubject(@Query('subject') String subjectId);

  @GET(EndPoints.examsDetails)
  @Extra({'auth': true})
  Future<ExamDetailsResponse> getExamDetail(@Path('id') String examId);

  @GET(EndPoints.questions)
  @Extra({'auth': true})
  Future<QuestionResponse> getQuestions(@Query('exam') String examId);
}
