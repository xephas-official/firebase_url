// Project imports:
import '../../../app_exporter.dart';
import '../../../data/user/user_cloud_service.dart';
import '../data/models/auth_credentials.dart';
import '../data/services/auth_service.dart';
import 'providers.dart';

/// login button
class LogInButton extends ConsumerStatefulWidget {
  /// [LogInButton] constructor
  const LogInButton({
    super.key,
    required this.loginCredentials,
    this.label = 'LOGIN',
    this.color = caribbeanGreen,
    this.textColor = appDarkColor,
  });

  /// login credentials
  final LoginCredentials loginCredentials;

  /// label
  final String label;

  /// color
  final Color color;

  /// color
  final Color textColor;

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _LoginInButtonState();
}

class _LoginInButtonState extends ConsumerState<LogInButton> {
// istapped
  bool isButtonTapped = false;

  @override
  Widget build(BuildContext context) {
    final signInFormKey = ref.watch(loginFormKeyProvider);

    // login credentials
    // ignore: omit_local_variable_types
    final LoginCredentials loginCredentials = (widget.loginCredentials);

    //  auth service
    final authService = ref.watch(authServiceProvider(ref));

    return CircularProgressAppButton(
      isTapped: isButtonTapped,
      onTap: () async {
        // * Always reset App Error
        resetAppError(ref);

        // Unfocus Keyboard
        unfocusKeyboard(context);

        // * Check form and login
        if (signInFormKey.currentState!.validate()) {
          enableTap();
          await loginUser(authService, loginCredentials, signInFormKey);
        }
      },
      text: widget.label,
      // text: widget.label,
      textColor: widget.textColor,
      buttonColor: widget.color,
    );
  }

  Future<void> loginUser(
    AuthService authService,
    LoginCredentials loginCredentials,
    GlobalKey<FormState> signInFormKey,
  ) async {
    final appError = ref.watch(appErrorProvider);

    return authService
        .login(loginCredentials: loginCredentials)
        .then((_) async {
      printer('User Signed In');
      printer('Error: $appError');
      // update user so that app can go to home screen

      // disableTap();

      // Go to Home if there is no error
      if (appError == null) {
        // clear the form after sign in
        signInFormKey.currentState!.reset();

        // reset providers
        // resetAuthProviders(ref);

        // go(ref, to: homePath);
        final userId = ref.watch(userIdProvider);
        // Go to more infor page
        await UserCloudService.goToHomePage(
          userId: userId,
          ref: ref,
          beforeCall: disableTap,
        );
      }
    }).catchError((Object err) {
      // show error
      printer('Cauth Error: $err');

      // resetAuthProviders(ref);

      // disable tap
      disableTap();
    });
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
