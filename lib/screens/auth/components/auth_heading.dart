import '../../../app_exporter.dart';

/// the auth header
class AuthHeader extends StatelessWidget {
  /// [AuthHeader] constructor
  const AuthHeader({
    required this.heading,
    required this.description,
    super.key,
    this.textAlign = TextAlign.center,
  });

  /// heading
  final String heading;

  /// description
  final String description;

  /// text align
  final TextAlign textAlign;

  @override
  Widget build(BuildContext context) {
    return BoldTitleWithDescription(
      boldTitle: BoldTitle(
        title: heading,
        fontSize: fontSize36,
        textAlign: textAlign,
      ),
      textAlign: textAlign,
      description: description,
    );
  }
}
