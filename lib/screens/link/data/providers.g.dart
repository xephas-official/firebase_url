// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'providers.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$linkStreamHash() => r'1a9b8a7f09f16b25174f94e87140cb81ce9e0aaf';

/// this is a stream that listens to the link object
///
/// Copied from [linkStream].
@ProviderFor(linkStream)
final linkStreamProvider = StreamProvider<QuerySnapshot<AppLink>>.internal(
  linkStream,
  name: r'linkStreamProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$linkStreamHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef LinkStreamRef = StreamProviderRef<QuerySnapshot<AppLink>>;
String _$appLinkHash() => r'bf6516a5fa3bde878291c5d735c13e0923f21459';

/// returns the current user link
///
/// Copied from [appLink].
@ProviderFor(appLink)
final appLinkProvider = Provider<AppLink>.internal(
  appLink,
  name: r'appLinkProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$appLinkHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef AppLinkRef = ProviderRef<AppLink>;
String _$linksListHash() => r'677c6776606d5aa210117ea5fed6b454f4316c02';

/// list of links in the app
///
/// Copied from [linksList].
@ProviderFor(linksList)
final linksListProvider = Provider<List<AppLink>>.internal(
  linksList,
  name: r'linksListProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$linksListHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef LinksListRef = ProviderRef<List<AppLink>>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
