import 'package:palm_app/package.dart';
import '../models/attendance_ui_model.dart';
import 'recent_attendance_item.dart';

class HomeRecentList extends StatelessWidget {
  final List<AttendanceUiModel> recentAttendances;

  const HomeRecentList({
    super.key,
    required this.recentAttendances,
  });

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          l10n.recentAttendance,
          style: TextStyle(
            color: context.primaryColor,
            fontSize: 18.sp,
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(height: 8.h),
        if (recentAttendances.isEmpty)
          Padding(
            padding: EdgeInsets.symmetric(vertical: 32.h),
            child: Center(
              child: Text(
                l10n.noAttendanceRecordsFound,
                style: TextStyle(color: context.textSecondary),
              ),
            ),
          )
        else
          ...recentAttendances.map(
            (uiModel) => RecentAttendanceItem(uiModel: uiModel),
          ),
      ],
    );
  }
}
