import '../../../app_exporter.dart';

/// shown when the overview page is loading
class LinkLoader extends StatelessWidget {
  /// constructor
  const LinkLoader({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: padding16,
      children: const [
        LoadingContainer(height: 100),
        Spacing(of: spacing16),
        LoadingContainer(height: 300),
        Spacing(of: spacing16),
        LoadingContainer(height: 100),
      ],
    );
  }
}
