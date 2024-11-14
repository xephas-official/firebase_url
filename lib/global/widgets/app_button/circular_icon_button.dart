import '../../../app_exporter.dart';

/// this is the circular Icon Button
class CircularIconButton extends StatelessWidget {
  /// constructor
  const CircularIconButton({
    required this.backColor,
    required this.icon,
    required this.onTap,
    super.key,
    this.iconColor = appWhite,
    this.radius = 20,
    this.iconSize,
    this.padding = padding4,
  });

  /// on tap
  final VoidCallback onTap;

  /// color
  final Color backColor;

  /// color
  final Color iconColor;

  /// icon
  final IconData icon;

  /// radius
  final double radius;

  /// iconSize
  final double? iconSize;

  /// padding
  final EdgeInsetsGeometry padding;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: onTap,
      padding: padding,
      icon: CircularIcon(
        radius: radius,
        icon: icon,
        iconSize: iconSize ?? (radius + 4),
        iconColor: iconColor,
        backColor: backColor,
      ),
      splashColor: backColor,
      highlightColor: backColor,
      hoverColor: backColor.withOpacity(.1),
    );
  }
}

/// a wrapper around an icon widget to make it circular
class CircularIcon extends StatelessWidget {
  /// constructor
  const CircularIcon({
    required this.backColor,
    required this.icon,
    this.iconColor = appWhite,
    this.radius = 20,
    this.iconSize = 24,
    super.key,
  });

  /// color
  final Color backColor;

  /// color
  final Color iconColor;

  /// icon
  final IconData icon;

  /// radius
  final double radius;

  /// iconSize
  final double? iconSize;

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      radius: radius,
      backgroundColor: backColor,
      child: Center(
        child: Icon(
          icon,
          color: iconColor,
          size: iconSize ?? radius,
        ),
      ),
    );
  }
}
