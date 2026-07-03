
import 'package:palm_app/package.dart';
class AttendanceDTO {
  final String id;
  final String attendanceDate;
  final String? checkInTime;
  final String? checkOutTime;
  final String status;
  final String deviceName;
  final String? deviceCode;

  AttendanceDTO({
    required this.id,
    required this.attendanceDate,
    this.checkInTime,
    this.checkOutTime,
    required this.status,
    required this.deviceName,
    this.deviceCode,
  });

  factory AttendanceDTO.fromJson(Map<String, dynamic> json) {
    return AttendanceDTO(
      id: json['id'] as String,
      attendanceDate: json['attendance_date'] as String,
      checkInTime: json['check_in_time'] as String?,
      checkOutTime: json['check_out_time'] as String?,
      status: json['status'] as String,
      deviceName: json['device_name'] as String,
      deviceCode: json['device_code'] as String?,
    );
  }

  Attendance toDomain() {
    return Attendance(
      id: id,
      attendanceDate: DateTime.parse(attendanceDate).toLocal(),
      checkInTime: checkInTime != null ? DateTime.parse(checkInTime!).toLocal() : null,
      checkOutTime: checkOutTime != null ? DateTime.parse(checkOutTime!).toLocal() : null,
      status: status,
      deviceName: deviceName,
      deviceCode: deviceCode,
    );
  }
}
