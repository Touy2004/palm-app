import 'package:palm_app/package.dart';
import '../data/local/token_storage.dart';
import '../data/network/auth_interceptor.dart';
import '../data/data_sources/auth_remote_data_source.dart';
import '../data/repositories/auth_repository_impl.dart';
import '../data/repositories/user_repository_impl.dart';
import '../data/repositories/pairing_repository_impl.dart';
import '../domain/repositories/auth_repository.dart';
import '../domain/repositories/user_repository.dart';
import '../domain/repositories/pairing_repository.dart';
import '../domain/services/auth_service.dart';
import '../domain/services/pairing_service.dart';

// --- Local Storage ---
final sharedPreferencesProvider = Provider<SharedPreferences>((ref) {
  throw UnimplementedError('sharedPreferencesProvider must be overridden in main.dart');
});

final tokenStorageProvider = Provider<TokenStorage>((ref) {
  final prefs = ref.watch(sharedPreferencesProvider);
  return TokenStorage(prefs);
});

// --- Network ---
final dioProvider = Provider<Dio>((ref) {
  final dio = Dio(BaseOptions(
    baseUrl: ApiConstants.baseUrl,
    connectTimeout: const Duration(seconds: 10),
    receiveTimeout: const Duration(seconds: 10),
  ));

  final tokenStorage = ref.watch(tokenStorageProvider);
  dio.interceptors.add(AuthInterceptor(tokenStorage, dio));
  
  return dio;
});

// --- Data Sources ---
final authRemoteDataSourceProvider = Provider<AuthRemoteDataSource>((ref) {
  final dio = ref.watch(dioProvider);
  return AuthRemoteDataSource(dio);
});

// --- Repositories ---
final authRepositoryProvider = Provider<AuthRepository>((ref) {
  final remoteDataSource = ref.watch(authRemoteDataSourceProvider);
  final tokenStorage = ref.watch(tokenStorageProvider);
  return AuthRepositoryImpl(remoteDataSource, tokenStorage);
});

final userRepositoryProvider = Provider<UserRepository>((ref) {
  final dio = ref.watch(dioProvider);
  return UserRepositoryImpl(dio);
});

final pairingRepositoryProvider = Provider<PairingRepository>((ref) {
  final dio = ref.watch(dioProvider);
  return PairingRepositoryImpl(dio);
});

// --- Services ---
final authServiceProvider = NotifierProvider<AuthService, AuthState>(() {
  return AuthService();
});

final pairingServiceProvider = Provider<PairingService>((ref) {
  final pairingRepo = ref.watch(pairingRepositoryProvider);
  return PairingService(pairingRepo);
});
