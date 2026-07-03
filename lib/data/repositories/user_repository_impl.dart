import 'package:palm_app/package.dart';
import '../../domain/repositories/user_repository.dart';
import '../dto/user_dto.dart';
import '../dto/attendance_dto.dart';

class UserRepositoryImpl implements UserRepository {
  final Dio _dio;

  UserRepositoryImpl(this._dio);

  @override
  Future<User> getMyProfile() async {
    final response = await _dio.get('/me');
    final dto = UserDTO.fromJson(response.data['data']['user']);
    return dto.toDomain();
  }

  @override
  Future<void> changePassword(String oldPassword, String newPassword) async {
    await _dio.patch('/me/password', data: {
      'old_password': oldPassword,
      'new_password': newPassword,
    });
  }

  @override
  Future<List<Attendance>> getMyAttendance({
    int page = 1,
    int limit = 30,
    DateTime? startDate,
    DateTime? endDate,
  }) async {
    final Map<String, dynamic> queryParams = {
      'page': page,
      'limit': limit,
    };
    if (startDate != null) {
      queryParams['start_date'] = "${startDate.year}-${startDate.month.toString().padLeft(2, '0')}-${startDate.day.toString().padLeft(2, '0')}";
    }
    if (endDate != null) {
      queryParams['end_date'] = "${endDate.year}-${endDate.month.toString().padLeft(2, '0')}-${endDate.day.toString().padLeft(2, '0')}";
    }

    final response = await _dio.get('/me/attendance', queryParameters: queryParams);
    final List<dynamic> dataList = response.data['data'];
    return dataList.map((json) => AttendanceDTO.fromJson(json).toDomain()).toList();
  }

  @override
  Future<List<PalmTemplate>> getMyPalmTemplates() async {
    final response = await _dio.get('/me/palm-templates');
    final List<dynamic> dataList = response.data['data'];
    return dataList.map((json) => PalmTemplate(
      id: json['id'],
      userId: json['user_id'] ?? '',
      handSide: json['hand_side'],
      embeddingDim: json['embedding_dim'] ?? 128,
      modelVersion: json['model_version'] ?? 'unknown',
      threshold: (json['threshold'] as num?)?.toDouble() ?? 0.0,
      status: json['status'],
      registeredDeviceId: json['registered_device_id'] ?? '',
      registeredDeviceName: json['registered_device_name'] ?? 'Unknown Device',
      registeredDeviceCode: json['registered_device_code'] ?? 'Unknown Code',
      createdAt: DateTime.parse(json['created_at']),
      updatedAt: DateTime.parse(json['updated_at'] ?? json['created_at']),
      revokedAt: json['revoked_at'] != null ? DateTime.parse(json['revoked_at']) : null,
    )).toList();
  }

  @override
  Future<void> deletePalmTemplate(String templateId) async {
    await _dio.delete('/me/palm-templates/$templateId');
  }
}
