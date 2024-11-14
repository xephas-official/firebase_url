import '../../../app_exporter.dart';

///Sign In Form
final loginFormKeyProvider =
    Provider<GlobalKey<FormState>>((_) => GlobalKey<FormState>());

/// user id provider
final userIdProvider = StateProvider<String>((ref) => '');
