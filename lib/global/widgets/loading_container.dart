import 'package:shimmer/shimmer.dart';

import '../../app_exporter.dart';

/// this is used for simulation of loading data
class LoadingContainer extends StatelessWidget {
  /// [LoadingContainer] constructor
  const LoadingContainer({
    super.key,
    this.height = spacing16,
    this.width = double.infinity,
    this.borderRadius,
    this.loadingColor = appColor,
    this.decoration,
    this.margin = EdgeInsets.zero,
  });

  /// factory with shimmer
  static Widget withShimmer({
    double height = spacing16,
    double width = double.infinity,
    BorderRadiusGeometry? borderRadius,
    Color loadingColor = appColor,
    Decoration? decoration,
    EdgeInsetsGeometry? margin,
  }) {
    return ShimmerAnimation(
      child: LoadingContainer(
        height: height,
        width: width,
        borderRadius: borderRadius,
        loadingColor: loadingColor,
        decoration: decoration,
        margin: margin,
      ),
    );
  }

  /// height
  final double height;

  /// width
  final double width;

  /// border radius
  final BorderRadiusGeometry? borderRadius;

  /// loading color
  final Color loadingColor;

  /// decoration
  final Decoration? decoration;

  /// margin
  final EdgeInsetsGeometry? margin;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      margin: margin,
      decoration: decoration ??
          BoxDecoration(
            color: loadingColor.withOpacity(.1),
            borderRadius: borderRadius ?? borderRadius8,
          ),
    );
  }
}

/// shimmers any child widget it has
class ShimmerAnimation extends StatelessWidget {
  /// [ShimmerAnimation] constructor
  const ShimmerAnimation({
    required this.child,
    this.color = appWhite,
    super.key,
  });

  /// color
  final Color color;

  /// child
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: color,
      highlightColor: appColor,
      child: child,
    );
  }
}

/// this is used for simulation of loading data in a sliver
class SliverLoadingContainer extends StatelessWidget {
  /// [SliverLoadingContainer] constructor
  const SliverLoadingContainer({
    super.key,
    this.height = spacing16,
    this.width = double.infinity,
    this.borderRadius,
    this.loadingColor = appColor,
    this.decoration,
  });

  /// height
  final double height;

  /// width
  final double width;

  /// border radius
  final BorderRadiusGeometry? borderRadius;

  /// loading color
  final Color loadingColor;

  /// decoration
  final Decoration? decoration;

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: LoadingContainer(
        height: height,
        width: width,
        borderRadius: borderRadius,
        loadingColor: loadingColor,
        decoration: decoration,
      ),
    );
  }
}

/// this is used for simulation of loading data
class LoadingBody extends StatelessWidget {
  /// [LoadingBody] constructor
  const LoadingBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ShimmerAnimation(
      child: ListView(
        padding: padding16,
        children: const [
          LoadingContainer(height: 200),
          Spacing(of: spacing32),
          LoadingContainer(height: 600),
          Spacing(of: spacing16),
          LoadingContainer(height: 200),
          Spacing(of: spacing32),
          LoadingContainer(height: 600),
        ],
      ),
    );
  }
}
