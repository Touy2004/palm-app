
import 'package:palm_app/package.dart';
class PalmDetailAction {
  final Ref ref;
  PalmDetailAction(this.ref);

  Future<String?> removePalm(String templateId) async {
    try {
      await ref.read(userRepositoryProvider).deletePalmTemplate(templateId);
      return null; // success
    } catch (e) {
      if (e is DioException && e.response?.data != null) {
        final serverData = e.response!.data;
        if (serverData is Map && serverData['message'] != null) {
          return serverData['message'].toString();
        }
      }
      return e.toString();
    }
  }
}

final palmDetailActionProvider = Provider<PalmDetailAction>((ref) {
  return PalmDetailAction(ref);
});
