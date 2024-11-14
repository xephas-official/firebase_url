import '../../app_exporter.dart';

/// Small Size of the app Logo
class AppLogo extends StatelessWidget {
  /// [AppLogo]  constructor
  const AppLogo({
    super.key,
    this.logoSize = 100.0,
    this.logoPath,
  });

  /// icon size
  final double logoSize;

  /// logo svg path
  final String? logoPath;

  @override
  Widget build(BuildContext context) {
    return Icon(
      Icons.link,
      size: logoSize,
      color: appColor,
    );
  }
}

/// Horizontal Logo of the app
/// used in the app bar
class AppHorizontalLogo extends StatelessWidget {
  /// [AppHorizontalLogo] constructor
  const AppHorizontalLogo({
    super.key,
    this.logoSize = 50.0,
    this.logoPath,
  });

  /// icon size
  final double logoSize;

  /// logo svg path
  final String? logoPath;

  @override
  Widget build(BuildContext context) {
    return AppLogo(logoSize: logoSize);
  }
}
