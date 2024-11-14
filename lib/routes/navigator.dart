import '../app_exporter.dart';

///This function navigates to the given screen
void push(
  WidgetRef ref, {
  required String to,
  Object? extra,
}) {
  ref.read(goRouterProvider).push(to, extra: extra);
}


/// go [to] a given route  and remove all the previous routes
void go(WidgetRef ref, {required String to}) {
  ref.read(goRouterProvider).go(to);
}

///This function navigates [to] the given screen
void pushReplacement(
  WidgetRef ref, {
  required String to,
  Object? extra,
}) {
  ref.read(goRouterProvider).pushReplacement(to, extra: extra);
}

/// can pop, which returns true if the current route can pop
bool canPop(WidgetRef ref) {
  return ref.read(goRouterProvider).canPop();
}

///This function navigates to the previous screen
void pop(WidgetRef ref) {
  // check if we can pop
  if (canPop(ref)) ref.read(goRouterProvider).pop();
}

/// pop all the routes
/// this is best used for scenarios where we used OpenContainer for navigation and we want to pop all its instances till the last page
void popUntil(BuildContext context, {required String to}) {
  Navigator.popUntil(context, ModalRoute.withName(to));
}

///This function navigates to the previous screen
///with default navigator and context
/// ! `only use this if the route we are popping back to was navigated using [OpenRoute]`
void popWithContext(BuildContext context) {
  Navigator.pop(context);
}
