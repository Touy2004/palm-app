import 'package:palm_app/package.dart';

class ProfileActionButtons extends ConsumerWidget {
  const ProfileActionButtons({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        // Change password Button
        ElevatedButton.icon(
          onPressed: () {
            context.push('/profile/change-password');
          },
          icon: Icon(
            Icons.lock_reset,
            color: context.primaryColor,
          ),
          label: Text(
            AppLocalizations.of(context)!.changePassword,
          ),
          style: ElevatedButton.styleFrom(
            textStyle: TextStyle(
              fontSize: 16.sp,
              fontWeight: FontWeight.bold,
              letterSpacing: 0.5,
            ),
            padding: EdgeInsets.symmetric(vertical: 16.h),
            foregroundColor: context.primaryColor,
            backgroundColor: context.primaryColor.withValues(alpha: 0.1),
            elevation: 0,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16.r),
            ),
          ),
        ),
        SizedBox(height: 16.h),

        // Sign out Button
        ElevatedButton.icon(
          onPressed: () {
            ref.read(authServiceProvider.notifier).logout();
          },
          icon: Icon(Icons.logout, color: context.errorColor),
          label: Text(
            AppLocalizations.of(context)!.signOut,
          ),
          style: ElevatedButton.styleFrom(
            textStyle: TextStyle(
              fontSize: 16.sp,
              fontWeight: FontWeight.bold,
              letterSpacing: 0.5,
            ),
            padding: EdgeInsets.symmetric(vertical: 16.h),
            foregroundColor: context.errorColor,
            backgroundColor: context.errorColor.withValues(alpha: 0.1),
            elevation: 0,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16.r),
            ),
          ),
        ),
      ],
    );
  }
}
