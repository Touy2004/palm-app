import 'package:palm_app/package.dart';

class PalmDetailSkeleton extends StatelessWidget {
  const PalmDetailSkeleton({super.key});

  @override
  Widget build(BuildContext context) {
    return SkeletonLoader(
      child: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            SkeletonBox(width: double.infinity, height: 280, borderRadius: 24),
            const SizedBox(height: 16),
            SkeletonBox(width: double.infinity, height: 56, borderRadius: 16),
            const SizedBox(height: 12),
            SkeletonBox(width: double.infinity, height: 56, borderRadius: 16),
            const SizedBox(height: 12),
            SkeletonBox(width: double.infinity, height: 56, borderRadius: 16),
            const SizedBox(height: 12),
            SkeletonBox(width: double.infinity, height: 56, borderRadius: 16),
            const SizedBox(height: 24),
            SkeletonBox(width: double.infinity, height: 56, borderRadius: 12),
            const SizedBox(height: 12),
            SkeletonBox(width: double.infinity, height: 56, borderRadius: 12),
          ],
        ),
      ),
    );
  }
}
