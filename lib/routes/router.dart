import '../../app_exporter.dart';

///* this provides the default router delegate for the app
final goRouterProvider = Provider<GoRouter>((ref) {
  return GoRouter(
    initialLocation: initialPath,
    restorationScopeId: appId,
    routes: [
      // //* splash screen
      // GoRoute(
      //   path: splashPath,
      //   builder: (context, state) => const AnimatedSplashScreen(),
      // ),

      //* home page
      GoRoute(
        path: homePath,
        builder: (context, state) => const AppHome(),
      ),

      //* auth
      GoRoute(
        path: authPath,
        builder: (context, state) => AppAuth(),
      ),

      //* profile
      GoRoute(
        path: profilePath,
        builder: (context, state) => UserProfile(),
      ),
    ],

    redirect: (_, state) {
      //! ** this app user is repeated here, and therefore don't delete it
      final appUser = FirebaseAuth.instance.currentUser;

      /// set the user logged in variable
      final loggedIn = (appUser != null);

      /// is authenticating
      final isAuthenticating = (state.matchedLocation == authPath);

      /// if the user is on the auth Screen or Welcome screen which also has the auth UI
      final loggingIn = isAuthenticating;

     
      /// if the user is not logged in, then ...
      if (!loggedIn) {
        /// if user is on auth or welcome page then we redirect to the welcome page
        /// else don't redirect to any page since the user is on the login page
        return loggingIn ? null : authPath;
      }

      /// if the user is logged in but still on the login page, send them to
      /// the home page
      if (loggingIn) return homePath;

      /// no need to redirect at all
      return null;
    },
    onException: (context, state, _) => ErrorDisplay(
      error: state.error.toString(),
      stackTrace: StackTrace.current,
    ),
    // log diagnostic info for your routes
    debugLogDiagnostics: true,

    observers: [
      // FirebaseAnalyticsObserver(analytics: AppAnalytics.analytics),
    ],
  );
});
