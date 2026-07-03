import 'package:palm_app/package.dart';
import '../repositories/pairing_repository.dart';

class PairingService {
  final PairingRepository _pairingRepository;

  PairingService(this._pairingRepository);

  /// Scans the QR session token and returns device details if valid.
  Future<DeviceSession> scanSession(String sessionToken) async {
    try {
      final deviceData = await _pairingRepository.scanSession(sessionToken);
      return deviceData;
    } catch (e) {
      throw Exception('Failed to scan pairing session: $e');
    }
  }

  /// Approves the session, allowing the hardware device to begin enrollment.
  Future<void> approveSession(String sessionToken, String handSide, String employeeCode) async {
    try {
      await _pairingRepository.approveSession(sessionToken, handSide, employeeCode);
    } catch (e) {
      throw Exception('Failed to approve pairing session: $e');
    }
  }
}
