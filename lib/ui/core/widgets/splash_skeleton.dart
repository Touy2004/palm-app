import 'package:palm_app/package.dart';

class SplashSkeleton extends StatelessWidget {
  const SplashSkeleton({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.backgroundColor,
      body: SafeArea(
        child: SkeletonLoader(
          child: Padding(
            padding: EdgeInsets.all(24.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Header
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SkeletonText(width: 100.w, height: 14.h),
                        SizedBox(height: 8.h),
                        SkeletonText(width: 150.w, height: 24.h),
                      ],
                    ),
                    SkeletonCircle(radius: 20.r),
                  ],
                ),
                SizedBox(height: 32.h),
                // Status Card Skeleton
                SkeletonBox(width: double.infinity, height: 120.h, borderRadius: 20.r),
                SizedBox(height: 16.h),
                // Summary Cards Skeleton
                Row(
                  children: [
                    Expanded(child: SkeletonBox(width: double.infinity, height: 100.h, borderRadius: 20.r)),
                    SizedBox(width: 16.w),
                    Expanded(child: SkeletonBox(width: double.infinity, height: 100.h, borderRadius: 20.r)),
                  ],
                ),
                SizedBox(height: 24.h),
                // Recent Header Skeleton
                SkeletonText(width: 150.w, height: 24.h),
                SizedBox(height: 16.h),
                // Recent Items Skeleton
                SkeletonBox(width: double.infinity, height: 80.h, borderRadius: 16.r),
                SizedBox(height: 12.h),
                SkeletonBox(width: double.infinity, height: 80.h, borderRadius: 16.r),
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: SkeletonLoader(
        child: Container(
          padding: EdgeInsets.only(top: 12.h, bottom: 24.h),
          decoration: BoxDecoration(
            color: context.surfaceColor,
            border: Border(top: BorderSide(color: context.borderColor)),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: List.generate(
              4,
              (index) => Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  SkeletonCircle(radius: 12.r),
                  SizedBox(height: 4.h),
                  SkeletonText(width: 40.w, height: 10.h),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
