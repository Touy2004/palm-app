import 'package:palm_app/package.dart';
import '../view_models/attendance_view_model.dart';
import '../widgets/attendance_calendar_header.dart';
import '../widgets/attendance_calendar_grid.dart';
import '../widgets/attendance_skeleton.dart';

class AttendanceView extends ConsumerWidget {
  const AttendanceView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final stateAsync = ref.watch(attendanceViewModelProvider);

    return SafeArea(
      child: Scaffold(
        backgroundColor: context.backgroundColor,
        body: stateAsync.when(
          loading: () => const AttendanceSkeleton(),
          error: (error, st) => Center(
            child: Padding(
              padding: EdgeInsets.all(24.w),
              child: Text(
                ApiErrorParser.parse(error), 
                style: TextStyle(color: context.errorColor, fontSize: 16.sp), 
                textAlign: TextAlign.center,
              ),
            ),
          ),
          data: (state) {
            final firstDayOfMonth = DateTime(
              state.focusedMonth.year,
              state.focusedMonth.month,
              1,
            );
            final daysInMonth = DateTime(
              state.focusedMonth.year,
              state.focusedMonth.month + 1,
              0,
            ).day;
      
            // In Dart, weekday is 1=Mon, 7=Sun. We want 0=Sun.
            int firstWeekday = firstDayOfMonth.weekday;
            if (firstWeekday == 7) firstWeekday = 0;
      
            return RefreshIndicator(
              onRefresh: () => ref.read(attendanceViewModelProvider.notifier).refresh(),
              child: CustomScrollView(
                physics: const AlwaysScrollableScrollPhysics(),
                slivers: [
                  SliverToBoxAdapter(
                    child: AttendanceCalendarHeader(focusedMonth: state.focusedMonth),
                  ),
                  AttendanceCalendarGrid(
                    state: state,
                    firstWeekday: firstWeekday,
                    daysInMonth: daysInMonth,
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
