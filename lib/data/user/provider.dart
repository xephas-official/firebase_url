import 'dart:async';

import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../app_exporter.dart';

part 'provider.g.dart';

/// stream provider for the user
/// currenty logggen in user streamProvider
@Riverpod(keepAlive: true)
Stream<User?> firebaseUserStream(Ref ref) {
  return FirebaseAuth.instance.authStateChanges();
}

/// currenty loggged in user streamProvider
@Riverpod(keepAlive: true)
Stream<DocumentSnapshot<AppUser>?> appUserStream(Ref ref) {
  final firebaseUserStream = ref.watch(firebaseUserStreamProvider);
  return userStream(firebaseUserStream);
}

/// this is a stream that listens to the user object
Stream<DocumentSnapshot<AppUser>?> userStream(AsyncValue<User?> userStream) {
  // Handling the case where the user is null or not logged in
  final user = userStream.valueOrNull;

  if (user == null) {
    // Return an empty stream or null if the user is not logged in
    return Stream.value(null);
  }

  // Fetch user document from Firestore
  return usersDatabaseRef
      .doc(user.uid)
      .snapshots(includeMetadataChanges: true)
      .handleError((Object error) {
    printer('Error fetching user document: $error');
  });
}

/// returns the current user
@Riverpod(keepAlive: true)
AppUser appUser(Ref ref) {
  final userStream = ref.watch(appUserStreamProvider);

  // Manage loading and error states gracefully
  return userStream.when(
    data: (DocumentSnapshot<AppUser>? userSnapshot) {
      final snapshot = userSnapshot;

      if (snapshot == null) {
        // Return a default user or handle null case
        return AppUser.fromFirebaseUser();
      }
      return snapshot.data() ?? AppUser.fromFirebaseUser();
    },
    loading: AppUser.fromFirebaseUser,
    error: (Object error, StackTrace stack) {
      // Log the error and handle it
      printer('Error in appUser provider: $error');
      return AppUser.empty;
    },
  );
}
