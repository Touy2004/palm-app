
import 'package:palm_app/package.dart';
import '../models/attendance_ui_model.dart';

class StatusCard extends StatelessWidget {
  final AttendanceUiModel? todayAttendance;
  final String dateStr;

  const StatusCard({super.key, this.todayAttendance, required this.dateStr});

  @override
  Widget build(BuildContext context) {
    final status = todayAttendance?.status.toUpperCase() ?? AppLocalizations.of(context)!.statusAbsent.toUpperCase();
    final isPresent = todayAttendance?.isPresent ?? false;
    
    final checkInStr = todayAttendance?.checkInTimeStr ?? '- : -';
    final checkOutStr = todayAttendance?.checkOutTimeStr ?? '- : -';
    final durationStr = todayAttendance?.durationStr ?? '-';

    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: context.surfaceColor,
        borderRadius: BorderRadius.circular(24.r),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.05),
            blurRadius: 10.r,
            offset: Offset(0, 4.h),
          ),
        ],
      ),
      padding: EdgeInsets.all(24.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Text(
                AppLocalizations.of(context)!.today,
                style: TextStyle(
                  color: context.textSecondary,
                  letterSpacing: 1.5,
                  fontWeight: FontWeight.w500,
                  fontSize: 14.sp,
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 8.w),
                child: Text(
                  '|',
                  style: TextStyle(
                    color: context.textPrimary,
                    fontSize: 18.sp,
                  ),
                ),
              ),
              Text(
                dateStr,
                style: TextStyle(
                  color: context.textSecondary,
                  letterSpacing: 1.5,
                  fontWeight: FontWeight.w500,
                  fontSize: 14.sp,
                ),
              ),
            ],
          ),
          SizedBox(height: 12.h),
          Text(
            status,
            style: TextStyle(
              color: isPresent ? context.primaryColor : context.errorColor,
              fontSize: 48.sp,
              fontWeight: FontWeight.bold,
              height: 1.0,
            ),
          ),
          SizedBox(height: 24.h),
          Row(
            children: [
              Expanded(
                child: _buildTimeBox(context, AppLocalizations.of(context)!.checkIn, checkInStr),
              ),
              SizedBox(width: 12.w),
              Expanded(
                child: _buildTimeBox(context, AppLocalizations.of(context)!.checkOut, checkOutStr),
              ),
              SizedBox(width: 12.w),
              Expanded(
                child: _buildDurationBox(context, AppLocalizations.of(context)!.duration, durationStr),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildDurationBox(BuildContext context, String label, String fallbackValue) {
    final checkIn = todayAttendance?.rawCheckInTime;
    final checkOut = todayAttendance?.rawCheckOutTime;

    if (checkIn != null && checkOut == null) {
      // User is checked in but not checked out, so tick in real time
      return StreamBuilder<DateTime>(
        stream: Stream.periodic(const Duration(seconds: 1), (_) => DateTime.now()),
        builder: (context, snapshot) {
          final now = DateTime.now();
          final duration = now.difference(checkIn);
          final hours = duration.inHours;
          final minutes = duration.inMinutes.remainder(60);
          final seconds = duration.inSeconds.remainder(60);
          final value = '${hours}h ${minutes.toString().padLeft(2, '0')}m ${seconds.toString().padLeft(2, '0')}s';
          
          return _buildTimeBox(context, label, value);
        },
      );
    }
    
    return _buildTimeBox(context, label, fallbackValue);
  }

  Widget _buildTimeBox(BuildContext context, String label, String value) {
    return Container(
      decoration: BoxDecoration(
        color: context.primaryColor,
        borderRadius: BorderRadius.circular(8.r),
      ),
      padding: EdgeInsets.symmetric(vertical: 16.h, horizontal: 12.w),
      child: Column(
        children: [
          Text(
            label,
            style: TextStyle(
              color: context.textInverse,
              fontSize: 10.sp,
              fontWeight: FontWeight.w600,
              letterSpacing: 0.5,
            ),
          ),
          SizedBox(height: 4.h),
          Text(
            value,
            style: TextStyle(
              color: context.textInverse,
              fontSize: 14.sp,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}
