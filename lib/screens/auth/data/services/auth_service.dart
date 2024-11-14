import 'dart:async';

import '../../../../app_exporter.dart';
import '../../../../data/user/user_cloud_service.dart';
import '../../login/providers.dart';
import '../models/auth_credentials.dart';
import 'auth_error_handler.dart';

/// a provider for the HTTP Service used by the app
final authServiceProvider =
    Provider.family<AuthService, WidgetRef>((ref, widgetRef) {
  return AuthService(widgetRef);
});

/// this is the service responsible for authentication
class AuthService {
  /// [AuthService] constructor
  AuthService(this.ref);

  /// riverpod reference for this app
  final WidgetRef ref;

  ///* sign up user
  Future<void> signUp({
    required SignUpCredentials signUpCredentials,
    bool isMock = false,
  }) async {
    final email = signUpCredentials.email;
    final password = signUpCredentials.password;

    try {
      await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: password)
          .then(
            (userCredential) async => uploadUserToCloud(
              userCredential: userCredential,
              authMethod: 'email_password',
              isSignUp: true,
            ),
          );
    } on FirebaseAuthException catch (e) {
      checkExceptionAndUpdate(
        firebaseAuthException: e,
        ref: ref,
        password: password,
        email: email,
      );
    } catch (e) {
      /// update auth error
      ref.read(appErrorProvider.notifier).state = AppError.fromString(
        'Error Signing In. Try Again.\nError Code: $e',
      );
    }
  }

  ///* login user
  Future<void> login({
    required LoginCredentials loginCredentials,
  }) async {
    final email = loginCredentials.email;
    final password = loginCredentials.password;

    try {
      await FirebaseAuth.instance
          .signInWithEmailAndPassword(
            email: email,
            password: password,
          )
          .then(
            (userCredential) async => uploadUserToCloud(
              userCredential: userCredential,
              authMethod: 'email_password',
              isSignUp: false,
            ),
          );

      /// Do any Logic like updating the number of sign in times here
    } on FirebaseAuthException catch (e) {
      checkExceptionAndUpdate(
        firebaseAuthException: e,
        ref: ref,
        email: email,
        password: password,
      );
    } catch (e) {
      /// update auth error
      ref.read(appErrorProvider.notifier).state = AppError.fromString(
        'Error Signing In. Try Again.\nError Code: $e',
      );
    }
  }

  /// * Upload User to Cloud after Auth to store their credentials in our database
  Future<void> uploadUserToCloud({
    required UserCredential userCredential,
    required String authMethod,
    required bool isSignUp,
    bool isGoogleAuth = false,
  }) async {
    final user = userCredential.user;
    if (user != null) {
      final appUser = AppUser(
        email: user.email ?? '-',
        profilePicUrl: user.photoURL ?? defaultProfilePic,
        userId: user.uid,
        authProvider: user.providerData[0].providerId,
        authProviderDisplayName:
            user.providerData[0].displayName ?? 'Email Only',
        joinedOn: Timestamp.now(),
        updatedAt: Timestamp.now(),
        // * we will get the date of birth and currency from the user later
        displayName: user.displayName ?? '',
      );

      /// reload the user
      await user.reload().then(
        (_) async {
          //? wait for futures ...

          // * update userId riverpod provider, so we use it in more info
          ref.read(userIdProvider.notifier).state = user.uid;

          printer('User: ${ref.watch(userIdProvider)}');

          await Future.wait(
            isSignUp
                ? [
                    /// Upload User
                    UserCloudService.uploadAppUser(appUser: appUser),
                  ]
                : [
                    /// upload user to database
                    UserCloudService.uploadUserOnSignIn(appUser: appUser),
                  ],
          );
        },
      );
    }
  }

  /// * Logout User
  Future<void> logout(VoidCallback afterCall) {
    return Future.wait([
      FirebaseAuth.instance.signOut(),
    ]).then((_) {
      printer('User Signed Out .... ', isSuccess: true);

      /// disable tap
      afterCall();

      /// check go to home
      go(ref, to: authPath);
    });
  }
}
