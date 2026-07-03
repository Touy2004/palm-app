
import 'package:palm_app/package.dart';
import '../ui/auth/views/login_view.dart';
import '../ui/main/views/main_view.dart';
import '../ui/pairing/views/qr_scanner_view.dart';
import '../ui/pairing/views/pairing_approval_view.dart';
import '../ui/palm/views/palm_detail_view.dart';
import '../ui/attendance/views/attendance_detail_view.dart';
import '../ui/profile/views/change_password_view.dart';

final GlobalKey<NavigatorState> _rootNavigatorKey = GlobalKey<NavigatorState>(debugLabel: 'root');

final routerProvider = Provider<GoRouter>((ref) {
  final authState = ref.watch(authServiceProvider);

  return GoRouter(
    navigatorKey: _rootNavigatorKey,
    initialLocation: '/',
    redirect: (BuildContext context, GoRouterState state) {
      final isLoading = authState.isLoading;
      final isAuth = authState.user != null;
      
      final isLoggingIn = state.matchedLocation == '/login';

      if (isLoading) {
        return null;
      }

      if (!isAuth && !isLoggingIn) {
        return '/login';
      }

      if (isAuth && isLoggingIn) {
        return '/';
      }

      // No redirect needed
      return null;
    },
    routes: [
      GoRoute(
        path: '/login',
        builder: (context, state) => const LoginView(),
      ),
      GoRoute(
        path: '/',
        builder: (context, state) {
          if (authState.isLoading && authState.user == null) {
            return const SplashSkeleton();
          }
          return const MainView();
        },
      ),
      GoRoute(
        path: '/pairing/scan',
        builder: (context, state) => const QRScannerView(),
      ),
      GoRoute(
        path: '/pairing/approve',
        builder: (context, state) {
          final token = state.extra as String? ?? '';
          return PairingApprovalView(sessionToken: token);
        },
      ),
      GoRoute(
        path: '/palm/detail',
        builder: (context, state) {
          final palm = state.extra as PalmTemplate;
          return PalmDetailView(palm: palm);
        },
      ),
      GoRoute(
        path: '/attendance/detail',
        builder: (context, state) {
          final attendance = state.extra as Attendance;
          return AttendanceDetailView(attendance: attendance);
        },
      ),
      GoRoute(
        path: '/profile/change-password',
        builder: (context, state) => const ChangePasswordView(),
      ),
    ],
  );
});
