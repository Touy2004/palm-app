import 'package:palm_app/package.dart';

class PairingApprovalSkeleton extends StatelessWidget {
  const PairingApprovalSkeleton({super.key});

  @override
  Widget build(BuildContext context) {
    return SkeletonLoader(
      child: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            SkeletonBox(width: double.infinity, height: 48, borderRadius: 12),
            const SizedBox(height: 24),
            SkeletonBox(width: double.infinity, height: 100, borderRadius: 20),
            const SizedBox(height: 32),
            SkeletonText(width: 150, height: 16),
            const SizedBox(height: 16),
            Row(
              children: [
                Expanded(child: SkeletonBox(width: double.infinity, height: 120, borderRadius: 20)),
                const SizedBox(width: 16),
                Expanded(child: SkeletonBox(width: double.infinity, height: 120, borderRadius: 20)),
              ],
            ),
            const SizedBox(height: 32),
            SkeletonBox(width: double.infinity, height: 150, borderRadius: 20),
            const SizedBox(height: 40),
            SkeletonBox(width: double.infinity, height: 56, borderRadius: 16),
          ],
        ),
      ),
    );
  }
}
