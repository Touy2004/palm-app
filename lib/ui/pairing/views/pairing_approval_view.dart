import 'package:palm_app/package.dart';
import '../view_models/pairing_approval_view_model.dart';
import '../widgets/pairing_timer_banner.dart';
import '../widgets/device_info_ticket.dart';
import '../widgets/hand_selection_card.dart';
import '../widgets/approval_action_buttons.dart';
import '../widgets/pairing_instructions.dart';
import '../widgets/pairing_approval_skeleton.dart';

class PairingApprovalView extends ConsumerWidget {
  final String sessionToken;

  const PairingApprovalView({
    super.key,
    required this.sessionToken,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final deviceAsync = ref.watch(pairingDeviceInfoProvider(sessionToken));
    final viewModelAsync = ref.watch(pairingApprovalViewModelProvider);
    final viewModelState = viewModelAsync.value ?? PairingApprovalState();
    final viewModel = ref.read(pairingApprovalViewModelProvider.notifier);

    // Listen for timeout
    ref.listen(pairingApprovalViewModelProvider.select((vm) => vm.value?.isTimeout), (prev, isTimeout) {
      if (isTimeout == true) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Session time out')),
        );
        context.pop();
      }
    });

    return Scaffold(
      backgroundColor: context.backgroundColor,
      appBar: AppBar(
        title: Text(AppLocalizations.of(context)!.palmApproval, style: TextStyle(color: context.primaryColor, fontWeight: FontWeight.bold)),
        backgroundColor: context.backgroundColor,
        iconTheme: IconThemeData(color: context.primaryColor),
        elevation: 0,
      ),
      body: deviceAsync.when(
        loading: () => const PairingApprovalSkeleton(),
        error: (err, st) => Center(
          child: Padding(
            padding: const EdgeInsets.all(24.0),
            child: Text(ApiErrorParser.parse(err), style: TextStyle(color: context.errorColor, fontSize: 16)),
          ),
        ),
        data: (device) {
          return SingleChildScrollView(
            padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 24.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                PairingTimerBanner(formattedTime: viewModelState.formattedTime),
                const SizedBox(height: 24),
                DeviceInfoTicket(device: device),
                const SizedBox(height: 32),
                
                Text(
                  'Employee Code',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600, color: context.textPrimary, letterSpacing: 0.5),
                ),
                const SizedBox(height: 16),
                TextField(
                  onChanged: (val) => viewModel.setEmployeeCode(val),
                  style: TextStyle(color: context.textPrimary),
                  decoration: InputDecoration(
                    hintText: 'Enter Employee Code (e.g., EMP001)',
                    hintStyle: TextStyle(color: context.textSecondary),
                    filled: true,
                    fillColor: context.surfaceColor,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: BorderSide.none,
                    ),
                    contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
                  ),
                ),

                const SizedBox(height: 32),
                
                Text(
                  AppLocalizations.of(context)!.whichHandScanning,
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600, color: context.textPrimary, letterSpacing: 0.5),
                ),
                const SizedBox(height: 16),
                Row(
                  children: [
                    Expanded(
                      child: HandSelectionCard(
                        title: AppLocalizations.of(context)!.leftHand,
                        side: 'left',
                        icon: Icons.back_hand,
                        isSelected: viewModelState.selectedHand == 'left',
                        onTap: () => viewModel.selectHand('left'),
                      ),
                    ),
                    const SizedBox(width: 16),
                    Expanded(
                      child: HandSelectionCard(
                        title: AppLocalizations.of(context)!.rightHand,
                        side: 'right',
                        icon: Icons.pan_tool,
                        isSelected: viewModelState.selectedHand == 'right',
                        onTap: () => viewModel.selectHand('right'),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 32),
                const PairingInstructions(),
                const SizedBox(height: 40),
                
                ApprovalActionButtons(
                  isLoading: viewModelState.isLoading,
                  isHandSelected: viewModelState.selectedHand != null && viewModelState.employeeCode.trim().isNotEmpty,
                  onApprove: () async {
                    final scaffoldMessenger = ScaffoldMessenger.of(context);
                    final navigator = GoRouter.of(context);
                    final l10n = AppLocalizations.of(context)!;
                    
                    final success = await viewModel.approve(sessionToken);
                    
                    if (success) {
                      scaffoldMessenger.showSnackBar(
                        SnackBar(content: Text(l10n.pairingApproved)),
                      );
                      navigator.pop();
                    } else {
                      final error = ref.read(pairingApprovalViewModelProvider).value?.error;
                      if (error != null) {
                        UIUtils.showErrorDialog(context, error, title: l10n.approvalFailed);
                      }
                    }
                  },
                  onCancel: () => context.pop(),
                ),
                const SizedBox(height: 40),
              ],
            ),
          );
        },
      ),
    );
  }
}
