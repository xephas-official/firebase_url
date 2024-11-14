import '../../app/splash_waiter.dart';
import '../../app_exporter.dart';
import 'home_screen.dart';

/// This is the home screen of the app
class AppHome extends StatelessWidget {
  /// [AppHome] constructor
  const AppHome({super.key});

  @override
  Widget build(BuildContext context) {
    return const SplashWaiter(child: HomeScreen());
  }
}
