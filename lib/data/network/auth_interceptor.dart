import 'package:palm_app/package.dart';
import '../local/token_storage.dart';

class AuthInterceptor extends Interceptor {
  final TokenStorage tokenStorage;
  final Dio dio;

  AuthInterceptor(this.tokenStorage, this.dio);

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    final token = tokenStorage.accessToken;
    if (token != null) {
      options.headers['Authorization'] = 'Bearer $token';
    }
    super.onRequest(options, handler);
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) async {
    // Check if error is 401 Unauthorized
    if (err.response?.statusCode == 401) {
      final refreshToken = tokenStorage.refreshToken;
      if (refreshToken != null) {
        try {
          // Attempt to refresh token
          final response = await dio.post('/auth/refresh', data: {
            'refresh_token': refreshToken,
          });

          if (response.statusCode == 200) {
            final newAccessToken = response.data['data']['access_token'];
            final newRefreshToken = response.data['data']['refresh_token'];
            
            await tokenStorage.saveTokens(newAccessToken, newRefreshToken);

            // Retry original request with new token
            final opts = err.requestOptions;
            opts.headers['Authorization'] = 'Bearer $newAccessToken';
            final cloneReq = await dio.request(
              opts.path,
              options: Options(
                method: opts.method,
                headers: opts.headers,
              ),
              data: opts.data,
              queryParameters: opts.queryParameters,
            );
            return handler.resolve(cloneReq);
          }
        } catch (e) {
          // If refresh fails, clear tokens and pass the error down
          await tokenStorage.clearTokens();
        }
      } else {
        await tokenStorage.clearTokens();
      }
    }
    super.onError(err, handler);
  }
}
