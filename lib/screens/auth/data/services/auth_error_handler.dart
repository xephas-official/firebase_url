import '../../../../app_exporter.dart';

///This function checks thru all errors and updates the error provider widget
void checkExceptionAndUpdate({
  required FirebaseAuthException firebaseAuthException,
  required WidgetRef ref,
  String? password,
  String? email,
}) {
  /// covert the above if-else to switch
  switch (firebaseAuthException.code) {
    case 'weak-password':
      ref.read(appErrorProvider.notifier).state = AppError.fromString(
        'Your Password ($password) is too weak.\nTry Again with a Stronger Password.',
      );
    case 'email-already-in-use':
      ref.read(appErrorProvider.notifier).state = AppError.fromString(
        'Email ($email) is already in use.\nTry Again with a different Email.',
      );
    case 'invalid-email':
      ref.read(appErrorProvider.notifier).state =
          AppError.fromString('Invalid Email ($email) Try Again.');
    case 'operation-not-allowed':
      ref.read(appErrorProvider.notifier).state = AppError.fromString(
        'Email/Password Accounts are not enabled.\nTry Again Later.',
      );
    case 'account-exists-with-different-credential':
      ref.read(appErrorProvider.notifier).state = AppError.fromString(
        'Your account already exists with a different credential.\nSign In Instead of using Google Sign In.',
      );
    case 'user-not-found':
      ref.read(appErrorProvider.notifier).state = AppError.fromString(
        'No Account found for your Email ($email)\nSign Up Instead.',
      );

    case 'wrong-password':
      ref.read(appErrorProvider.notifier).state = AppError.fromString(
        'Wrong password! ($password) Try Again.\nForgot Password?\nClick Forgot Password to reset it.',
      );
    case 'user-disabled':
      ref.read(appErrorProvider.notifier).state = AppError.fromString(
        'Your Account has been disabled.\nContact Support.',
      );
    case 'too-many-requests':
      ref.read(appErrorProvider.notifier).state =
          AppError.fromString('Too many requests. Try again later.');
    case 'requires-recent-login':
      ref.read(appErrorProvider.notifier).state = AppError.fromString(
        'This operation is sensitive and requires recent authentication. Log in again before retrying this request.',
      );
    case 'invalid-credential':
      ref.read(appErrorProvider.notifier).state =
          AppError.fromString('Invalid Credentials.\nTry Again.');
    case 'ERROR_MISSING_GOOGLE_AUTH_TOKEN':
      ref.read(appErrorProvider.notifier).state =
          AppError.fromString('Missing Google Auth Token.\nTry Again.');
    default:
      ref.read(appErrorProvider.notifier).state = AppError.fromString(
        'Error Authenticating. Try Again.\nError Code: ${firebaseAuthException.code}',
      );
  }
}
