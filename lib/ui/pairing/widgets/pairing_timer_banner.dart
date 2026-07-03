import 'package:palm_app/package.dart';

class PairingTimerBanner extends StatelessWidget {
  final String formattedTime;

  const PairingTimerBanner({
    super.key,
    required this.formattedTime,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      decoration: BoxDecoration(
        color: Colors.orange.withValues(alpha: 0.1),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.orange.withValues(alpha: 0.3)),
      ),
      child: Row(
        children: [
          const Icon(Icons.timer_outlined, color: Colors.orange),
          const SizedBox(width: 12),
          Expanded(
            child: Text(
              AppLocalizations.of(context)!.sessionExpiresIn(formattedTime),
              style: TextStyle(color: Colors.orange[800], fontWeight: FontWeight.bold),
            ),
          ),
        ],
      ),
    );
  }
}
