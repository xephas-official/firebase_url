import '../../../app_exporter.dart';

/// Official Text Button for the app

class AppTextButton extends ConsumerWidget {
  /// [AppTextButton] constructor
  const AppTextButton({
    required this.onTap,
    required this.textColor,
    required this.text,
    this.buttonColor = appTransparent,
    this.icon,
    this.tooltipTextColor,
    super.key,
    this.toolTip,
  });

  /// callback function when button is tapped
  final VoidCallback onTap;

  /// color of the text
  final Color textColor;

  /// color of the button
  final Color buttonColor;

  /// color of the button
  final Color? tooltipTextColor;

  /// text: The text to be displayed on the button
  final String text;

  /// tooltip: The tooltip to show when the user hovers over the button.
  final String? toolTip;

  /// icon to be used in the button
  final IconData? icon;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final appResponsive = ref.watch(appResponsiveProvider(context));

    final isDesktop = appResponsive.isDesktopScreen;
    final isMobile = appResponsive.isMobileScreen;

    final buttonTextStyle = boldTextStyle.copyWith(
      fontSize: isDesktop ? 16 : 14,
      color: textColor,
      fontWeight: FontWeight.w700,
    );

    /// True if It has an Icon
    final hasIcon = (icon != null);

    final density = Theme.of(context).visualDensity;

    final textButtonStyle = TextButton.styleFrom(
      foregroundColor: textColor,
      backgroundColor: buttonColor,
      visualDensity: density,
      shape: buttonShape,
      // shape: const RoundedRectangleBorder(
      //   borderRadius: borderRadius8,
      // ),
    );
    final buttonText = Padding(
      padding: padding2,
      child: Text(
        text.toUpperCase(),
        maxLines: 1,
        style: buttonTextStyle,
      ),
    );

    final width = MediaQuery.of(context).size.width;

    return Tooltip(
      message: (toolTip ?? text).inUpperCase,
      textStyle: TextStyle(color: tooltipTextColor ?? buttonColor),
      decoration: BoxDecoration(
        color: textColor,
        borderRadius: borderRadius4,
      ),
      child: SizedBox(
        width: (isMobile ? width : maxScreenWidth),

        /// for good looking UI o mobile we set this height to 42
        // height: isDesktop ? kDesktopButtonHeight : kButtonHeight,
        child: hasIcon
            ? TextButton.icon(
                onPressed: onTap,
                style: textButtonStyle,
                icon: Icon(icon, color: textColor),
                label: buttonText,
              )
            : TextButton(
                onPressed: onTap,
                style: textButtonStyle,
                child: buttonText,
              ),
      ),
    );
  }
}
