// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$firebaseUserStreamHash() =>
    r'2490bded352e3aef1fc5248033c8192a93887836';

/// stream provider for the user
/// currenty logggen in user streamProvider
///
/// Copied from [firebaseUserStream].
@ProviderFor(firebaseUserStream)
final firebaseUserStreamProvider = StreamProvider<User?>.internal(
  firebaseUserStream,
  name: r'firebaseUserStreamProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$firebaseUserStreamHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef FirebaseUserStreamRef = StreamProviderRef<User?>;
String _$appUserStreamHash() => r'9f8c04b89709de98a8a85150abe72476fe4a5c4f';

/// currenty loggged in user streamProvider
///
/// Copied from [appUserStream].
@ProviderFor(appUserStream)
final appUserStreamProvider =
    StreamProvider<DocumentSnapshot<AppUser>?>.internal(
  appUserStream,
  name: r'appUserStreamProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$appUserStreamHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef AppUserStreamRef = StreamProviderRef<DocumentSnapshot<AppUser>?>;
String _$appUserHash() => r'cf9294a73ddfeb91bc0736a049be6760c99acb13';

/// returns the current user
///
/// Copied from [appUser].
@ProviderFor(appUser)
final appUserProvider = Provider<AppUser>.internal(
  appUser,
  name: r'appUserProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$appUserHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef AppUserRef = ProviderRef<AppUser>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
