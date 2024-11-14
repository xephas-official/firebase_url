import '../../app_exporter.dart';
import 'components/logout_btn.dart';
import 'components/profile_name_email.dart';

/// this is a widget showing the user profile details and logout button
class UserProfile extends ConsumerWidget {
  /// [UserProfile] constructor
  const UserProfile({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        /// go to home
        leading: BackButton(
          onPressed: () {
            // pop to home
            pop(ref);
          },
        ),
        centerTitle: true,
        title: const AppHorizontalLogo(),
        backgroundColor: appWhite,
      ),
      body: ListView(
        padding: padding16,
        children: [
          // card
          const ProfileNameEmail(),
          const Spacing(of: spacing64),

          const LogoutButton(),
          // logout
          const Spacing(of: spacing64),
        ],
      ),
    );
  }
}
