import 'package:palm_app/package.dart';

class ProfilePreferencesCard extends ConsumerWidget {
  const ProfilePreferencesCard({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 8.h),
          child: Text(
            AppLocalizations.of(context)!.preferences.toUpperCase(),
            style: TextStyle(
              color: context.textSecondary,
              fontSize: 13.sp,
              letterSpacing: 1.5,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        Container(
          decoration: BoxDecoration(
            color: context.surfaceColor,
            borderRadius: BorderRadius.circular(20.r),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withValues(alpha: 0.03),
                blurRadius: 10.r,
                offset: Offset(0, 4.h),
              ),
            ],
          ),
          child: Column(
            children: [
              // Theme Switcher
              Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: 20.w,
                  vertical: 12.h,
                ),
                child: Row(
                  children: [
                    Container(
                      padding: EdgeInsets.all(10.w),
                      decoration: BoxDecoration(
                        color: context.primaryColor.withValues(alpha: 0.1),
                        borderRadius: BorderRadius.circular(12.r),
                      ),
                      child: Icon(
                        Icons.dark_mode,
                        color: context.primaryColor,
                        size: 22.sp,
                      ),
                    ),
                    SizedBox(width: 16.w),
                    Text(
                      AppLocalizations.of(context)!.darkMode,
                      style: TextStyle(
                        color: context.textPrimary,
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const Spacer(),
                    Consumer(
                      builder: (context, ref, child) {
                        final themeMode = ref.watch(themeProvider);
                        final isDark = themeMode == ThemeMode.dark || (themeMode == ThemeMode.system && context.isDarkMode);
                        return Switch(
                          value: isDark,
                          activeColor: context.primaryColor,
                          onChanged: (value) {
                            ref.read(themeProvider.notifier).setThemeMode(
                                  value ? ThemeMode.dark : ThemeMode.light,
                                );
                          },
                        );
                      },
                    ),
                  ],
                ),
              ),
              Divider(
                height: 1,
                indent: 60.w,
                color: context.dividerColor,
              ),
              // Language Switcher
              Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: 20.w,
                  vertical: 8.h,
                ),
                child: Row(
                  children: [
                    Container(
                      padding: EdgeInsets.all(10.w),
                      decoration: BoxDecoration(
                        color: context.primaryColor.withValues(alpha: 0.1),
                        borderRadius: BorderRadius.circular(12.r),
                      ),
                      child: Icon(
                        Icons.language,
                        color: context.primaryColor,
                        size: 22.sp,
                      ),
                    ),
                    SizedBox(width: 16.w),
                    Text(
                      AppLocalizations.of(context)!.language,
                      style: TextStyle(
                        color: context.textPrimary,
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const Spacer(),
                    Consumer(
                      builder: (context, ref, child) {
                        final locale = ref.watch(localeProvider);
                        return SegmentedButton<String>(
                          segments: [
                            ButtonSegment(
                              value: 'en',
                              label: Text('EN', style: TextStyle(fontSize: 13.sp)),
                            ),
                            ButtonSegment(
                              value: 'lo',
                              label: Text('LO', style: TextStyle(fontSize: 13.sp)),
                            ),
                          ],
                          selected: {locale.languageCode},
                          onSelectionChanged: (Set<String> newSelection) {
                            ref.read(localeProvider.notifier).setLocale(Locale(newSelection.first));
                          },
                          style: ButtonStyle(
                            visualDensity: VisualDensity.compact,
                            padding: WidgetStateProperty.all(
                              EdgeInsets.symmetric(horizontal: 12.w),
                            ),
                          ),
                        );
                      },
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
