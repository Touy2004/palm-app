class User {
  final String id;
  final String? employeeCode;
  final String fullName;
  final String? email;
  final String? phone;
  final String role;
  final String? department;
  final String? status;
  final bool isPalmRegistered;

  User({
    required this.id,
    this.employeeCode,
    required this.fullName,
    this.email,
    this.phone,
    required this.role,
    this.department,
    this.status,
    required this.isPalmRegistered,
  });
}

extension UserExtensions on User {
  String get initials {
    if (fullName.isEmpty) return 'U';
    final parts = fullName.split(' ');
    if (parts.length > 1) {
      return '${parts[0][0]}${parts[1][0]}'.toUpperCase();
    }
    return fullName.substring(0, 1).toUpperCase();
  }
}
