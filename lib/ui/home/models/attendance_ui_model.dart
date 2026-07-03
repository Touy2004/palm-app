class AttendanceUiModel {
  final String status;
  final bool isPresent;
  final String checkInTimeStr;
  final String checkOutTimeStr;
  final String durationStr;
  final String dayStr;
  final String monthStr;

  final DateTime? rawCheckInTime;
  final DateTime? rawCheckOutTime;

  AttendanceUiModel({
    required this.status,
    required this.isPresent,
    required this.checkInTimeStr,
    required this.checkOutTimeStr,
    required this.durationStr,
    required this.dayStr,
    required this.monthStr,
    this.rawCheckInTime,
    this.rawCheckOutTime,
  });
}
