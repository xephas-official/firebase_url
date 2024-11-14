import 'package:firebase_url/firebase_options.dart';

import 'app_exporter.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // *  firebase initialization
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  runApp(
    ProviderScope(
      // comment this to disable the app state observer, which just shows state management logs
      observers: [AppStateObserver()],
      child: FireUrl(),
    ),
  );
}
