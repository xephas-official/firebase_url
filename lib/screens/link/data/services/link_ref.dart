
import '../../../../app_exporter.dart';
import '../models/app_link.dart';

/// * link database
const linkDBCollection = 'link';

/// link collection
final linkCollection =
    FirebaseFirestore.instance.collection(linkDBCollection);

/// Links to [linkDBCollection] database in cloud firestore
final linkDatabaseRef = linkCollection.withConverter<AppLink>(
  fromFirestore: (snapshot, _) => AppLink.fromMap(snapshot.data() ?? {}),
  toFirestore: (link, _) => link.asMap,
);
