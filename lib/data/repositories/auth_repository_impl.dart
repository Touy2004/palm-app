import '../../domain/repositories/auth_repository.dart';
import '../data_sources/auth_remote_data_source.dart';
import '../local/token_storage.dart';

class AuthRepositoryImpl implements AuthRepository {
  final AuthRemoteDataSource _remoteDataSource;
  final TokenStorage _tokenStorage;

  AuthRepositoryImpl(this._remoteDataSource, this._tokenStorage);

  @override
  Future<bool> login(String phone, String password) async {
    try {
      final data = await _remoteDataSource.login(phone, password);
      if (data['code'] == 200 && data['data'] != null) {
        final accessToken = data['data']['access_token'];
        final refreshToken = data['data']['refresh_token'];
        if (accessToken != null && refreshToken != null) {
          await _tokenStorage.saveTokens(accessToken, refreshToken);
          return true;
        }
      }
      return false;
    } catch (e) {
      // Handle Dio errors, etc.
      rethrow;
    }
  }

  @override
  Future<void> logout() async {
    await _tokenStorage.clearTokens();
  }

  @override
  Future<bool> refreshToken() async {
    // Refresh logic is handled by the interceptor for active requests.
    return false;
  }

  @override
  Future<bool> isLoggedIn() async {
    return _tokenStorage.hasToken;
  }
}
