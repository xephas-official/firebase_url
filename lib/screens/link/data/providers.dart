import 'dart:async';

import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../app_exporter.dart';
import 'models/app_link.dart';
import 'services/link_ref.dart';

part 'providers.g.dart';

/// this is a stream that listens to the link object
/// it automatically disposes when app is no longer in use
/// but when app is in use, it is kept alive to avoid multiple fetches from firestore
@Riverpod(keepAlive: true)
Stream<QuerySnapshot<AppLink>> linkStream(Ref ref) {
  // Fetch user document from Firestore
  return linkDatabaseRef.snapshots().handleError((Object error) {
    printer('Error fetching link document: $error');
  });
}

/// returns the current user link
@Riverpod(keepAlive: true)
AppLink appLink(Ref ref) {
  final links = ref.watch(linksListProvider);

  return links.first;
}

/// list of links in the app
@Riverpod(keepAlive: true)
List<AppLink> linksList(Ref ref) {
  final linkStream = ref.watch(linkStreamProvider);

  // Manage loading and error states gracefully
  return linkStream.when(
    data: (QuerySnapshot<AppLink>? linksSnapshot) {
      final snapshot = linksSnapshot;

      if (snapshot == null) {
        // Return a default user or handle null case
        return [];
      }
      return snapshot.docs.map((e) => e.data()).toList();
    },
    loading: () => [],
    error: (Object error, StackTrace stack) {
      // Log the error and handle it
      printer('Error in linksList provider: $error');
      return [];
    },
  );
}
