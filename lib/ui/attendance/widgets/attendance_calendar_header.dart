import 'package:palm_app/package.dart';
import '../view_models/attendance_view_model.dart';

class AttendanceCalendarHeader extends ConsumerWidget {
  final DateTime focusedMonth;

  const AttendanceCalendarHeader({super.key, required this.focusedMonth});

  List<String> _getWeekDays(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    return [
      l10n.sun,
      l10n.mon,
      l10n.tue,
      l10n.wed,
      l10n.thu,
      l10n.fri,
      l10n.sat,
    ];
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final monthFormat = DateFormat('MMMM yyyy');

    return Column(
      children: [
        // Month Navigation Header
        Container(
          padding: EdgeInsets.symmetric(
            horizontal: 16.w,
            vertical: 12.h,
          ),
          color: context.backgroundColor,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                monthFormat.format(focusedMonth),
                style: TextStyle(
                  fontSize: 20.sp,
                  fontWeight: FontWeight.w600,
                  color: context.textPrimary,
                ),
              ),
              Row(
                children: [
                  IconButton(
                    icon: Icon(
                      Icons.chevron_left,
                      color: context.textSecondary,
                    ),
                    onPressed: () => ref
                        .read(attendanceViewModelProvider.notifier)
                        .changeMonth(-1),
                  ),
                  IconButton(
                    icon: Icon(
                      Icons.chevron_right,
                      color: context.textSecondary,
                    ),
                    onPressed: () => ref
                        .read(attendanceViewModelProvider.notifier)
                        .changeMonth(1),
                  ),
                ],
              ),
            ],
          ),
        ),

        // Weekdays Header
        Container(
          color: context.surfaceColor,
          padding: EdgeInsets.symmetric(vertical: 8.h),
          child: Row(
            children: _getWeekDays(context)
                .map(
                  (day) => Expanded(
                    child: Text(
                      day,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 12.sp,
                        fontWeight: FontWeight.w600,
                        color: context.primaryColor,
                      ),
                    ),
                  ),
                )
                .toList(),
          ),
        ),
      ],
    );
  }
}
