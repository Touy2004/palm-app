import 'package:palm_app/package.dart';
import '../models/profile_ui_model.dart';
import 'profile_info_tile.dart';

class ProfileInfoCard extends StatelessWidget {
  final ProfileUiModel uiModel;

  const ProfileInfoCard({super.key, required this.uiModel});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 8.h),
          child: Text(
            AppLocalizations.of(context)!.accountInfo,
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
                icon: Icons.phone_outlined,
                label: AppLocalizations.of(context)!.phone,
                value: uiModel.phone,
              ),
              ProfileInfoTile(
                icon: Icons.email_outlined,
                label: AppLocalizations.of(context)!.email,
                value: uiModel.email,
              ),
              ProfileInfoTile(
                icon: Icons.business_outlined,
                label: AppLocalizations.of(context)!.department,
                value: uiModel.department,
                showDivider: false,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
