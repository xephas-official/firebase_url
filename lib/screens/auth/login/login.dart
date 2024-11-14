import '../../../app_exporter.dart';
import '../components/auth_heading.dart';
import 'login_form.dart';

/// has the login form for user to login
class LoginScreen extends StatelessWidget {
  /// [LoginScreen] constructor
  const LoginScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    //
    return ExpandedScrollingColumn(
      mainAxisAlignment: MainAxisAlignment.center,
      children: const [
        Spacing(of: spacing32),
        Center(
          child: Padding(
            padding: verticalPadding32,
            child: AppLogo(),
          ),
        ),
        AuthHeader(
          heading: 'Login',
          description:
              'Welcome back! Tap the button below to login to your account',
        ),
        Spacing(of: spacing16),
        LoginForm(),
      ],
    );
  }
}
