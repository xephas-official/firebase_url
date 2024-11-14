import '../app_exporter.dart';

///This is the root of our FireUrl app
class FireUrl extends ConsumerWidget {
  /// constructor
  const FireUrl({super.key});

  @override
  Widget build(BuildContext context,ref) {
       final goRouter = ref.watch(goRouterProvider);

    final appTheme = ref.watch(appThemeProvider);

    return MaterialApp.router(
      // -- Router --
      routerConfig: goRouter,

      // -- Theme --
      color: appColor,
      theme: appTheme,

      // -- Title --
      title: appTitle,
      restorationScopeId: appId,

      // -- Debug Mode --
      debugShowCheckedModeBanner: false,

      // -- Bouncing Scroll Behavior --
      scrollBehavior: const MaterialScrollBehavior().copyWith(
        physics: const BouncingScrollPhysics(),
        scrollbars: false,
      ),
    );
  }
}
