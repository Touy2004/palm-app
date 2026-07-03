import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'app_localizations_en.dart';
import 'app_localizations_lo.dart';

// ignore_for_file: type=lint

/// Callers can lookup localized strings with an instance of AppLocalizations
/// returned by `AppLocalizations.of(context)`.
///
/// Applications need to include `AppLocalizations.delegate()` in their app's
/// `localizationDelegates` list, and the locales they support in the app's
/// `supportedLocales` list. For example:
///
/// ```dart
/// import 'l10n/app_localizations.dart';
///
/// return MaterialApp(
///   localizationsDelegates: AppLocalizations.localizationsDelegates,
///   supportedLocales: AppLocalizations.supportedLocales,
///   home: MyApplicationHome(),
/// );
/// ```
///
/// ## Update pubspec.yaml
///
/// Please make sure to update your pubspec.yaml to include the following
/// packages:
///
/// ```yaml
/// dependencies:
///   # Internationalization support.
///   flutter_localizations:
///     sdk: flutter
///   intl: any # Use the pinned version from flutter_localizations
///
///   # Rest of dependencies
/// ```
///
/// ## iOS Applications
///
/// iOS applications define key application metadata, including supported
/// locales, in an Info.plist file that is built into the application bundle.
/// To configure the locales supported by your app, you’ll need to edit this
/// file.
///
/// First, open your project’s ios/Runner.xcworkspace Xcode workspace file.
/// Then, in the Project Navigator, open the Info.plist file under the Runner
/// project’s Runner folder.
///
/// Next, select the Information Property List item, select Add Item from the
/// Editor menu, then select Localizations from the pop-up menu.
///
/// Select and expand the newly-created Localizations item then, for each
/// locale your application supports, add a new item and select the locale
/// you wish to add from the pop-up menu in the Value field. This list should
/// be consistent with the languages listed in the AppLocalizations.supportedLocales
/// property.
abstract class AppLocalizations {
  AppLocalizations(String locale)
    : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static AppLocalizations? of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations);
  }

  static const LocalizationsDelegate<AppLocalizations> delegate =
      _AppLocalizationsDelegate();

  /// A list of this localizations delegate along with the default localizations
  /// delegates.
  ///
  /// Returns a list of localizations delegates containing this delegate along with
  /// GlobalMaterialLocalizations.delegate, GlobalCupertinoLocalizations.delegate,
  /// and GlobalWidgetsLocalizations.delegate.
  ///
  /// Additional delegates can be added by appending to this list in
  /// MaterialApp. This list does not have to be used at all if a custom list
  /// of delegates is preferred or required.
  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates =
      <LocalizationsDelegate<dynamic>>[
        delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ];

  /// A list of this localizations delegate's supported locales.
  static const List<Locale> supportedLocales = <Locale>[
    Locale('en'),
    Locale('lo'),
  ];

  /// No description provided for @home.
  ///
  /// In en, this message translates to:
  /// **'Home'**
  String get home;

  /// No description provided for @attendance.
  ///
  /// In en, this message translates to:
  /// **'Attendance'**
  String get attendance;

  /// No description provided for @myPalm.
  ///
  /// In en, this message translates to:
  /// **'My Palm'**
  String get myPalm;

  /// No description provided for @profile.
  ///
  /// In en, this message translates to:
  /// **'Profile'**
  String get profile;

  /// No description provided for @today.
  ///
  /// In en, this message translates to:
  /// **'TODAY'**
  String get today;

  /// No description provided for @checkIn.
  ///
  /// In en, this message translates to:
  /// **'Check In'**
  String get checkIn;

  /// No description provided for @checkOut.
  ///
  /// In en, this message translates to:
  /// **'Check Out'**
  String get checkOut;

  /// No description provided for @duration.
  ///
  /// In en, this message translates to:
  /// **'Duration'**
  String get duration;

  /// No description provided for @presentThisMonth.
  ///
  /// In en, this message translates to:
  /// **'Present this month'**
  String get presentThisMonth;

  /// No description provided for @lateThisMonth.
  ///
  /// In en, this message translates to:
  /// **'Late this month'**
  String get lateThisMonth;

  /// No description provided for @recentAttendance.
  ///
  /// In en, this message translates to:
  /// **'Recent attendance'**
  String get recentAttendance;

  /// No description provided for @noAttendanceRecordsFound.
  ///
  /// In en, this message translates to:
  /// **'No attendance records found.'**
  String get noAttendanceRecordsFound;

  /// No description provided for @worked.
  ///
  /// In en, this message translates to:
  /// **'worked'**
  String get worked;

  /// No description provided for @attendanceDetails.
  ///
  /// In en, this message translates to:
  /// **'Attendance Details'**
  String get attendanceDetails;

  /// No description provided for @deviceName.
  ///
  /// In en, this message translates to:
  /// **'Device Name'**
  String get deviceName;

  /// No description provided for @deviceCode.
  ///
  /// In en, this message translates to:
  /// **'Device Code'**
  String get deviceCode;

  /// No description provided for @myPalms.
  ///
  /// In en, this message translates to:
  /// **'My Palms'**
  String get myPalms;

  /// No description provided for @noPalmsRegistered.
  ///
  /// In en, this message translates to:
  /// **'No palms registered.'**
  String get noPalmsRegistered;

  /// No description provided for @registerPalm.
  ///
  /// In en, this message translates to:
  /// **'Register Palm'**
  String get registerPalm;

  /// No description provided for @retry.
  ///
  /// In en, this message translates to:
  /// **'Retry'**
  String get retry;

  /// No description provided for @rightPalm.
  ///
  /// In en, this message translates to:
  /// **'Right Palm'**
  String get rightPalm;

  /// No description provided for @leftPalm.
  ///
  /// In en, this message translates to:
  /// **'Left Palm'**
  String get leftPalm;

  /// No description provided for @enrolled.
  ///
  /// In en, this message translates to:
  /// **'Enrolled'**
  String get enrolled;

  /// No description provided for @device.
  ///
  /// In en, this message translates to:
  /// **'Device'**
  String get device;

  /// No description provided for @accountInfo.
  ///
  /// In en, this message translates to:
  /// **'ACCOUNT INFO'**
  String get accountInfo;

  /// No description provided for @phone.
  ///
  /// In en, this message translates to:
  /// **'Phone'**
  String get phone;

  /// No description provided for @email.
  ///
  /// In en, this message translates to:
  /// **'Email'**
  String get email;

  /// No description provided for @department.
  ///
  /// In en, this message translates to:
  /// **'Department'**
  String get department;

  /// No description provided for @security.
  ///
  /// In en, this message translates to:
  /// **'SECURITY'**
  String get security;

  /// No description provided for @palmStatus.
  ///
  /// In en, this message translates to:
  /// **'Palm status'**
  String get palmStatus;

  /// No description provided for @accountStatus.
  ///
  /// In en, this message translates to:
  /// **'Account status'**
  String get accountStatus;

  /// No description provided for @changePassword.
  ///
  /// In en, this message translates to:
  /// **'Change Password'**
  String get changePassword;

  /// No description provided for @signOut.
  ///
  /// In en, this message translates to:
  /// **'Log Out'**
  String get signOut;

  /// No description provided for @statusAbsent.
  ///
  /// In en, this message translates to:
  /// **'Absent'**
  String get statusAbsent;

  /// No description provided for @statusPresent.
  ///
  /// In en, this message translates to:
  /// **'Present'**
  String get statusPresent;

  /// No description provided for @statusLate.
  ///
  /// In en, this message translates to:
  /// **'Late'**
  String get statusLate;

  /// No description provided for @statusHoliday.
  ///
  /// In en, this message translates to:
  /// **'Holiday'**
  String get statusHoliday;

  /// No description provided for @statusLeave.
  ///
  /// In en, this message translates to:
  /// **'Leave'**
  String get statusLeave;

  /// No description provided for @language.
  ///
  /// In en, this message translates to:
  /// **'Language'**
  String get language;

  /// No description provided for @english.
  ///
  /// In en, this message translates to:
  /// **'English'**
  String get english;

  /// No description provided for @lao.
  ///
  /// In en, this message translates to:
  /// **'ພາສາລາວ'**
  String get lao;

  /// No description provided for @goodMorning.
  ///
  /// In en, this message translates to:
  /// **'Good morning'**
  String get goodMorning;

  /// No description provided for @goodAfternoon.
  ///
  /// In en, this message translates to:
  /// **'Good afternoon'**
  String get goodAfternoon;

  /// No description provided for @goodEvening.
  ///
  /// In en, this message translates to:
  /// **'Good evening'**
  String get goodEvening;

  /// No description provided for @sun.
  ///
  /// In en, this message translates to:
  /// **'SUN'**
  String get sun;

  /// No description provided for @mon.
  ///
  /// In en, this message translates to:
  /// **'MON'**
  String get mon;

  /// No description provided for @tue.
  ///
  /// In en, this message translates to:
  /// **'TUE'**
  String get tue;

  /// No description provided for @wed.
  ///
  /// In en, this message translates to:
  /// **'WED'**
  String get wed;

  /// No description provided for @thu.
  ///
  /// In en, this message translates to:
  /// **'THU'**
  String get thu;

  /// No description provided for @fri.
  ///
  /// In en, this message translates to:
  /// **'FRI'**
  String get fri;

  /// No description provided for @sat.
  ///
  /// In en, this message translates to:
  /// **'SAT'**
  String get sat;

  /// No description provided for @preferences.
  ///
  /// In en, this message translates to:
  /// **'Preferences'**
  String get preferences;

  /// No description provided for @darkMode.
  ///
  /// In en, this message translates to:
  /// **'Dark Mode'**
  String get darkMode;

  /// No description provided for @lightMode.
  ///
  /// In en, this message translates to:
  /// **'Light Mode'**
  String get lightMode;

  /// No description provided for @systemTheme.
  ///
  /// In en, this message translates to:
  /// **'System Theme'**
  String get systemTheme;

  /// No description provided for @palmApproval.
  ///
  /// In en, this message translates to:
  /// **'Palm Approval'**
  String get palmApproval;

  /// No description provided for @sessionTimeOut.
  ///
  /// In en, this message translates to:
  /// **'Session time out'**
  String get sessionTimeOut;

  /// No description provided for @sessionExpiresIn.
  ///
  /// In en, this message translates to:
  /// **'Session expires in {time}'**
  String sessionExpiresIn(String time);

  /// No description provided for @whichHandScanning.
  ///
  /// In en, this message translates to:
  /// **'Which hand are you scanning?'**
  String get whichHandScanning;

  /// No description provided for @leftHand.
  ///
  /// In en, this message translates to:
  /// **'Left Hand'**
  String get leftHand;

  /// No description provided for @rightHand.
  ///
  /// In en, this message translates to:
  /// **'Right Hand'**
  String get rightHand;

  /// No description provided for @whatHappensNext.
  ///
  /// In en, this message translates to:
  /// **'What happens next?'**
  String get whatHappensNext;

  /// No description provided for @instruction1.
  ///
  /// In en, this message translates to:
  /// **'Tap Approve below to start.'**
  String get instruction1;

  /// No description provided for @instruction2.
  ///
  /// In en, this message translates to:
  /// **'Go to the device and place your palm.'**
  String get instruction2;

  /// No description provided for @instruction3.
  ///
  /// In en, this message translates to:
  /// **'Hold steady while samples are captured.'**
  String get instruction3;

  /// No description provided for @approveEnrollment.
  ///
  /// In en, this message translates to:
  /// **'Approve Enrollment'**
  String get approveEnrollment;

  /// No description provided for @cancel.
  ///
  /// In en, this message translates to:
  /// **'Cancel'**
  String get cancel;

  /// No description provided for @pairingApproved.
  ///
  /// In en, this message translates to:
  /// **'Pairing Approved! Look at the scanner device.'**
  String get pairingApproved;

  /// No description provided for @approvalFailed.
  ///
  /// In en, this message translates to:
  /// **'Approval Failed'**
  String get approvalFailed;

  /// No description provided for @removePalm.
  ///
  /// In en, this message translates to:
  /// **'Remove Palm'**
  String get removePalm;

  /// No description provided for @removePalmConfirm.
  ///
  /// In en, this message translates to:
  /// **'Are you sure you want to remove this palm template? You will not be able to check in until you re-register.'**
  String get removePalmConfirm;

  /// No description provided for @remove.
  ///
  /// In en, this message translates to:
  /// **'Remove'**
  String get remove;

  /// No description provided for @reRegisterPalm.
  ///
  /// In en, this message translates to:
  /// **'Re-register Palm'**
  String get reRegisterPalm;

  /// No description provided for @reRegisterPalmConfirm.
  ///
  /// In en, this message translates to:
  /// **'This will remove your current palm template and start a new enrollment session. Continue?'**
  String get reRegisterPalmConfirm;

  /// No description provided for @continueAction.
  ///
  /// In en, this message translates to:
  /// **'Continue'**
  String get continueAction;

  /// No description provided for @handSide.
  ///
  /// In en, this message translates to:
  /// **'Hand side'**
  String get handSide;

  /// No description provided for @modelVersion.
  ///
  /// In en, this message translates to:
  /// **'Model version'**
  String get modelVersion;

  /// No description provided for @enrolledOn.
  ///
  /// In en, this message translates to:
  /// **'Enrolled on'**
  String get enrolledOn;

  /// No description provided for @palmRemovedSuccess.
  ///
  /// In en, this message translates to:
  /// **'Palm removed successfully.'**
  String get palmRemovedSuccess;

  /// No description provided for @failed.
  ///
  /// In en, this message translates to:
  /// **'Failed: {error}'**
  String failed(String error);

  /// No description provided for @scanQrCode.
  ///
  /// In en, this message translates to:
  /// **'Scan QR Code'**
  String get scanQrCode;

  /// No description provided for @cameraPermissionRequired.
  ///
  /// In en, this message translates to:
  /// **'Camera permission is required to scan QR codes.'**
  String get cameraPermissionRequired;

  /// No description provided for @scanQrCodeOnDevice.
  ///
  /// In en, this message translates to:
  /// **'Scan the QR code on the Palm Device'**
  String get scanQrCodeOnDevice;

  /// No description provided for @activeProfile.
  ///
  /// In en, this message translates to:
  /// **'Active Profile'**
  String get activeProfile;

  /// No description provided for @palmEnrolledDesc.
  ///
  /// In en, this message translates to:
  /// **'Your palm is enrolled and securely stored.\nYou can check in/out at any supported device.'**
  String get palmEnrolledDesc;
}

class _AppLocalizationsDelegate
    extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  Future<AppLocalizations> load(Locale locale) {
    return SynchronousFuture<AppLocalizations>(lookupAppLocalizations(locale));
  }

  @override
  bool isSupported(Locale locale) =>
      <String>['en', 'lo'].contains(locale.languageCode);

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}

AppLocalizations lookupAppLocalizations(Locale locale) {
  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'en':
      return AppLocalizationsEn();
    case 'lo':
      return AppLocalizationsLo();
  }

  throw FlutterError(
    'AppLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
    'an issue with the localizations generation tool. Please file an issue '
    'on GitHub with a reproducible sample app and the gen-l10n configuration '
    'that was used.',
  );
}
