// External Packages
export 'package:flutter/material.dart';
export 'package:flutter_riverpod/flutter_riverpod.dart';
export 'package:go_router/go_router.dart';
export 'package:intl/intl.dart' hide TextDirection;
export 'package:dio/dio.dart';
export 'package:shimmer/shimmer.dart';
export 'package:shared_preferences/shared_preferences.dart';
export 'package:qr_code_scanner_plus/qr_code_scanner_plus.dart';
export 'package:permission_handler/permission_handler.dart';
export 'package:flutter_screenutil/flutter_screenutil.dart';
export 'package:palm_app/l10n/app_localizations.dart';
export 'package:flutter_localizations/flutter_localizations.dart';
export 'dart:async' hide AsyncError;
export 'dart:io';

// Core Internal Utilities
export 'package:palm_app/config/providers.dart';
export 'package:palm_app/config/api_constants.dart';
export 'package:palm_app/utils/api_error_parser.dart';
export 'package:palm_app/utils/ui_utils.dart';
export 'package:palm_app/ui/core/theme/app_theme.dart';
export 'package:palm_app/ui/core/providers/locale_provider.dart';
export 'package:palm_app/ui/core/providers/theme_provider.dart';
export 'package:palm_app/ui/core/widgets/skeleton_loader.dart';
export 'package:palm_app/ui/core/widgets/splash_skeleton.dart';

// Models
export 'package:palm_app/domain/models/user.dart';
export 'package:palm_app/domain/models/attendance.dart';
export 'package:palm_app/domain/models/palm_template.dart';
export 'package:palm_app/domain/models/device_session.dart';