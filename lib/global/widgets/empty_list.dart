import '../../../app_exporter.dart';

/// shown when there are no items in cart
class EmptyPage {
  /// constructor
  const EmptyPage({
    required this.title,
    required this.description,
    this.buttonText = '',
    this.buttonIcon = Icons.add,
    this.buttonAction,
  });

  /// title of the page
  final String title;

  /// description of the page
  final String description;

  /// button text
  final String buttonText;

  /// button icon
  final IconData buttonIcon;

  /// button action
  final VoidCallback? buttonAction;
}

/// shown when there are no items in cart
class EmptyList extends ConsumerWidget {
  /// constructor
  const EmptyList({
    required this.emptyPage,
    this.actionButton,
    this.afterText = '',
    this.textAlign = TextAlign.center,
    super.key,
  });

  /// page
  final EmptyPage emptyPage;

  /// nullable text align
  final TextAlign? textAlign;

  /// after text
  final String afterText;

  // nullable action button
  final Widget? actionButton;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Padding(
      padding: horizontalPadding32,
      // const EdgeInsets.symmetric(vertical: spacing8, horizontal: spacing32),
      child: ExpandedScrollingColumn(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          const Spacing(of: spacing16),
          SizedBox(
            width: MediaQuery.of(context).size.width * 0.6,
            child: AspectRatio(
              aspectRatio: 1,
              child: AppLogo(
                logoSize: 200,
              ),
            ),
          ),
          const Spacing(of: spacing8),
          BoldTitleWithDescription(
            boldTitle: BoldTitle(
              title: emptyPage.title,
              textAlign: textAlign,
              fontSize: 30,
            ),
            description: emptyPage.description,
            descFontSize: 15,
            textAlign: textAlign,
          ),
          const Spacing(of: spacing24),
          actionButton ??
              AppButton(
                textColor: appDarkColor,
                buttonColor: caribbeanGreen,
                text: emptyPage.buttonText,
                icon: emptyPage.buttonIcon,
                onTap: emptyPage.buttonAction,
              ),
          const Spacing(of: spacing16),
        ],
      ),
    );
  }
}
