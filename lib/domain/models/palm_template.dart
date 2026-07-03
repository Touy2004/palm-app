class PalmTemplate {
  final String id;
  final String userId;
  final String handSide;
  final int embeddingDim;
  final String modelVersion;
  final double threshold;
  final String status;
  final String registeredDeviceId;
  final String registeredDeviceName;
  final String registeredDeviceCode;
  final DateTime createdAt;
  final DateTime updatedAt;
  final DateTime? revokedAt;

  PalmTemplate({
    required this.id,
    required this.userId,
    required this.handSide,
    required this.embeddingDim,
    required this.modelVersion,
    required this.threshold,
    required this.status,
    required this.registeredDeviceId,
    required this.registeredDeviceName,
    required this.registeredDeviceCode,
    required this.createdAt,
    required this.updatedAt,
    this.revokedAt,
  });
}
