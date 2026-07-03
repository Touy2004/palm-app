class Attendance {
  final String id;
  final DateTime attendanceDate;
  final DateTime? checkInTime;
  final DateTime? checkOutTime;
  final String status;
  final String deviceName;
  final String? deviceCode;

  Attendance({
    required this.id,
    required this.attendanceDate,
    this.checkInTime,
    this.checkOutTime,
    required this.status,
    required this.deviceName,
    this.deviceCode,
  });
}
