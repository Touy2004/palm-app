import 'package:palm_app/package.dart';

class AttendanceSkeleton extends StatelessWidget {
  const AttendanceSkeleton({super.key});

  @override
  Widget build(BuildContext context) {
    return SkeletonLoader(
      child: Column(
        children: [
          Container(
            height: 50.h,
            padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SkeletonText(width: 120.w, height: 24.h),
                Row(
                  children: [
                    SkeletonCircle(radius: 12.r),
                    SizedBox(width: 16.w),
                    SkeletonCircle(radius: 12.r),
                  ],
                ),
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.symmetric(vertical: 8.h),
            child: Row(
              children: List.generate(
                7,
                (index) => Expanded(
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 8.w),
                    child: SkeletonText(width: double.infinity, height: 16.h),
                  ),
                ),
              ),
            ),
          ),
          Expanded(
            child: GridView.builder(
              physics: const NeverScrollableScrollPhysics(),
              padding: EdgeInsets.zero,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 7,
                childAspectRatio: 0.65,
              ),
              itemCount: 42,
              itemBuilder: (context, index) {
                return Container(
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey[200]!, width: 0.5.w),
                  ),
                  child: Column(
                    children: [
                      SizedBox(height: 8.h),
                      SkeletonText(width: 20.w, height: 14.h),
                      const Spacer(),
                      Container(
                        margin: EdgeInsets.all(4.w),
                        child: SkeletonBox(
                            width: double.infinity,
                            height: 16.h,
                            borderRadius: 2.r),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
