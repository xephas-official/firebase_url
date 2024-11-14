import '../../app_exporter.dart';

///This Opens the links in the browser
Future<void> linkLauncher(String link) async {
  if (await canLaunchUrl(Uri.parse(link))) {
    await launchUrl(
      Uri.parse(link),
      mode: LaunchMode.externalApplication,
    );
  } else {
    printer('Could not launch $link');
  }
}

/// this closes the phone keyboard and unforcuses it
void unfocusKeyboard(BuildContext context) {
  // Unfocus Keyboard
  final currentFocus = FocusScope.of(context);
  if (!currentFocus.hasPrimaryFocus) {
    currentFocus.unfocus();
  }
}

/// mock future
Future<void> mockFuture() async {
  await Future.delayed(twoSeconds,  () {
    printer('Mock future', isSuccess: true);
  });
}
