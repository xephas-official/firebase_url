import 'package:uuid/uuid.dart';

/// app id
const appId = 'fire_ui';

/// app name
const appName = 'Fire UI';

/// app title
const appTitle = 'Firebase Link';

/// default profile picture to show when user has not uploaded any
const String defaultProfilePic =
    'https://images.unsplash.com/photo-1604299669208-39773b6c91fa?q=80&w=2370&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D';

/// default api link
const String defaultApiLink = 'https://jsonplaceholder.typicode.com';

/// default id
 final defaultId = const Uuid().v1().replaceAll('-', '');