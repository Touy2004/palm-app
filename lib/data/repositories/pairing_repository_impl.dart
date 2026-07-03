import 'package:palm_app/package.dart';
import '../../domain/repositories/pairing_repository.dart';

class PairingRepositoryImpl implements PairingRepository {
  final Dio _dio;

  PairingRepositoryImpl(this._dio);

  @override
  Future<DeviceSession> scanSession(String sessionToken) async {
    final response = await _dio.post('/pairing/scan', data: {
      'session_token': sessionToken,
    });
    return DeviceSession.fromJson(response.data['data']);
  }

  @override
  Future<void> approveSession(String sessionToken, String handSide, String employeeCode) async {
    await _dio.post('/admin/pairing/approve', data: {
      'session_token': sessionToken,
      'hand_side': handSide,
      'employee_code': employeeCode,
    });
  }
}
