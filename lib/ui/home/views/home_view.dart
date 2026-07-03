import 'package:palm_app/package.dart';

import '../view_models/home_view_model.dart';
import '../widgets/home_header.dart';
import '../widgets/home_recent_list.dart';
import '../widgets/home_skeleton.dart';
import '../widgets/home_summary_cards.dart';
import '../widgets/status_card.dart';

class HomeView extends ConsumerWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final authState = ref.watch(authServiceProvider);
    final user = authState.user;
    final homeStateAsync = ref.watch(homeViewModelProvider);

    final hour = DateTime.now().hour;
    final l10n = AppLocalizations.of(context)!;
    final greeting = hour < 12
        ? l10n.goodMorning
        : (hour < 17 ? l10n.goodAfternoon : l10n.goodEvening);

    return Scaffold(
      backgroundColor: context.backgroundColor,
      body: SafeArea(
        child: RefreshIndicator(
          onRefresh: () => ref.read(homeViewModelProvider.notifier).refresh(),
          child: SingleChildScrollView(
            physics: const AlwaysScrollableScrollPhysics(),
            padding: EdgeInsets.all(24.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                HomeHeader(user: user, greeting: greeting),
                SizedBox(height: 24.h),

                homeStateAsync.when(
                  data: (state) {
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        StatusCard(
                          todayAttendance: state.todayAttendance,
                          dateStr: state.todayDateStr,
                        ),
                        SizedBox(height: 16.h),
                        HomeSummaryCards(
                          presentThisMonth: state.presentThisMonth,
                          lateThisMonth: state.lateThisMonth,
                        ),
                        SizedBox(height: 24.h),
                        HomeRecentList(
                          recentAttendances: state.recentAttendances,
                        ),
                        SizedBox(height: 80.h), // Padding for FAB
                      ],
                    );
                  },
                  loading: () => const HomeSkeleton(),
                  error: (error, st) => Center(
                    child: Padding(
                      padding: EdgeInsets.symmetric(vertical: 32.h),
                      child: Text(
                        ApiErrorParser.parse(error),
                        style: TextStyle(
                          color: context.errorColor,
                          fontSize: 16.sp,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
