
import 'package:palm_app/package.dart';
class ChangePasswordViewModel extends AsyncNotifier<void> {
  @override
  FutureOr<void> build() {
    ref.watch(authServiceProvider.select((s) => s.user?.id));
    // Initial state is null data
  }

  Future<String?> changePassword(String oldPassword, String newPassword) async {
    state = const AsyncValue.loading();
    try {
      final userRepository = ref.read(userRepositoryProvider);
      await userRepository.changePassword(oldPassword, newPassword);
      state = const AsyncValue.data(null);
      return null; // No error
    } catch (e, st) {
      state = AsyncValue.error(e, st);
      return e.toString();
    }
  }
}

final changePasswordViewModelProvider = AsyncNotifierProvider<ChangePasswordViewModel, void>(() {
  return ChangePasswordViewModel();
});
