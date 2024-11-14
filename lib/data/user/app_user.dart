import '../../app_exporter.dart';

/// [AppUser] is the model for the user of the app
class AppUser {
  /// `AppUser` constructor to capture and display user data
  AppUser({
    required this.email,
    required this.userId,
    required this.authProvider,
    required this.authProviderDisplayName,
    required this.joinedOn,
    required this.updatedAt,
    required this.profilePicUrl,
    this.displayName = '',
    this.gender = '',
  });

  /// get the user from the firebase
  factory AppUser.fromMap(Map<String, dynamic> map) {
    return AppUser(
      displayName: map['displayName'.inSnakeCase] as String? ?? '',
      gender: map['gender'] as String? ?? '',
      profilePicUrl: map['profilePicUrl'.inSnakeCase] as String? ?? '',
      email: map['email'] as String? ?? '',
      userId: map['userId'.inSnakeCase] as String? ?? '',
      authProvider: map['authProvider'.inSnakeCase] as String? ?? '',
      authProviderDisplayName:
          map['authProviderDisplayName'.inSnakeCase] as String? ?? '',
      joinedOn: map['joinedOn'.inSnakeCase] as Timestamp? ?? Timestamp.now(),
      updatedAt: map['updatedAt'.inSnakeCase] as Timestamp? ?? Timestamp.now(),
     
    );
  }

  /// get app user from firebase user
  factory AppUser.fromFirebaseUser() {
    final firebaseUser = FirebaseAuth.instance.currentUser;

    if (firebaseUser == null) {
      return AppUser.empty;
    } else {
      return AppUser(
        userId: firebaseUser.uid,
        email: firebaseUser.email ?? '',
        authProvider: firebaseUser.providerData.first.providerId,
        authProviderDisplayName:
            firebaseUser.providerData.first.displayName ?? '',
        updatedAt: Timestamp.now(),
        displayName: firebaseUser.displayName ?? '',
        joinedOn: Timestamp.now(),
        profilePicUrl: firebaseUser.photoURL ?? defaultProfilePic,
      );
    }
  }

  /// user name
  final String displayName;

  /// user email
  final String email;

  /// user gender
  final String gender;

  /// user profile picture
  final String profilePicUrl;

  /// user id
  final String userId;

  /// authentication by
  final String authProvider;

  /// authenticationProvider name
  final String authProviderDisplayName;

  ///  date joined
  final Timestamp joinedOn;

  /// updated at
  final Timestamp updatedAt;

  /// Get the first name of the app user
  String get firstName => displayName.split(' ')[0];

  // empty user static
  /// empty user
  // ignore: prefer_constructors_over_static_methods
  static AppUser get empty => AppUser(
        displayName: 'displayName',
        email: 'email',
        gender: 'gender',
        userId: 'userId',
        authProvider: 'authProvider',
        authProviderDisplayName: 'authProviderDisplayName',
        joinedOn: Timestamp.now(),
        updatedAt: Timestamp.now(),
        profilePicUrl: 'profilePicUrl',
      );

  /// getter as map
  Map<String, dynamic> get asMap => toMap();

  /// convert to map
  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{}
      ..addAll({'displayName'.inSnakeCase: displayName})
      ..addAll({'email': email})
      ..addAll({'gender': gender})
      ..addAll({'profilePicUrl'.inSnakeCase: profilePicUrl})
      ..addAll({'userId'.inSnakeCase: userId})
      ..addAll({'authProvider'.inSnakeCase: authProvider})
      ..addAll({'authProviderDisplayName'.inSnakeCase: authProviderDisplayName})
      ..addAll({'joinedOn'.inSnakeCase: joinedOn})
      ..addAll({'updatedAt'.inSnakeCase: updatedAt});

    return result;
  }
}
