import 'package:palm_app/package.dart';

class AttendanceDetailView extends StatelessWidget {
  final Attendance attendance;

  const AttendanceDetailView({super.key, required this.attendance});

  String _formatTime(DateTime? time) {
    if (time == null) return '--:--';
    return DateFormat('HH:mm a').format(time);
  }

  String _formatDate(DateTime date) {
    return DateFormat('EEEE, MMMM d, yyyy').format(date);
  }

  String _calculateDuration(DateTime? checkIn, DateTime? checkOut) {
    if (checkIn == null || checkOut == null) return '--';
    final difference = checkOut.difference(checkIn);
    final hours = difference.inHours;
    final minutes = difference.inMinutes.remainder(60);
    if (hours > 0) {
      return '$hours hr $minutes min';
    }
    return '$minutes min';
  }

  Color _getStatusColor(String status) {
    final lower = status.toLowerCase();
    if (lower == 'present') return const Color(0xFF4CB385);
    if (lower == 'late') return const Color(0xFFE66C00);
    if (lower == 'absent') return const Color(0xFFED4D4D);
    return const Color(0xFF5584F0);
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
    final l10n = AppLocalizations.of(context)!;
    final duration = _calculateDuration(attendance.checkInTime, attendance.checkOutTime);
    final statusColor = _getStatusColor(attendance.status);

    return Scaffold(
      backgroundColor: context.backgroundColor,
      appBar: AppBar(
        backgroundColor: context.backgroundColor,
        elevation: 0,
        iconTheme: IconThemeData(color: context.primaryColor),
        title: Text(
          l10n.attendanceDetails,
          style: TextStyle(color: context.primaryColor, fontWeight: FontWeight.bold, fontSize: 18.sp),
        ),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(24.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // Date Header
            Text(
              _formatDate(attendance.attendanceDate),
              style: TextStyle(
                fontSize: 24.sp,
                fontWeight: FontWeight.bold,
                color: context.textPrimary,
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 32.h),

            // Status Card
            Container(
              padding: EdgeInsets.symmetric(vertical: 24.h, horizontal: 16.w),
              decoration: BoxDecoration(
                color: context.surfaceColor,
                borderRadius: BorderRadius.circular(16.r),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withValues(alpha: 0.05),
                    blurRadius: 10.r,
                    offset: Offset(0, 4.h),
                  ),
                ],
              ),
              child: Column(
                children: [
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
                    decoration: BoxDecoration(
                      color: statusColor.withValues(alpha: 0.1),
                      borderRadius: BorderRadius.circular(20.r),
                      border: Border.all(color: statusColor.withValues(alpha: 0.3)),
                    ),
                    child: Text(
                      _getStatusText(context, attendance.status),
                      style: TextStyle(
                        color: statusColor,
                        fontWeight: FontWeight.bold,
                        fontSize: 16.sp,
                      ),
                    ),
                  ),
                  SizedBox(height: 24.h),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      _buildTimeColumn(context, l10n.checkIn, _formatTime(attendance.checkInTime), Icons.login),
                      Container(width: 1.w, height: 40.h, color: Colors.grey[300]),
                      _buildTimeColumn(context, l10n.checkOut, _formatTime(attendance.checkOutTime), Icons.logout),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(height: 24.h),

            // Details List
            Container(
              decoration: BoxDecoration(
                color: context.surfaceColor,
                borderRadius: BorderRadius.circular(16.r),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withValues(alpha: 0.05),
                    blurRadius: 10.r,
                    offset: Offset(0, 4.h),
                  ),
                ],
              ),
              child: Column(
                children: [
                  _buildDetailRow(context, l10n.duration, duration, Icons.timer_outlined),
                  Divider(height: 1.h, indent: 16.w, endIndent: 16.w),
                  _buildDetailRow(context, l10n.deviceName, attendance.deviceName, Icons.computer),
                  Divider(height: 1.h, indent: 16.w, endIndent: 16.w),
                  _buildDetailRow(context, l10n.deviceCode, attendance.deviceCode ?? 'N/A', Icons.qr_code),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTimeColumn(BuildContext context, String label, String time, IconData icon) {
    return Column(
      children: [
        Icon(icon, color: context.textSecondary, size: 20.sp),
        SizedBox(height: 8.h),
        Text(
          time,
          style: TextStyle(
            fontSize: 20.sp,
            fontWeight: FontWeight.bold,
            color: context.textPrimary,
          ),
        ),
        SizedBox(height: 4.h),
        Text(
          label,
          style: TextStyle(
            fontSize: 14.sp,
            color: context.textSecondary,
          ),
        ),
      ],
    );
  }

  Widget _buildDetailRow(BuildContext context, String label, String value, IconData icon) {
    return Padding(
      padding: EdgeInsets.all(16.w),
      child: Row(
        children: [
          Container(
            padding: EdgeInsets.all(10.w),
            decoration: BoxDecoration(
              color: context.primaryColor.withValues(alpha: 0.1),
              borderRadius: BorderRadius.circular(10.r),
            ),
            child: Icon(icon, color: context.primaryColor, size: 20.sp),
          ),
          SizedBox(width: 16.w),
          Expanded(
            child: Text(
              label,
              style: TextStyle(color: context.textSecondary, fontSize: 14.sp),
            ),
          ),
          Text(
            value,
            style: TextStyle(color: context.textPrimary, fontWeight: FontWeight.bold, fontSize: 14.sp),
          ),
        ],
      ),
    );
  }
}
