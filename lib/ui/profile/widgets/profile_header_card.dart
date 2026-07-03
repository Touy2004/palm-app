import 'package:palm_app/package.dart';
import '../models/profile_ui_model.dart';

class ProfileHeaderCard extends StatelessWidget {
  final ProfileUiModel uiModel;

  const ProfileHeaderCard({super.key, required this.uiModel});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          colors: [Color(0xFF2879C0), Color(0xFF1A5A96)],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(24.r),
        boxShadow: [
          BoxShadow(
            color: const Color(0xFF2879C0).withValues(alpha: 0.3),
            blurRadius: 16.r,
            offset: Offset(0, 8.h),
          ),
        ],
      ),
      padding: EdgeInsets.symmetric(
        vertical: 40.h,
        horizontal: 16.w,
      ),
      child: Column(
        children: [
          Container(
            width: 100.w,
            height: 100.w,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.white.withValues(alpha: 0.15),
              border: Border.all(
                color: Colors.white.withValues(alpha: 0.3),
                width: 2.w,
              ),
            ),
            child: Center(
              child: Text(
                uiModel.initials,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 36.sp,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 1.0,
                ),
              ),
            ),
          ),
          SizedBox(height: 20.h),
          Text(
            uiModel.fullName,
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.white,
              fontSize: 24.sp,
              fontWeight: FontWeight.bold,
              letterSpacing: 0.5,
            ),
          ),
          SizedBox(height: 8.h),
          Container(
            padding: EdgeInsets.symmetric(
              horizontal: 16.w,
              vertical: 6.h,
            ),
            decoration: BoxDecoration(
              color: Colors.white.withValues(alpha: 0.2),
              borderRadius: BorderRadius.circular(20.r),
            ),
            child: Text(
              uiModel.employeeCode,
              style: TextStyle(
                color: Colors.white,
                fontSize: 14.sp,
                fontWeight: FontWeight.w600,
                letterSpacing: 0.5,
              ),
            ),
          ),
          SizedBox(height: 12.h),
          Text(
            uiModel.subtitle,
            style: TextStyle(
              color: Colors.white.withValues(alpha: 0.85),
              fontSize: 15.sp,
            ),
          ),
        ],
      ),
    );
  }
}
