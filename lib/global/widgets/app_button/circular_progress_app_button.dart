import '../../../app_exporter.dart';

/// A button that shows a circular progress indicator when tapped
class CircularProgressAppButton extends StatelessWidget {
  /// [CircularProgressAppButton] constructor
  const CircularProgressAppButton({
    required this.isTapped,
    required this.onTap,
    required this.text,
    required this.textColor,
    required this.buttonColor,
    this.tooltipTextColor,
    super.key,
    this.icon,
    this.iconWidget,
    this.toolTip,
    this.shape,
  });

  /// whether the button is tapped or not
  final bool isTapped;

  /// callback function when button is tapped
  final VoidCallback onTap;

  /// text label for this button
  final String text;

  /// color of the text
  final Color textColor;

  /// color of the button
  final Color buttonColor;

  /// color of the tooltip
  final Color? tooltipTextColor;

  /// icon to be used
  final IconData? icon;

  /// tooltip for the button
  final String? toolTip;

  /// shape of the button
  final OutlinedBorder? shape;

  /// widget to be used as icon
  final Widget? iconWidget;

  @override
  Widget build(BuildContext context) {
   
    return AppButton(
      text: text.inUpperCase,
      onTap: onTap,
      toolTip: toolTip,
      icon: icon,
      textColor: textColor,
      tooltipTextColor: tooltipTextColor ?? buttonColor,
      buttonColor: buttonColor,
      iconWidget: iconWidget,
      showLoader: isTapped,
    );
  }
}
