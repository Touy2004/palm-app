/// TEMPORARY REFACTORING SCRIPT
/// This script was created by the AI assistant to automate the massive architecture refactor.
/// It scans through all `.dart` files in the `lib/` directory and replaces scattered, 
/// repetitive import statements with a single centralized import: `import 'package:palm_app/package.dart';`.
/// 
/// Note: This script has already fulfilled its purpose and can be safely deleted.
import 'dart:io';

const targets = [
  'package:flutter/',
  'package:flutter_riverpod/',
  'package:go_router/',
  'package:intl/',
  'package:dio/',
  'package:shimmer/',
  'package:shared_preferences/',
  'package:qr_code_scanner_plus/',
  'package:permission_handler/',
  'dart:async',
  'dart:io',
  'providers.dart',
  'api_constants.dart',
  'api_error_parser.dart',
  'ui_utils.dart',
  'app_theme.dart',
  'skeleton_loader.dart',
  'models/user.dart',
  'models/attendance.dart',
  'models/palm_template.dart',
  'models/device_session.dart'
];

const packageImport = "import 'package:palm_app/package.dart';";

void processFile(File file) {
  if (file.path.endsWith('package.dart')) return;
  final content = file.readAsStringSync();
  final lines = content.split('\n');
  final newLines = <String>[];
  var replaced = false;

  for (final line in lines) {
    final stripped = line.trim();
    if (stripped.startsWith('import ')) {
      var matched = false;
      for (final target in targets) {
        if (stripped.contains(target)) {
          matched = true;
          replaced = true;
          break;
        }
      }
      if (!matched) {
        newLines.add(line);
      }
    } else {
      newLines.add(line);
    }
  }

  if (replaced) {
    var insertIdx = 0;
    for (var i = 0; i < newLines.length; i++) {
      final l = newLines[i].trim();
      if (l.isNotEmpty && !l.startsWith('//') && !l.startsWith('library') && !l.startsWith('part')) {
        insertIdx = i;
        break;
      }
    }

    if (!newLines.map((l) => l.trim()).contains(packageImport)) {
      newLines.insert(insertIdx, packageImport);
    }

    file.writeAsStringSync(newLines.join('\n'));
  }
}

void main() {
  final libDir = Directory('/Users/macbookpro/Desktop/Thesis/palm_app/lib');
  for (final entity in libDir.listSync(recursive: true)) {
    if (entity is File && entity.path.endsWith('.dart')) {
      processFile(entity);
    }
  }
}
