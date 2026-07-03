class DeviceSession {
  final String deviceName;
  final String deviceCode;
  final String locationName;

  DeviceSession({
    required this.deviceName,
    required this.deviceCode,
    required this.locationName,
  });

  factory DeviceSession.fromJson(Map<String, dynamic> json) {
    final deviceObj = json['device'] as Map<String, dynamic>? ?? {};
    return DeviceSession(
      deviceName: deviceObj['device_name'] ?? 'Unknown Device',
      deviceCode: deviceObj['device_code'] ?? 'Unknown Code',
      locationName: deviceObj['location_name'] ?? 'Unknown Location',
    );
  }
}
