

import 'package:palm_app/package.dart';
class CustomBottomNavBar extends StatelessWidget {
  final int currentIndex;
  final Function(int) onTap;

  const CustomBottomNavBar({
    super.key,
    required this.currentIndex,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: context.surfaceColor,
        border: Border(
          top: BorderSide(
            color: context.borderColor,
            width: 1.0.w,
          ),
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.05),
            blurRadius: 10.r,
            offset: Offset(0, -2.h),
          ),
        ],
      ),
      padding: EdgeInsets.only(
        bottom: MediaQuery.of(
          context,
        ).padding.bottom, // Handle safe area on iOS
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          _buildNavItem(
            context: context,
            currentIndex: currentIndex,
            index: 0,
            icon: Icons.home_outlined,
            label: AppLocalizations.of(context)!.home,
          ),
          _buildNavItem(
            context: context,
            currentIndex: currentIndex,
            index: 1,
            icon: Icons.calendar_today_outlined,
            label: AppLocalizations.of(context)!.attendance,
          ),
          _buildNavItem(
            context: context,
            currentIndex: currentIndex,
            index: 2,
            icon: Icons.back_hand_outlined,
            label: AppLocalizations.of(context)!.myPalm,
          ),
          _buildNavItem(
            context: context,
            currentIndex: currentIndex,
            index: 3,
            icon: Icons.person_outline,
            label: AppLocalizations.of(context)!.profile,
          ),
        ],
      ),
    );
  }

  Widget _buildNavItem({
    required BuildContext context,
    required int index,
    required int currentIndex,
    required IconData icon,
    required String label,
  }) {
    final isSelected = currentIndex == index;
    final color = isSelected ? context.primaryColor : context.textSecondary;

    return Expanded(
      child: GestureDetector(
        behavior: HitTestBehavior.opaque,
        onTap: () => onTap(index),
        child: Container(
          padding: EdgeInsets.symmetric(vertical: 8.h),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(
                icon,
                color: color,
                size: 24.w,
              ),
              SizedBox(height: 4.h),
              Text(
                label,
                style: TextStyle(
                  color: color,
                  fontSize: 10.sp,
                  fontWeight: isSelected ? FontWeight.w600 : FontWeight.w500,
                ),
              ),
              SizedBox(height: 4.h),
              Container(
                width: 4.w,
                height: 4.w,
                decoration: BoxDecoration(
                  color: isSelected ? context.primaryColor : Colors.transparent,
                  shape: BoxShape.circle,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
