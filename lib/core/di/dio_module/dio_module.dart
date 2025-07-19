import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

import '../../constants/api_constants/constants.dart';
@module
abstract class DioModule {
  @lazySingleton
  Dio dio(@Named('baseUrl') String baseUrl) => Dio(
    BaseOptions(
      baseUrl: baseUrl,
      connectTimeout: const Duration(seconds: 15),
      receiveTimeout: const Duration(seconds: 15),
      contentType: 'application/json',
    ),
  );

  @Named('baseUrl')
  String get baseUrl => ApiConstants.baseUrl;
}