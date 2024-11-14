import '../../../../app_exporter.dart';

/// shows the user's name and email
class ProfileNameEmail extends ConsumerWidget {
  /// [ProfileNameEmail] constructor
  const ProfileNameEmail({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    /// current app user
    final appUser = ref.watch(appUserProvider);

    final textColor = appDarkColor;

    return BoldTitleWithDescription(
      boldTitle: BoldTitle(title: appUser.firstName, color: textColor),
      description: appUser.email,
      color: textColor,
      descFontSize: 16,
    );
  }
}
