class ApiConstants {
  static const String baseUrl = 'https://testtt.phoudthasone.com/api/v1';

  // Auth
  static const String login = '/auth/login';
  static const String refresh = '/auth/refresh';

  // User (Mobile App)
  static const String me = '/me';
  static const String changePassword = '/me/password';
  static const String myAttendance = '/me/attendance';
  static const String myPalmTemplates = '/me/palm-templates';

  // Pairing Flow
  static const String pairingScan = '/pairing/scan';
  static const String pairingApprove = '/pairing/approve';
}
