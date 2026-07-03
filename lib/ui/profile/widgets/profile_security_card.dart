import 'package:palm_app/package.dart';
import '../models/profile_ui_model.dart';
import 'profile_info_tile.dart';

class ProfileSecurityCard extends StatelessWidget {
  final ProfileUiModel uiModel;

  const ProfileSecurityCard({super.key, required this.uiModel});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 8.h),
          child: Text(
            AppLocalizations.of(context)!.security,
            style: TextStyle(
              color: context.textSecondary,
              fontSize: 13.sp,
              letterSpacing: 1.5,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        Container(
          decoration: BoxDecoration(
            color: context.surfaceColor,
            borderRadius: BorderRadius.circular(20.r),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withValues(alpha: 0.03),
                blurRadius: 10.r,
                offset: Offset(0, 4.h),
              ),
            ],
          ),
          child: Column(
            children: [
              ProfileInfoTile(
                icon: Icons.pan_tool_outlined,
                label: AppLocalizations.of(context)!.palmStatus,
                value: uiModel.palmStatus,
                valueColor: context.primaryColor,
              ),
              ProfileInfoTile(
                icon: Icons.lock_outline,
                label: AppLocalizations.of(context)!.accountStatus,
                value: uiModel.accountStatus,
                valueColor: context.primaryColor,
                showDivider: false,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
