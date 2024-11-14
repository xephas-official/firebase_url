// Project imports:
import '../../../app_exporter.dart';
import '../login/login_button.dart';
import '../data/models/auth_credentials.dart';

/// this is used for testing purposes
class TestLoginButton extends StatelessWidget {
  /// [TestLoginButton] constructor
  const TestLoginButton({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        // admin login
        LogInButton(
          loginCredentials: adminCredentials,
          label: 'LOGIN',
          color: appColor,
        ),
        Spacing(of: spacing8),
        // LogInButton(
        //   loginCredentials: adminCredentials,
        //   label: 'LOGIN AS ACC',
        //   color: Color(0xfff422a0),
        // ),
      ],
    );
  }
}

/// admin credentials
/// This is the admin account
const adminCredentials = LoginCredentials(
  email: 'xephas@fire.com',
  password: 'test123',
);
