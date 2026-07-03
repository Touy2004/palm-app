import 'package:palm_app/package.dart';
import '../view_models/profile_view_model.dart';
import '../widgets/profile_header_card.dart';
import '../widgets/profile_info_card.dart';
import '../widgets/profile_preferences_card.dart';
import '../widgets/profile_security_card.dart';
import '../widgets/profile_action_buttons.dart';

class ProfileView extends ConsumerWidget {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final uiModel = ref.watch(profileViewModelProvider);

    if (uiModel == null) {
      return Scaffold(
        backgroundColor: context.backgroundColor,
        appBar: AppBar(
          title: Text(AppLocalizations.of(context)!.profile, style: TextStyle(color: context.primaryColor, fontWeight: FontWeight.bold)),
          backgroundColor: context.backgroundColor,
          elevation: 0,
        ),
        body: const Center(
          child: CircularProgressIndicator(),
        ),
      );
    }

    return Scaffold(
      backgroundColor: context.backgroundColor,
      appBar: AppBar(
        title: Text(AppLocalizations.of(context)!.profile, style: TextStyle(color: context.primaryColor, fontWeight: FontWeight.bold)),
        backgroundColor: context.backgroundColor,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 16.h),
          child: Column(
            children: [
              ProfileHeaderCard(uiModel: uiModel),
              SizedBox(height: 32.h),
              ProfileInfoCard(uiModel: uiModel),
              SizedBox(height: 32.h),
              const ProfilePreferencesCard(),
              SizedBox(height: 32.h),
              ProfileSecurityCard(uiModel: uiModel),
              SizedBox(height: 40.h),
              const ProfileActionButtons(),
              SizedBox(height: 40.h),
            ],
          ),
        ),
      ),
    );
  }
}
