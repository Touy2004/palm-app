import 'package:palm_app/package.dart';

class AttendanceState {
  final DateTime focusedMonth;
  final Map<int, Attendance> attendanceMap;

  AttendanceState({
    required this.focusedMonth,
    this.attendanceMap = const {},
  });

  AttendanceState copyWith({
    DateTime? focusedMonth,
    Map<int, Attendance>? attendanceMap,
  }) {
    return AttendanceState(
      focusedMonth: focusedMonth ?? this.focusedMonth,
      attendanceMap: attendanceMap ?? this.attendanceMap,
    );
  }
}

class AttendanceViewModel extends AsyncNotifier<AttendanceState> {
  @override
  Future<AttendanceState> build() async {
    ref.watch(authServiceProvider.select((s) => s.user?.id));
    final now = DateTime.now();
    final focusedMonth = DateTime(now.year, now.month);

    final map = await _fetchDataForMonth(focusedMonth);

    return AttendanceState(
      focusedMonth: focusedMonth,
      attendanceMap: map,
    );
  }

  Future<Map<int, Attendance>> _fetchDataForMonth(DateTime month) async {
    final userRepo = ref.watch(userRepositoryProvider);

    final firstDay = DateTime(month.year, month.month, 1);
    final lastDay = DateTime(month.year, month.month + 1, 0);

    final attendances = await userRepo.getMyAttendance(
      startDate: firstDay,
      endDate: lastDay,
      limit: 100,
    );

    final Map<int, Attendance> map = {};
    for (var att in attendances) {
      if (att.attendanceDate.year == month.year &&
          att.attendanceDate.month == month.month) {
        map[att.attendanceDate.day] = att;
      }
    }
    return map;
  }

  Future<void> changeMonth(int monthsToAdd) async {
    final currentMonth = state.value?.focusedMonth ?? DateTime.now();
    final newMonth = DateTime(
      currentMonth.year,
      currentMonth.month + monthsToAdd,
      1,
    );

    state = const AsyncValue.loading();
    try {
      final map = await _fetchDataForMonth(newMonth);
      state = AsyncValue.data(
        AttendanceState(
          focusedMonth: newMonth,
          attendanceMap: map,
        ),
      );
    } catch (e, st) {
      state = AsyncValue.error(e, st);
    }
  }

  Future<void> refresh() async {
    final currentMonth = state.value?.focusedMonth ?? DateTime.now();

    state = const AsyncValue.loading();
    try {
      final map = await _fetchDataForMonth(currentMonth);
      state = AsyncValue.data(
        AttendanceState(
          focusedMonth: currentMonth,
          attendanceMap: map,
        ),
      );
    } catch (e, st) {
      state = AsyncValue.error(e, st);
    }
  }
}

final attendanceViewModelProvider =
    AsyncNotifierProvider<AttendanceViewModel, AttendanceState>(() {
      return AttendanceViewModel();
    });
