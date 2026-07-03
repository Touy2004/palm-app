import 'dart:async';
import 'package:palm_app/package.dart';

// Provider to fetch device info given a session token
final pairingDeviceInfoProvider = FutureProvider.autoDispose
    .family<DeviceSession, String>((ref, sessionToken) {
      final repo = ref.read(pairingRepositoryProvider);
      return repo.scanSession(sessionToken);
    });

class PairingApprovalState {
  final String? selectedHand;
  final String employeeCode;
  final bool isLoading;
  final int remainingSeconds;
  final String? error;
  final bool isTimeout;

  PairingApprovalState({
    this.selectedHand,
    this.employeeCode = '',
    this.isLoading = false,
    this.remainingSeconds = 5 * 60,
    this.error,
    this.isTimeout = false,
  });

  String get formattedTime {
    final minutes = remainingSeconds ~/ 60;
    final seconds = remainingSeconds % 60;
    return '$minutes:${seconds.toString().padLeft(2, '0')}';
  }

  PairingApprovalState copyWith({
    String? selectedHand,
    String? employeeCode,
    bool? isLoading,
    int? remainingSeconds,
    String? error,
    bool? isTimeout,
  }) {
    return PairingApprovalState(
      selectedHand: selectedHand ?? this.selectedHand,
      employeeCode: employeeCode ?? this.employeeCode,
      isLoading: isLoading ?? this.isLoading,
      remainingSeconds: remainingSeconds ?? this.remainingSeconds,
      error: error,
      isTimeout: isTimeout ?? this.isTimeout,
    );
  }
}

class PairingApprovalViewModel extends AsyncNotifier<PairingApprovalState> {
  Timer? _timer;

  @override
  FutureOr<PairingApprovalState> build() {
    _startTimer();
    
    ref.onDispose(() {
      _timer?.cancel();
    });
    
    return PairingApprovalState();
  }

  void _startTimer() {
    _timer?.cancel();
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      final currentState = state.value;
      if (currentState == null) return;
      
      if (currentState.remainingSeconds > 0) {
        state = AsyncData(currentState.copyWith(remainingSeconds: currentState.remainingSeconds - 1));
      } else {
        timer.cancel();
        state = AsyncData(currentState.copyWith(isTimeout: true));
      }
    });
  }

  void selectHand(String hand) {
    if (state.value != null) {
      state = AsyncData(state.value!.copyWith(selectedHand: hand));
    }
  }

  void setEmployeeCode(String code) {
    if (state.value != null) {
      state = AsyncData(state.value!.copyWith(employeeCode: code));
    }
  }

  Future<bool> approve(String sessionToken) async {
    final currentState = state.value;
    if (currentState == null || currentState.selectedHand == null) return false;
    
    state = AsyncData(currentState.copyWith(isLoading: true, error: null));
    try {
      await ref
          .read(pairingRepositoryProvider)
          .approveSession(sessionToken, currentState.selectedHand!, currentState.employeeCode);
      state = AsyncData(state.value!.copyWith(isLoading: false));
      return true;
    } catch (e) {
      state = AsyncData(state.value!.copyWith(
        isLoading: false, 
        error: ApiErrorParser.parse(e)
      ));
      return false;
    }
  }
}

final pairingApprovalViewModelProvider = AsyncNotifierProvider<PairingApprovalViewModel, PairingApprovalState>(() {
  return PairingApprovalViewModel();
});
