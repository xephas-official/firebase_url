import 'package:flutter_spinkit/flutter_spinkit.dart';

import '../../../app_exporter.dart';

/// this is the body of the `AppButton`
class ButtonBody extends ConsumerWidget {
  /// [ButtonBody] constructor
  const ButtonBody({
    required this.buttonColor,
    required this.toolTip,
    required this.text,
    required this.textColor,
    required this.tooltipTextColor,
    required this.iconData,
    required this.onTap,
    required this.isSmallButton,
    required this.showLoader,
    super.key,
    this.iconWidget,
  });

  /// whether this is a small button
  final bool isSmallButton;

  /// whether to show loader
  final bool showLoader;

  /// color of the button
  final Color buttonColor;

  /// tooltip for the button
  final String? toolTip;

  /// text label
  final String text;

  /// color of the text
  final Color textColor;

  /// color of the button
  final Color? tooltipTextColor;

  /// icon to be used in the button
  final IconData? iconData;

  /// callback function when button is tapped
  final VoidCallback? onTap;

  /// widget to be used as icon
  final Widget? iconWidget;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final density = Theme.of(context).visualDensity;

    final width = MediaQuery.of(context).size.width;

    final appResponsive = ref.watch(appResponsiveProvider(context));

    final isDesktop = appResponsive.isDesktopScreen;
    final isMobile = appResponsive.isMobileScreen;

    /// True if It has an Icon
    final hasIconData = (iconData != null);
    final hasIconWidget = (iconWidget != null);
    final hasIcon = hasIconData || hasIconWidget;

    /// show icon button, if it hs icon and we're not showing the loader
    final showIconButton = hasIcon && !showLoader;

    /// elevation
    const elevation = 0.0;

    //
    final buttonStyle = ElevatedButton.styleFrom(
      backgroundColor: buttonColor,
      foregroundColor: textColor,
      elevation: elevation,
      shape: buttonShape,
      shadowColor: textColor.withOpacity(.2),
      visualDensity: density,
      textStyle: boldTextStyle.copyWith(
        fontSize: isDesktop ? 16 : 14,
      ),
    );

    // loader
    final loader = SpinKitThreeInOut(
      size: 40,
      itemBuilder: (BuildContext context, int index) {
        return Container(
          margin: margin2,
          width: 40,
          height: 40,
          decoration: BoxDecoration(
            color: index.isEven ? textColor.withOpacity(.35) : textColor,
            shape: BoxShape.circle,
          ),
        );
      },
    );

    //
    final label = showLoader
        ? loader
        : Text(
            text.inUpperCase,
            maxLines: 1,
          );

    return AnimatedContainer(
      width: isSmallButton ? null : (isMobile ? width : maxScreenWidth),
      duration: quarterSeconds,

      /// for good looking UI o mobile we set this height to 42
      height: isDesktop ? kDesktopButtonHeight : kButtonHeight,
      child: Tooltip(
        message: toolTip ?? text,
        textStyle: TextStyle(color: tooltipTextColor ?? buttonColor),
        decoration: BoxDecoration(
          color: textColor,
          borderRadius: borderRadius4,
        ),
        child: showIconButton
            ? ElevatedButton.icon(
                onPressed: onTap,
                style: buttonStyle,
                label: label,
                icon: iconWidget ?? Icon(iconData, color: textColor),
              )
            : ElevatedButton(
                onPressed: onTap,
                style: buttonStyle,
                child: label,
              ),
      ),
    );
  }
}
