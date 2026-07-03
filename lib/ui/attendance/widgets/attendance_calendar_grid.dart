import 'package:palm_app/package.dart';
import '../view_models/attendance_view_model.dart';

class AttendanceCalendarGrid extends StatelessWidget {
  final AttendanceState state;
  final int firstWeekday;
  final int daysInMonth;

  const AttendanceCalendarGrid({
    super.key,
    required this.state,
    required this.firstWeekday,
    required this.daysInMonth,
  });

  Color _getStatusColor(String status) {
    final lower = status.toLowerCase();
    if (lower == 'present') return const Color(0xFF4CB385); // Tealish green
    if (lower == 'late') return const Color(0xFFE66C00); // Orange
    if (lower == 'absent') return const Color(0xFFED4D4D); // Red
    return const Color(0xFF5584F0); // Blue for leaves/holidays
  }

  String _getStatusText(BuildContext context, String status) {
    final l10n = AppLocalizations.of(context)!;
    final lower = status.toLowerCase();
    if (lower == 'present') return l10n.statusPresent;
    if (lower == 'late') return l10n.statusLate;
    if (lower == 'absent') return l10n.statusAbsent;
    if (lower == 'leave') return l10n.statusLeave;
    if (lower == 'holiday') return l10n.statusHoliday;
    if (status.isEmpty) return '';
    return '${status[0].toUpperCase()}${status.substring(1).toLowerCase()}';
  }

  @override
  Widget build(BuildContext context) {
    const totalCells = 42; // 6 rows * 7 days

    return SliverPadding(
      padding: EdgeInsets.zero,
      sliver: SliverGrid(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 7,
          childAspectRatio: 0.65, // Taller cells for event chips
        ),
        delegate: SliverChildBuilderDelegate(
          (context, index) {
            final day = index - firstWeekday + 1;
            final isCurrentMonth = day > 0 && day <= daysInMonth;

            Attendance? event;
            if (isCurrentMonth) {
              event = state.attendanceMap[day];
            }

            return Material(
              color: isCurrentMonth
                  ? context.surfaceColor
                  : context.backgroundColor,
              child: InkWell(
                onTap: event != null
                    ? () => context.push('/attendance/detail', extra: event)
                    : null,
                child: Container(
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: context.borderColor,
                      width: 0.5.w,
                    ),
                  ),
                  child: Column(
                    children: [
                      SizedBox(height: 8.h),
                      Text(
                        isCurrentMonth ? '$day' : '',
                        style: TextStyle(
                          fontSize: 14.sp,
                          color: context.textPrimary,
                        ),
                      ),
                      const Spacer(),
                      if (event != null)
                        Container(
                          width: double.infinity,
                          margin: EdgeInsets.symmetric(
                            horizontal: 2.w,
                            vertical: 4.h,
                          ),
                          padding: EdgeInsets.symmetric(vertical: 2.h),
                          decoration: BoxDecoration(
                            color: _getStatusColor(event.status),
                            borderRadius: BorderRadius.circular(2.r),
                          ),
                          child: Text(
                            _getStatusText(context, event.status),
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 8.sp,
                              fontWeight: FontWeight.bold,
                            ),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                    ],
                  ),
                ),
              ),
            );
          },
          childCount: totalCells,
        ),
      ),
    );
  }
}
