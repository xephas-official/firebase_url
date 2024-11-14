import '../../../../app_exporter.dart';
import '../models/app_link.dart';
import 'link_ref.dart';

/// This service is responsible for fetching shop data from the Firestore database.
class LinkService {
  /// ? ---- Biz Database Service ----
  ///This function uploads the user to cloud under the [usersDatabaseRef]
  static Future<void> uploadLink({
    required AppLink link,
    required WidgetRef ref,
  }) async =>
      linkDatabaseRef
          .doc(link.id)
          .set(
            link,
            SetOptions(merge: true),
          )
          .then((_) async {
        printer('Link uploaded successfully');
      });
}
