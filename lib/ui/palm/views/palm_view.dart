import 'package:palm_app/package.dart';
import '../view_models/palm_view_model.dart';
import '../widgets/palm_card.dart';
import '../widgets/palm_skeleton.dart';

class PalmView extends ConsumerStatefulWidget {
  const PalmView({super.key});

  @override
  ConsumerState<PalmView> createState() => _PalmViewState();
}

class _PalmViewState extends ConsumerState<PalmView> {
  @override
  Widget build(BuildContext context) {
    final palmsAsync = ref.watch(palmViewModelProvider);
    final l10n = AppLocalizations.of(context)!;

    return Scaffold(
      backgroundColor: context.backgroundColor,
      appBar: AppBar(
        title: Text(l10n.myPalms, style: TextStyle(color: context.primaryColor, fontWeight: FontWeight.bold, fontSize: 18.sp)),
        backgroundColor: context.backgroundColor,
        elevation: 0,
      ),
      body: palmsAsync.when(
        loading: () => const PalmSkeleton(),
        error: (err, st) => Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 24.w),
                child: Text(
                  ApiErrorParser.parse(err),
                  style: TextStyle(color: context.errorColor, fontSize: 16.sp),
                  textAlign: TextAlign.center,
                ),
              ),
              SizedBox(height: 16.h),
              ElevatedButton(
                onPressed: () => ref.read(palmViewModelProvider.notifier).refresh(),
                child: Text(l10n.retry),
              )
            ],
          ),
        ),
        data: (palms) {
          if (palms.isEmpty) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.back_hand, size: 64.sp, color: Colors.grey),
                  SizedBox(height: 16.h),
                  Text(l10n.noPalmsRegistered, style: TextStyle(fontSize: 16.sp, color: Colors.grey)),
                ],
              ),
            );
          }

          return RefreshIndicator(
            onRefresh: () => ref.read(palmViewModelProvider.notifier).refresh(),
            child: ListView.builder(
              padding: EdgeInsets.all(20.w),
              itemCount: palms.length,
              itemBuilder: (context, index) {
                final palm = palms[index];
                return PalmCard(
                  palm: palm,
                  onTap: () => context.push('/palm/detail', extra: palm),
                );
              },
            ),
          );
        },
      ),
    );
  }
}
