abstract class AuthRepository {
  Future<bool> login(String phone, String password);
  Future<void> logout();
  Future<bool> refreshToken();
  Future<bool> isLoggedIn();
}
