import 'package:palm_app/package.dart';

class PalmSkeleton extends StatelessWidget {
  const PalmSkeleton({super.key});

  @override
  Widget build(BuildContext context) {
    return SkeletonLoader(
      child: ListView.builder(
        padding: EdgeInsets.all(20.w),
        itemCount: 2,
        itemBuilder: (context, index) {
          return Container(
            margin: EdgeInsets.only(bottom: 16.h),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(20.r),
            ),
            padding: EdgeInsets.all(24.w),
            child: Row(
              children: [
                SkeletonCircle(radius: 32.r),
                SizedBox(width: 20.w),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SkeletonText(width: 100.w, height: 20.h),
                      SizedBox(height: 8.h),
                      SkeletonText(width: 150.w, height: 14.h),
                      SizedBox(height: 4.h),
                      SkeletonText(width: 120.w, height: 14.h),
                    ],
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
