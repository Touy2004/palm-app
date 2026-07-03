import 'package:palm_app/package.dart';

class PairingInstructions extends StatelessWidget {
  const PairingInstructions({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: context.surfaceColor,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.03),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            l10n.whatHappensNext,
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15, color: context.textPrimary),
          ),
          const SizedBox(height: 16),
          _buildInstructionRow(context, '1', l10n.instruction1),
          _buildInstructionRow(context, '2', l10n.instruction2),
          _buildInstructionRow(context, '3', l10n.instruction3),
        ],
      ),
    );
  }

  Widget _buildInstructionRow(BuildContext context, String number, String text) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 24,
            height: 24,
            decoration: BoxDecoration(
              color: context.primaryColor.withValues(alpha: 0.1),
              shape: BoxShape.circle,
            ),
            child: Center(
              child: Text(
                number,
                style: TextStyle(color: context.primaryColor, fontWeight: FontWeight.bold, fontSize: 12),
              ),
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Text(
              text,
              style: TextStyle(color: context.textSecondary, height: 1.5),
            ),
          ),
        ],
      ),
    );
  }
}
