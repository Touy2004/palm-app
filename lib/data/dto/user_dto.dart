
import 'package:palm_app/package.dart';
class UserDTO {
  final String id;
  final String? employeeCode;
  final String fullName;
  final String? email;
  final String? phone;
  final String role;
  final String? department;
  final String? status;
  final bool isPalmRegistered;

  UserDTO({
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

  factory UserDTO.fromJson(Map<String, dynamic> json) {
    return UserDTO(
      id: json['id'] as String,
      employeeCode: json['employee_code'] as String?,
      fullName: json['full_name'] as String,
      email: json['email'] as String?,
      phone: json['phone'] as String?,
      role: json['role'] as String,
      department: json['department'] as String?,
      status: json['status'] as String?,
      isPalmRegistered: json['is_palm_registered'] as bool? ?? false,
    );
  }

  User toDomain() {
    return User(
      id: id,
      employeeCode: employeeCode,
      fullName: fullName,
      email: email,
      phone: phone,
      role: role,
      department: department,
      status: status,
      isPalmRegistered: isPalmRegistered,
    );
  }
}
