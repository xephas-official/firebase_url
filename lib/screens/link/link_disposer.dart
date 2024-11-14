import '../../app_exporter.dart';
import 'data/providers.dart';

/// this disposes the link body
class LinkDisposer extends ConsumerStatefulWidget {
  const LinkDisposer({
    super.key,
    required this.child,
  });

  // child
  final Widget child;

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _DisposableLinkBodyState();
}

class _DisposableLinkBodyState extends ConsumerState<LinkDisposer>
    with WidgetsBindingObserver {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    if (state != AppLifecycleState.resumed) {
      // Force dispose of the provider when app is terminated, i.e. not in the resumed state
      // in order to avoid memory leaks
      ref.invalidate(linkStreamProvider);

      printer('App is terminated', isSuccess: true);
    }
  }

  @override
  Widget build(BuildContext context) {
    return widget.child;
  }
}
