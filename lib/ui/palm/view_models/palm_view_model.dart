
import 'package:palm_app/package.dart';
class PalmViewModel extends AsyncNotifier<List<PalmTemplate>> {
  @override
  Future<List<PalmTemplate>> build() async {
    ref.watch(authServiceProvider.select((s) => s.user?.id));
    return _fetchPalms();
  }

  Future<List<PalmTemplate>> _fetchPalms() async {
    final repo = ref.watch(userRepositoryProvider);
    return repo.getMyPalmTemplates();
  }

  Future<void> refresh() async {
    state = const AsyncValue.loading();
    try {
      final newState = await _fetchPalms();
      state = AsyncValue.data(newState);
    } catch (e, st) {
      state = AsyncValue.error(e, st);
    }
  }
}

final palmViewModelProvider = AsyncNotifierProvider<PalmViewModel, List<PalmTemplate>>(() {
  return PalmViewModel();
});
