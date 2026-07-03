import 'package:palm_app/package.dart';
import '../models/attendance_ui_model.dart';

class HomeState {
  final List<AttendanceUiModel> recentAttendances;
  final AttendanceUiModel? todayAttendance;
  final String todayDateStr;
  final int presentThisMonth;
  final int lateThisMonth;

  HomeState({
    this.recentAttendances = const [],
    this.todayAttendance,
    this.todayDateStr = '',
    this.presentThisMonth = 0,
    this.lateThisMonth = 0,
  });
}

class HomeViewModel extends AsyncNotifier<HomeState> {
  @override
  Future<HomeState> build() async {
    ref.watch(authServiceProvider.select((s) => s.user?.id));
    return _fetchData();
  }

  Future<HomeState> _fetchData() async {
    final userRepo = ref.watch(userRepositoryProvider);
    
    final now = DateTime.now();
    final firstDayOfMonth = DateTime(now.year, now.month, 1);
    final lastDayOfMonth = DateTime(now.year, now.month + 1, 0);

    final attendances = await userRepo.getMyAttendance(
      startDate: firstDayOfMonth,
      endDate: lastDayOfMonth,
      limit: 100, 
    );

    Attendance? rawTodayAttendance;
    int presentCount = 0;
    int lateCount = 0;

    for (var att in attendances) {
      if (att.attendanceDate.year == now.year &&
          att.attendanceDate.month == now.month &&
          att.attendanceDate.day == now.day) {
        rawTodayAttendance = att;
      }

      if (att.status.toLowerCase() == 'present') {
        presentCount++;
      } else if (att.status.toLowerCase() == 'late') {
        lateCount++;
      }
    }

    attendances.sort((a, b) => b.attendanceDate.compareTo(a.attendanceDate));

    final todayDateStr = DateFormat('EEE dd MMM').format(now).toUpperCase();
    
    // Map raw models to UI models
    final recentUiModels = attendances.take(3).map((att) => _mapToUiModel(att)).toList();
    final todayUiModel = rawTodayAttendance != null ? _mapToUiModel(rawTodayAttendance) : null;

    return HomeState(
      recentAttendances: recentUiModels,
      todayAttendance: todayUiModel,
      todayDateStr: todayDateStr,
      presentThisMonth: presentCount,
      lateThisMonth: lateCount,
    );
  }

  AttendanceUiModel _mapToUiModel(Attendance attendance) {
    final dayStr = DateFormat('dd').format(attendance.attendanceDate);
    final monthStr = DateFormat('MMM').format(attendance.attendanceDate).toUpperCase();
    
    final checkInStr = attendance.checkInTime != null
        ? DateFormat('HH:mm').format(attendance.checkInTime!)
        : '--:--';
    final checkOutStr = attendance.checkOutTime != null
        ? DateFormat('HH:mm').format(attendance.checkOutTime!)
        : '--:--';

    String durationStr = '-';
    if (attendance.checkInTime != null && attendance.checkOutTime != null) {
      final duration = attendance.checkOutTime!.difference(attendance.checkInTime!);
      final hours = duration.inHours;
      final minutes = duration.inMinutes.remainder(60);
      durationStr = '${hours}h ${minutes.toString().padLeft(2, '0')}m';
    } else if (attendance.checkInTime != null && attendance.checkOutTime == null) {
       // If checked in but not checked out today
       final duration = DateTime.now().difference(attendance.checkInTime!);
       final hours = duration.inHours;
       final minutes = duration.inMinutes.remainder(60);
       durationStr = '${hours}h ${minutes.toString().padLeft(2, '0')}m';
    } else {
      durationStr = 'Incomplete';
    }

    final isPresent = attendance.status.toLowerCase() == 'present';
    final status = attendance.status.isNotEmpty 
        ? '${attendance.status[0].toUpperCase()}${attendance.status.substring(1)}'
        : 'Unknown';

    return AttendanceUiModel(
      status: status,
      isPresent: isPresent,
      checkInTimeStr: checkInStr,
      checkOutTimeStr: checkOutStr,
      durationStr: durationStr,
      dayStr: dayStr,
      monthStr: monthStr,
      rawCheckInTime: attendance.checkInTime,
      rawCheckOutTime: attendance.checkOutTime,
    );
  }

  Future<void> refresh() async {
    state = const AsyncValue.loading();
    try {
      final newState = await _fetchData();
      state = AsyncValue.data(newState);
    } catch (e, st) {
      state = AsyncValue.error(e, st);
    }
  }
}

final homeViewModelProvider = AsyncNotifierProvider<HomeViewModel, HomeState>(() {
  return HomeViewModel();
});
