
import 'package:palm_app/package.dart';
import '../../attendance/views/attendance_view.dart';
import '../../home/view_models/home_view_model.dart';
import '../../home/views/home_view.dart';
import '../../palm/views/palm_view.dart';
import '../../profile/views/profile_view.dart';
import '../widgets/custom_bottom_nav_bar.dart';
import '../../attendance/view_models/attendance_view_model.dart';
import '../../palm/view_models/palm_view_model.dart';

class MainView extends ConsumerStatefulWidget {
  const MainView({super.key});

  @override
  ConsumerState<MainView> createState() => _MainViewState();
}

class _MainViewState extends ConsumerState<MainView> {
  int _currentIndex = 0;

  final List<Widget> _views = const [
    HomeView(),
    AttendanceView(),
    PalmView(),
    ProfileView(),
  ];

  void _onTabTapped(int index) {
    if (_currentIndex != index) {
      switch (index) {
        case 0:
          ref.read(homeViewModelProvider.notifier).refresh();
          break;
        case 1:
          ref.read(attendanceViewModelProvider.notifier).refresh();
          break;
        case 2:
          ref.read(palmViewModelProvider.notifier).refresh();
          break;
        case 3:
          break;
      }
    }

    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: _currentIndex,
        children: _views,
      ),
      floatingActionButton: ref.watch(authServiceProvider).user?.role.toLowerCase() == 'admin' 
          ? FloatingActionButton(
              heroTag:
                  null, // Disables default Hero animation to prevent tag conflicts
              onPressed: () => context.push('/pairing/scan'),
              backgroundColor: context.primaryColor,
              child: const Icon(Icons.back_hand, color: Colors.white),
            )
          : null,
      bottomNavigationBar: CustomBottomNavBar(
        currentIndex: _currentIndex,
        onTap: _onTabTapped,
      ),
    );
  }
}
