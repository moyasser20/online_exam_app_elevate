import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:retrofit/dio.dart';
import 'package:retrofit/error_logger.dart';
import 'package:retrofit/http.dart';

import '../../data/models/exam_model.dart';
import '../../data/models/response/exam_response.dart';
import '../../data/models/response/question_response.dart';


part 'exams_api_client.g.dart';

@injectable
@RestApi()
abstract class ExamsApiClient {
  @factoryMethod
  factory ExamsApiClient(Dio dio, {@Named('baseurl') String? baseUrl}) =>
      _ExamsApiClient(dio, baseUrl: baseUrl);

  @GET('/exams')
  @Extra({'auth': true})
  Future<ExamResponse> getExamsBySubject(
      @Query('subject') String subjectId,
      );

  @GET('/exams/{id}')
  @Extra({'auth': true})
  Future<ExamModel> getExamDetail(@Path('id') String examId);

  @GET('/questions')
  @Extra({'auth': true})
  Future<QuestionResponse> getQuestions(@Query('exam') String examId);

}
