import 'package:palm_app/package.dart';
import '../models/profile_ui_model.dart';

final profileViewModelProvider = Provider<ProfileUiModel?>((ref) {
  final user = ref.watch(authServiceProvider).user;
  
  if (user == null) {
    return null;
  }

  // Format subtitle
  final dept = user.department?.isNotEmpty == true ? user.department! : 'Unknown Dept';
  final role = user.role.isNotEmpty ? user.role : 'Employee';
  // Capitalize role nicely
  final formattedRole = '${role[0].toUpperCase()}${role.substring(1).toLowerCase()}';
  final subtitle = '$dept · $formattedRole';

  // Format statuses
  final palmStatus = user.isPalmRegistered ? 'Registered' : 'Not Registered';
  final accountStatus = user.status?.isNotEmpty == true 
      ? '${user.status![0].toUpperCase()}${user.status!.substring(1).toLowerCase()}'
      : 'Active';

  // Format phone (obfuscate or format if needed, here we just show what we have, 
  // maybe fallback if empty)
  final phone = user.phone?.isNotEmpty == true ? user.phone! : 'N/A';
  final email = user.email?.isNotEmpty == true ? user.email! : 'N/A';
  final empCode = user.employeeCode?.isNotEmpty == true ? user.employeeCode! : 'N/A';

  return ProfileUiModel(
    initials: user.initials,
    fullName: user.fullName,
    employeeCode: empCode,
    subtitle: subtitle,
    phone: phone,
    email: email,
    department: dept,
    palmStatus: palmStatus,
    accountStatus: accountStatus,
  );
});
