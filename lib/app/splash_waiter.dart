import '../app_exporter.dart';

/// this fetches the user stream and listens to the user stream
class SplashWaiter extends ConsumerWidget {
  /// [SplashWaiter] constructor
  const SplashWaiter({
    required this.child,
    super.key,
  });

  /// [child] widget to be displayed
  final Widget child;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final splashWaiter = ref.watch(splashWaitProvider);

    /// * Listen to the user stream so that the app user updates automatically
    return AnimatedSwitcher(
      duration: halfSeconds,
      transitionBuilder: (child, animation) => FadeTransition(
        opacity: animation,
        child: child,
      ),
      child: splashWaiter.when(
        loading: SplashBody.new,
        error: (error, stackTrace) => ErrorDisplay(
          error: error,
          stackTrace: stackTrace,
        ),
        data: (_) => child,
      ),
    );
  }
}

/// A delayed stream provider that waits for 3 seconds before emitting the stream value
/// good for splash screens
// Future<void> splashWait(SplashWaitRef ref) async {
final splashWaitProvider = FutureProvider((ref) {
  // Wait for 3 seconds before emitting the stream value
  return Future<void>.delayed(splashScreenWaitingTime, () async {
    // final userStream = ref.watch(appUserStreamProvider);

    // printer('Got User from: ${userStream.asData}');
  });
});

class SplashBody extends StatelessWidget {
  const SplashBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: appWhite,
      body: Center(
        child: Padding(
          padding: padding16,
          child: const AppLogo(logoSize: 80),
        ),
      ),
    );
  }
}
