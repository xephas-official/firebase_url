import '../../../../app_exporter.dart';
import '../../auth/data/services/auth_service.dart';

/// this adds a product to the database
class LogoutButton extends ConsumerStatefulWidget {
  /// constructor
  const LogoutButton({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _LogoutButtonState();
}

class _LogoutButtonState extends ConsumerState<LogoutButton> {
  // istapped
  bool isButtonTapped = false;

  @override
  Widget build(BuildContext context) {
    //  auth service
    final authService = ref.watch(authServiceProvider(ref));

    return CircularProgressAppButton(
      isTapped: isButtonTapped,
      text: 'Log Out',
      onTap: () async {
        resetAppError(ref);

        enableTap();

        /// wait for futures
        await authService.logout(disableTap);
      },
      buttonColor: appRed.withOpacity(.1),
      textColor: appRed,
      tooltipTextColor: appWhite,
      icon: Icons.logout,
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
