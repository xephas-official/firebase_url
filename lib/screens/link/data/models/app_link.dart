import 'package:firebase_url/app_exporter.dart';

/// class for the link stored in the database
class AppLink {
  /// [AppLink] constructor
  AppLink({
    required this.id,
    required this.url,
    required this.createdAt,
  });

  /// id of the link
  final String id;

  /// url of the link
  final String url;

  /// created at time of the link
  final Timestamp createdAt;

  /// map of the link

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{}
      ..addAll({'id': id})
      ..addAll({'url': url})
      ..addAll({'createdAt'.inSnakeCase: createdAt});

    return result;
  }

  /// getter as map
  Map<String, dynamic> get asMap => toMap();

  factory AppLink.fromMap(Map<String, dynamic> map) {
    return AppLink(
      id: map['id'] as String? ?? '',
      url: map['url'] as String? ?? '',
      createdAt: map['createdAt'.inSnakeCase] as Timestamp? ?? Timestamp.now(),
    );
  }

  static final empty = AppLink(
    id: '',
    url: '',
    createdAt: Timestamp.now(),
  );
}

/// default link model
final defaultAppLink = AppLink(
  id: defaultId,
  url: defaultApiLink,
  createdAt: Timestamp.now(),
);
