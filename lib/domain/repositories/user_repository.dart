
import 'package:palm_app/package.dart';
abstract class UserRepository {
  Future<User> getMyProfile();
  Future<void> changePassword(String oldPassword, String newPassword);
  Future<List<Attendance>> getMyAttendance({int page = 1, int limit = 30, DateTime? startDate, DateTime? endDate});
  Future<List<PalmTemplate>> getMyPalmTemplates();
  Future<void> deletePalmTemplate(String templateId);
}
