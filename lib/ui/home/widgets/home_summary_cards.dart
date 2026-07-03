import 'package:palm_app/package.dart';
import 'summary_card.dart';

class HomeSummaryCards extends StatelessWidget {
  final int presentThisMonth;
  final int lateThisMonth;

  const HomeSummaryCards({
    super.key,
    required this.presentThisMonth,
    required this.lateThisMonth,
  });

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    
    return Row(
      children: [
        Expanded(
          child: SummaryCard(
            count: presentThisMonth,
            label: l10n.presentThisMonth,
            countColor: context.primaryColor,
          ),
        ),
        SizedBox(width: 16.w),
        Expanded(
          child: SummaryCard(
            count: lateThisMonth,
            label: l10n.lateThisMonth,
            countColor: context.lateColor,
          ),
        ),
      ],
    );
  }
}
