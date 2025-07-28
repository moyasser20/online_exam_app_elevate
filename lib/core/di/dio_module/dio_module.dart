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

    dio.interceptors.add(
      InterceptorsWrapper(
        onRequest: (options, handler) async {
          final needsAuth = options.extra['auth'] == true;

          if (needsAuth) {
            final token = await tokenStorage.getToken();
            print('Token to be attached: $token');

            if (token != null && token.isNotEmpty) {
              options.headers['Authorization'] = 'Bearer $token';
            } else {
              print('No token found or token is empty.');
            }
          }

          print('Making request to: ${options.uri}');
          print('Request headers: ${options.headers}');
          return handler.next(options);
        },
      ),
    );

    return dio;
  }

  @Named('baseurl')
  String get baseUrl => ApiConstants.baseUrl;
}
