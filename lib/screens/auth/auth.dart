import '../../app_exporter.dart';
import 'login/login.dart';

/// app authentication screen
class AppAuth extends ConsumerWidget {
  /// [AppAuth] constructor
  const AppAuth({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {

    return Scaffold(
      // backgroundColor: appWhite,
      body: Padding(
        padding: horizontalPadding16,
        child: SafeArea(
          child: KeyboardUnfocusWrapper(
            child: LoginScreen(),
          ),
        ),
      ),
    );
  }
}
