import '../../../app_exporter.dart';

/// back button to pop off this screen and go to a given screen
class AppBackButton extends ConsumerWidget {
  ///This is a Back Button that shows an Ad to the User.
  const AppBackButton({
    super.key,
    this.goToPath,
    this.iconColor = appWhite,
    this.backgroundColor = appBlack,
  });

  /// go to path
  final String? goToPath;

  /// icon color
  final Color iconColor;

  /// background color
  final Color backgroundColor;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
      margin: margin8,
      clipBehavior: Clip.antiAlias,
      decoration: BoxDecoration(
        color: backgroundColor.withOpacity(.1),
        // borderRadius: borderRadius6,
        shape: BoxShape.circle,
      ),
      padding: padding2,
      child: Center(
        child: InkWell(
          borderRadius: BorderRadius.circular(200),
          child: Center(
            child: Icon(
              Icons.arrow_back,
              color: backgroundColor,
            ),
          ),
          onTap: () {
            final goTo = goToPath;

            /// pop page, if possible show ads
            if (goTo != null) {
              go(ref, to: goTo);
            } else {
              pop(ref);
            }
          },
        ),
      ),
    );
  }
}
