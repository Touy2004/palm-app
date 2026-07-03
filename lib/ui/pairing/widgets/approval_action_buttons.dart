import 'package:palm_app/package.dart';

class ApprovalActionButtons extends StatelessWidget {
  final bool isLoading;
  final bool isHandSelected;
  final VoidCallback onApprove;
  final VoidCallback onCancel;

  const ApprovalActionButtons({
    super.key,
    required this.isLoading,
    required this.isHandSelected,
    required this.onApprove,
    required this.onCancel,
  });

  @override
  Widget build(BuildContext context) {
    if (isLoading) {
      return const SkeletonLoader(child: SkeletonBox(width: double.infinity, height: 56, borderRadius: 16));
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        ElevatedButton(
          onPressed: isHandSelected ? onApprove : null,
          style: ElevatedButton.styleFrom(
            backgroundColor: context.primaryColor,
            foregroundColor: !isHandSelected ? Colors.grey[500] : Colors.white,
            textStyle: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            disabledBackgroundColor: Colors.grey[300],
            padding: const EdgeInsets.symmetric(vertical: 18),
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
            elevation: !isHandSelected ? 0 : 4,
            shadowColor: context.primaryColor.withValues(alpha: 0.5),
          ),
          child: Text(AppLocalizations.of(context)!.approveEnrollment),
        ),
        const SizedBox(height: 16),
        TextButton(
          onPressed: onCancel,
          style: TextButton.styleFrom(
            foregroundColor: context.textSecondary,
            textStyle: const TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
            padding: const EdgeInsets.symmetric(vertical: 16),
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
          ),
          child: Text(AppLocalizations.of(context)!.cancel),
        ),
      ],
    );
  }
}
