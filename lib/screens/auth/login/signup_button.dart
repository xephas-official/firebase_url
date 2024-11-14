// Project imports:
import 'package:firebase_url/screens/auth/login/test_login.dart';

import '../../../app_exporter.dart';
import '../data/models/auth_credentials.dart';
import '../data/services/auth_service.dart';

/// sign up button
class SignUpButton extends ConsumerStatefulWidget {
  /// [SignUpButton] constructor
  const SignUpButton({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _SignUpButtonState();
}

class _SignUpButtonState extends ConsumerState<SignUpButton> {
  // istapped
  bool isButtonTapped = false;

  @override
  Widget build(BuildContext context) {
    //  auth service
    final authService = ref.watch(authServiceProvider(ref));

    // sign up credentials
    final signUpCredentials =
        SignUpCredentials.fromLoginCredentials(adminCredentials);

    final appError = ref.watch(appErrorProvider);

    return CircularProgressAppButton(
      isTapped: isButtonTapped,
      text: 'SIGN UP',
      onTap: () async {
        // Unfocus Keyboard
        unfocusKeyboard(context);

        // validate the form
        // and then authenticate if valid
        enableTap();

        // * Sign Up
        await authService
            .signUp(signUpCredentials: signUpCredentials)
            .then((_) async {
          printer('User Signed Up and Logged In');

          // disable tap
          disableTap();

          // Go to next screen if there is no error
          if (appError == null) {
            go(ref, to: homePath);
          }
        }).catchError((Object err) {
          // show error
          printer('Cauth Error: $err');
          // disable tap
          disableTap();
        });
      },
      textColor: appDarkColor,
      buttonColor: caribbeanGreen,
    );
  }

  // enable tap
  void enableTap() {
    setState(() {
      isButtonTapped = true;
    });
  }

  /// Disable the button tap
  void disableTap() {
    if (mounted) {
      setState(() {
        isButtonTapped = false;
      });
    }
  }
}
