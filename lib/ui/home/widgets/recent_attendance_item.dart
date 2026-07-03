import 'package:palm_app/package.dart';
import '../models/attendance_ui_model.dart';

class RecentAttendanceItem extends StatelessWidget {
  final AttendanceUiModel uiModel;

  const RecentAttendanceItem({super.key, required this.uiModel});

  @override
  Widget build(BuildContext context) {
    final statusColor = uiModel.isPresent ? context.presentColor : context.lateColor;
    final l10n = AppLocalizations.of(context)!;
    String translatedStatus = uiModel.status;
    final statusLower = uiModel.status.toLowerCase();
    if (statusLower == 'present') translatedStatus = l10n.statusPresent;
    else if (statusLower == 'late') translatedStatus = l10n.statusLate;
    else if (statusLower == 'absent') translatedStatus = l10n.statusAbsent;
    else if (statusLower == 'leave') translatedStatus = l10n.statusLeave;
    else if (statusLower == 'holiday') translatedStatus = l10n.statusHoliday;

    return Container(
      margin: EdgeInsets.only(bottom: 12.h),
      decoration: BoxDecoration(
        color: context.surfaceColor,
        borderRadius: BorderRadius.circular(16.r),
        border: Border.all(color: context.borderColor),
      ),
      padding: EdgeInsets.symmetric(vertical: 16.h, horizontal: 20.w),
      child: Row(
        children: [
          // Date Column
          Column(
            children: [
              Text(
                uiModel.dayStr,
                style: TextStyle(
                  color: context.primaryColor,
                  fontSize: 24.sp,
                  fontWeight: FontWeight.bold,
                  height: 1.0,
                ),
              ),
              Text(
                uiModel.monthStr,
                style: TextStyle(
                  color: context.primaryColor,
                  fontSize: 12.sp,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
          SizedBox(width: 16.w),
          // Vertical Divider
          Container(
            width: 1.w,
            height: 40.h,
            color: context.borderColor,
          ),
          SizedBox(width: 16.w),
          // Details Column
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '${uiModel.checkInTimeStr} → ${uiModel.checkOutTimeStr}',
                  style: TextStyle(
                    color: context.textSecondary,
                    fontSize: 12.sp,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                SizedBox(height: 4.h),
                Text(
                  uiModel.durationStr.contains(l10n.worked) ? uiModel.durationStr : '${uiModel.durationStr} ${l10n.worked}',
                  style: TextStyle(
                    color: context.textPrimary,
                    fontSize: 16.sp,
                  ),
                ),
              ],
            ),
          ),
          // Status Chip
          Container(
            padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 6.h),
            decoration: BoxDecoration(
              color: statusColor,
              borderRadius: BorderRadius.circular(16.r),
            ),
            child: Text(
              translatedStatus,
              style: TextStyle(
                color: context.textInverse,
                fontSize: 12.sp,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
