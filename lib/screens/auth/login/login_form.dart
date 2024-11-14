// Project imports:
import '../../../app_exporter.dart';
import 'providers.dart';
import 'test_login.dart';

/// form to login to the app
class LoginForm extends ConsumerWidget {
  /// [LoginForm] constructor
  const LoginForm({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final loginFormKey = ref.watch(loginFormKeyProvider);

    return AutofillGroup(
      key: const ValueKey('login'),
      child: Form(
        key: loginFormKey,
        child: const Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Spacing(of: spacing8),
            // SignUpButton(),
            Spacing(of: spacing16),
            TestLoginButton(),
            Spacing(of: spacing64),
          ],
        ),
      ),
    );
  }
}
