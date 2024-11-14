import '../../app_exporter.dart';

/// A service for interacting with the Cloud Database
class UserCloudService {
  //

  /// ? ---- Users Database Service ----
  ///This function uploads the user to cloud under the [usersDatabaseRef]
  static Future<void> uploadAppUser({required AppUser appUser}) async =>
      usersDatabaseRef
          .doc(appUser.userId)
          .set(
            appUser,
            SetOptions(merge: true),
          )
          .then((_) => printer('User uploaded successfully'));

  /// upload user on sign in incase they are new and don't exist in our database yet
  static Future<void> uploadUserOnSignIn({
    required AppUser appUser,
  }) async =>
      usersDatabaseRef.doc(appUser.userId).get().then((user) async {
        if (user.exists) {
          //user exists then just return
          return;
        } else {
          //user doesn't exist - create and upload a new user in firestore
          await uploadAppUser(appUser: appUser);
        }
      });

  /// go to the next page
  /// so check if this user has more info after fetching the user from the cloud
  /// if they do, go to the home page else go to the more info page
  static Future<void> goToHomePage({
    required String userId,
    required WidgetRef ref,
    // call back for function to call before going to the naxt page
    required VoidCallback beforeCall,
  }) async {
    return usersDatabaseRef.doc(userId).get().then((userDoc) async {
      // make before call back
      beforeCall();

      // check if the user doc exists in DB
      if (userDoc.exists) {
        final cloudUser = userDoc.data();

        // check if user is not null
        if (cloudUser == null) {
          //user doesn't exist we go to auth page
          go(ref, to: authPath);
          return;
        }

        //user exists we go to home page
        go(ref, to: homePath);
        //
      } else {
        //user doesn't exist we go to auth page
        go(ref, to: authPath);
        return;
      }
    });
  }

  /// This function deletes the user from the cloud
  static Future<void> deleteUser({required String userId}) async =>
      usersDatabaseRef.doc(userId).delete();
}
