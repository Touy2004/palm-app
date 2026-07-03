
import 'package:palm_app/package.dart';

class AuthState {
  final bool isLoading;
  final User? user;
  final String? error;

  AuthState({
    this.isLoading = false,
    this.user,
    this.error,
  });

  AuthState copyWith({
    bool? isLoading,
    User? user,
    String? error,
  }) {
    return AuthState(
      isLoading: isLoading ?? this.isLoading,
      user: user ?? this.user,
      error: error,
    );
  }
}

class AuthService extends Notifier<AuthState> {
  @override
  AuthState build() {
    // Defer the execution so it runs after the provider is fully initialized.
    Future.microtask(() => _checkInitialAuth());
    return AuthState(isLoading: true);
  }

  Future<void> _checkInitialAuth() async {
    try {
      final authRepo = ref.read(authRepositoryProvider);
      final isLoggedIn = await authRepo.isLoggedIn();
      if (isLoggedIn) {
        final userRepo = ref.read(userRepositoryProvider);
        final user = await userRepo.getMyProfile();
        state = state.copyWith(user: user, isLoading: false);
      } else {
        state = state.copyWith(isLoading: false);
      }
    } catch (e) {
      state = state.copyWith(isLoading: false, error: ApiErrorParser.parse(e));
    }
  }

  Future<bool> login(String phone, String password) async {
    state = state.copyWith(isLoading: true, error: null);
    try {
      final authRepo = ref.read(authRepositoryProvider);
      final success = await authRepo.login(phone, password);
      if (success) {
        final userRepo = ref.read(userRepositoryProvider);
        final user = await userRepo.getMyProfile();
        state = state.copyWith(user: user, isLoading: false);
        return true;
      } else {
        state = state.copyWith(isLoading: false, error: 'Login failed. Please check your credentials.');
        return false;
      }
    } catch (e) {
      state = state.copyWith(isLoading: false, error: ApiErrorParser.parse(e));
      return false;
    }
  }

  Future<void> refreshProfile() async {
    try {
      final userRepo = ref.read(userRepositoryProvider);
      final user = await userRepo.getMyProfile();
      state = state.copyWith(user: user);
    } catch (e) {
      // Just ignore silently or handle
    }
  }

  Future<void> logout() async {
    final authRepo = ref.read(authRepositoryProvider);
    await authRepo.logout();
    state = AuthState(); // Reset state
  }
}
