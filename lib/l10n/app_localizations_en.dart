// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for English (`en`).
class AppLocalizationsEn extends AppLocalizations {
  AppLocalizationsEn([String locale = 'en']) : super(locale);

  @override
  String get home => 'Home';

  @override
  String get attendance => 'Attendance';

  @override
  String get myPalm => 'My Palm';

  @override
  String get profile => 'Profile';

  @override
  String get today => 'TODAY';

  @override
  String get checkIn => 'Check In';

  @override
  String get checkOut => 'Check Out';

  @override
  String get duration => 'Duration';

  @override
  String get presentThisMonth => 'Present this month';

  @override
  String get lateThisMonth => 'Late this month';

  @override
  String get recentAttendance => 'Recent attendance';

  @override
  String get noAttendanceRecordsFound => 'No attendance records found.';

  @override
  String get worked => 'worked';

  @override
  String get attendanceDetails => 'Attendance Details';

  @override
  String get deviceName => 'Device Name';

  @override
  String get deviceCode => 'Device Code';

  @override
  String get myPalms => 'My Palms';

  @override
  String get noPalmsRegistered => 'No palms registered.';

  @override
  String get registerPalm => 'Register Palm';

  @override
  String get retry => 'Retry';

  @override
  String get rightPalm => 'Right Palm';

  @override
  String get leftPalm => 'Left Palm';

  @override
  String get enrolled => 'Enrolled';

  @override
  String get device => 'Device';

  @override
  String get accountInfo => 'ACCOUNT INFO';

  @override
  String get phone => 'Phone';

  @override
  String get email => 'Email';

  @override
  String get department => 'Department';

  @override
  String get security => 'SECURITY';

  @override
  String get palmStatus => 'Palm status';

  @override
  String get accountStatus => 'Account status';

  @override
  String get changePassword => 'Change Password';

  @override
  String get signOut => 'Log Out';

  @override
  String get statusAbsent => 'Absent';

  @override
  String get statusPresent => 'Present';

  @override
  String get statusLate => 'Late';

  @override
  String get statusHoliday => 'Holiday';

  @override
  String get statusLeave => 'Leave';

  @override
  String get language => 'Language';

  @override
  String get english => 'English';

  @override
  String get lao => 'ພາສາລາວ';

  @override
  String get goodMorning => 'Good morning';

  @override
  String get goodAfternoon => 'Good afternoon';

  @override
  String get goodEvening => 'Good evening';

  @override
  String get sun => 'SUN';

  @override
  String get mon => 'MON';

  @override
  String get tue => 'TUE';

  @override
  String get wed => 'WED';

  @override
  String get thu => 'THU';

  @override
  String get fri => 'FRI';

  @override
  String get sat => 'SAT';

  @override
  String get preferences => 'Preferences';

  @override
  String get darkMode => 'Dark Mode';

  @override
  String get lightMode => 'Light Mode';

  @override
  String get systemTheme => 'System Theme';

  @override
  String get palmApproval => 'Palm Approval';

  @override
  String get sessionTimeOut => 'Session time out';

  @override
  String sessionExpiresIn(String time) {
    return 'Session expires in $time';
  }

  @override
  String get whichHandScanning => 'Which hand are you scanning?';

  @override
  String get leftHand => 'Left Hand';

  @override
  String get rightHand => 'Right Hand';

  @override
  String get whatHappensNext => 'What happens next?';

  @override
  String get instruction1 => 'Tap Approve below to start.';

  @override
  String get instruction2 => 'Go to the device and place your palm.';

  @override
  String get instruction3 => 'Hold steady while samples are captured.';

  @override
  String get approveEnrollment => 'Approve Enrollment';

  @override
  String get cancel => 'Cancel';

  @override
  String get pairingApproved => 'Pairing Approved! Look at the scanner device.';

  @override
  String get approvalFailed => 'Approval Failed';

  @override
  String get removePalm => 'Remove Palm';

  @override
  String get removePalmConfirm =>
      'Are you sure you want to remove this palm template? You will not be able to check in until you re-register.';

  @override
  String get remove => 'Remove';

  @override
  String get reRegisterPalm => 'Re-register Palm';

  @override
  String get reRegisterPalmConfirm =>
      'This will remove your current palm template and start a new enrollment session. Continue?';

  @override
  String get continueAction => 'Continue';

  @override
  String get handSide => 'Hand side';

  @override
  String get modelVersion => 'Model version';

  @override
  String get enrolledOn => 'Enrolled on';

  @override
  String get palmRemovedSuccess => 'Palm removed successfully.';

  @override
  String failed(String error) {
    return 'Failed: $error';
  }

  @override
  String get scanQrCode => 'Scan QR Code';

  @override
  String get cameraPermissionRequired =>
      'Camera permission is required to scan QR codes.';

  @override
  String get scanQrCodeOnDevice => 'Scan the QR code on the Palm Device';

  @override
  String get activeProfile => 'Active Profile';

  @override
  String get palmEnrolledDesc =>
      'Your palm is enrolled and securely stored.\nYou can check in/out at any supported device.';
}
