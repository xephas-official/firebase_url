import '../../app_exporter.dart';

/// ? ---- Users Database ----
const usersDatabasePath = 'users';

/// firestore instance
final firestoreInstance = FirebaseFirestore.instance;

///  user collection
final userCollection = firestoreInstance.collection(usersDatabasePath);

/// Links to [usersDatabasePath] database in cloud firestore
final usersDatabaseRef = userCollection.withConverter<AppUser>(
  fromFirestore: (userSnapshot, _) {
    final snapshotData = userSnapshot.data();

    if (snapshotData == null) {
      // Return a default user or handle null case
      return AppUser.fromFirebaseUser();
    }
    return AppUser.fromMap(snapshotData);
  },
  toFirestore: (appUser, _) => appUser.asMap,
);
