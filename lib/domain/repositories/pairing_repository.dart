
import 'package:palm_app/package.dart';
abstract class PairingRepository {
  Future<DeviceSession> scanSession(String sessionToken);
  Future<void> approveSession(String sessionToken, String handSide, String employeeCode);
}
