import '../../app_exporter.dart';

/// This displays a big heading 1 kind of title on a given page with
///  further customizations too
class BoldTitle extends StatelessWidget {
  /// [BoldTitle] constructor
  const BoldTitle({
    required this.title,
    super.key,
    this.color = appBlack,
    this.fontSize = 35,
    this.textAlign = TextAlign.center,
    this.maxLines,
  });

  /// text to use as the title
  final String title;

  /// text color
  final Color color;

  /// text font size
  final double? fontSize;

  /// text alignment
  final TextAlign? textAlign;

  /// maxlines
  final int? maxLines;

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      textAlign: textAlign,
      maxLines: maxLines,
      style: mediumBoldTextStyle.copyWith(
        color: color,
        fontSize: fontSize,
        fontWeight: FontWeight.bold,
      ),
    );
  }
}

/// sliver bold title
class SliverBoldTitle extends StatelessWidget {
  /// [SliverBoldTitle] constructor
  const SliverBoldTitle({
    required this.title,
    super.key,
    this.color = appBlack,
    this.fontSize = fontSize36,
    this.textAlign = TextAlign.center,
  });

  /// text to use as the title
  final String title;

  /// text color
  final Color color;

  /// text font size
  final double? fontSize;

  /// text alignment
  final TextAlign? textAlign;

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: BoldTitle(
        title: title,
        color: color,
        fontSize: fontSize,
        textAlign: textAlign,
      ),
    );
  }
}

/// bold title and description widget
class BoldTitleWithDescription extends StatelessWidget {
  /// [BoldTitleWithDescription] constructor
  const BoldTitleWithDescription({
    required this.boldTitle,
    required this.description,
    super.key,
    this.color = appBlack,
    this.descFontSize,
    this.textAlign = TextAlign.start,
    this.maxLines,
    this.crossAxisAlignment = CrossAxisAlignment.center,
  });

  /// [BoldTitle] tile
  final BoldTitle boldTitle;

  /// description
  final String description;

  /// text align
  final TextAlign? textAlign;

  /// text color
  final Color? color;

  /// max lines
  final int? maxLines;

  /// description font size
  final double? descFontSize;

  /// cross alignment font size
  final CrossAxisAlignment crossAxisAlignment;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: crossAxisAlignment,
      children: [
        boldTitle,
        // const Spacing(of: spacing2),
        // description
        Text(
          description,
          textAlign: textAlign,
          maxLines: maxLines,
          style: TextStyle(
            color: color,
            fontSize: descFontSize,
            // fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }
}
