import 'package:palm_app/package.dart';
import '../view_models/palm_detail_view_model.dart';
import '../view_models/palm_view_model.dart';
import '../widgets/palm_detail_card.dart';
import '../widgets/palm_action_buttons.dart';
import '../widgets/palm_detail_skeleton.dart';

class PalmDetailView extends ConsumerStatefulWidget {
  final PalmTemplate palm;

  const PalmDetailView({
    super.key,
    required this.palm,
  });

  @override
  ConsumerState<PalmDetailView> createState() => _PalmDetailViewState();
}

class _PalmDetailViewState extends ConsumerState<PalmDetailView> {
  bool _isLoading = false;

  Future<void> _handleRemove() async {
    final l10n = AppLocalizations.of(context)!;
    final confirm = await showDialog<bool>(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(l10n.removePalm),
        content: Text(l10n.removePalmConfirm),
        actions: [
          TextButton(onPressed: () => Navigator.pop(context, false), child: Text(l10n.cancel)),
          TextButton(onPressed: () => Navigator.pop(context, true), child: Text(l10n.remove, style: const TextStyle(color: Colors.red))),
        ],
      ),
    );

    if (confirm != true) return;

    setState(() => _isLoading = true);
    final action = ref.read(palmDetailActionProvider);
    final error = await action.removePalm(widget.palm.id);
    
    if (!mounted) return;
    setState(() => _isLoading = false);

    if (error == null) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(l10n.palmRemovedSuccess)));
      ref.read(palmViewModelProvider.notifier).refresh();
      context.pop();
    } else {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(l10n.failed(error.toString()))));
    }
  }

  Future<void> _handleReRegister() async {
    final l10n = AppLocalizations.of(context)!;
    final confirm = await showDialog<bool>(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(l10n.reRegisterPalm),
        content: Text(l10n.reRegisterPalmConfirm),
        actions: [
          TextButton(onPressed: () => Navigator.pop(context, false), child: Text(l10n.cancel)),
          TextButton(onPressed: () => Navigator.pop(context, true), child: Text(l10n.continueAction)),
        ],
      ),
    );

    if (confirm != true) return;

    setState(() => _isLoading = true);
    final action = ref.read(palmDetailActionProvider);
    final error = await action.removePalm(widget.palm.id);
    
    if (!mounted) return;
    setState(() => _isLoading = false);

    if (error == null) {
      ref.read(palmViewModelProvider.notifier).refresh();
      context.pushReplacement('/pairing/scan');
    } else {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(l10n.failed(error.toString()))));
    }
  }

  Widget _buildInfoRow(IconData icon, String label, String value, {bool isBlue = false}) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 18),
      margin: const EdgeInsets.only(bottom: 12),
      decoration: BoxDecoration(
        color: context.surfaceColor,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.03),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ]
      ),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: context.primaryColor.withValues(alpha: 0.1),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Icon(icon, color: context.primaryColor, size: 22),
          ),
          const SizedBox(width: 16),
          Text(label, style: TextStyle(color: context.textSecondary, fontSize: 15, fontWeight: FontWeight.w500)),
          const Spacer(),
          Text(value, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15, color: isBlue ? context.primaryColor : context.textPrimary)),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    final isRight = widget.palm.handSide.toLowerCase() == 'right';
    final dateStr = DateFormat('dd MMM yyyy').format(widget.palm.createdAt);

    return Scaffold(
      backgroundColor: context.backgroundColor,
      appBar: AppBar(
        title: Text(isRight ? l10n.rightPalm : l10n.leftPalm, style: TextStyle(color: context.primaryColor, fontWeight: FontWeight.bold)),
        backgroundColor: context.backgroundColor,
        iconTheme: IconThemeData(color: context.primaryColor),
        elevation: 0,
      ),
      body: _isLoading 
          ? const PalmDetailSkeleton()
          : SingleChildScrollView(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  // Top Card
                  PalmDetailCard(isRight: isRight),
                  const SizedBox(height: 16),

                  // Info Rows
                  _buildInfoRow(Icons.back_hand_outlined, l10n.handSide, isRight ? l10n.rightPalm : l10n.leftPalm, isBlue: true),
                  _buildInfoRow(Icons.memory, l10n.modelVersion, widget.palm.modelVersion),
                  _buildInfoRow(Icons.calendar_today_outlined, l10n.enrolledOn, dateStr),
                  _buildInfoRow(Icons.desktop_windows_outlined, l10n.device, widget.palm.registeredDeviceName),
                  
                  const SizedBox(height: 24),

                  // Buttons (Only visible to admins)
                  if (ref.watch(authServiceProvider).user?.role.toLowerCase() == 'admin')
                    PalmActionButtons(
                      onReRegister: _handleReRegister,
                      onRemove: _handleRemove,
                    ),
                ],
              ),
            ),
    );
  }
}
