import 'package:palm_app/package.dart';

class HomeSkeleton extends StatelessWidget {
  const HomeSkeleton({super.key});

  @override
  Widget build(BuildContext context) {
    return SkeletonLoader(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
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
          ...List.generate(3, (index) => Padding(
            padding: EdgeInsets.only(bottom: 12.h),
            child: SkeletonBox(width: double.infinity, height: 80.h, borderRadius: 16.r),
          )),
        ],
      ),
    );
  }
}
