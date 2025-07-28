import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import '../../constants/api_constants/constants.dart';
import '../../storage/token_storage.dart';

@module
abstract class DioModule {
  @lazySingleton
  Dio dio(
      @Named('baseurl') String baseUrl,
      TokenStorage tokenStorage,
      ) {
    final dio = Dio(
      BaseOptions(
        baseUrl: baseUrl,
        connectTimeout: const Duration(seconds: 15),
        receiveTimeout: const Duration(seconds: 15),
        contentType: 'application/json',
      ),
    );

    // add token EveryTime in the api request if you need just add this annotation above the function @Extra({'auth': true})
    dio.interceptors.add(
      InterceptorsWrapper(
        onRequest: (options, handler) async {
          final needsAuth = options.extra['auth'] == true;

          if (needsAuth) {
            final token = await tokenStorage.getToken();
            if (token != null && token.isNotEmpty) {
              options.headers['Authorization'] = 'Bearer $token';
            }
          }

          return handler.next(options);
        },
      ),
    );

    return dio;
  }

  @Named('baseurl')
  String get baseUrl => ApiConstants.baseUrl;
}
