import 'dart:async';

import '../../app_exporter.dart';

/// API error text shown when their is an error in the API call
/// it also disposes itself
class APIErrorText extends ConsumerStatefulWidget {
  /// [APIErrorText] constructor
  const APIErrorText({
    super.key,
  });

  @override
  ConsumerState<APIErrorText> createState() => _APIErrorTextState();
}

class _APIErrorTextState extends ConsumerState<APIErrorText> {
  @override
  Widget build(BuildContext context) {
    final appError = ref.watch(appErrorProvider);

    printer('APIErrorText: $appError');

    // is empty signifies no error
    final isError = appError != null;

    // this is the error text that will be displayed in a red transparent like container
    return Builder(
      builder: (context) {
        // Start the timer to hide the widget after 5 seconds
        Future.delayed(apiErrorSeconds, () {
          if (mounted) {
            ref.read(appErrorProvider.notifier).state = null;
          }
        });

        return AnimatedSwitcher(
          duration: quarterSeconds,
          reverseDuration: twoSeconds,
          switchInCurve: Curves.easeIn,
          switchOutCurve: Curves.easeOut,
          child: isError
              ? Container(
                  width: double.infinity,
                  // this is to add a little padding to the error text from the bottom
                  margin: verticalPadding4,
                  decoration: const BoxDecoration(
                    color: errorColor,
                    borderRadius: borderRadius8,
                  ),
                  padding: padding8,
                  child: BoldTitleWithDescription(
                    boldTitle: BoldTitle(
                      title: 'Oops! an error occured!'.inUpperCase,
                      fontSize: 18,
                      color: appWhite,
                    ),
                    color: appWhite,
                    description: appError.errorString,
                  ),
                )
              : const EmptySpace(),
        );
      },
    );
  }
}

/// app error class that will be used to show the error message
class AppError {
  /// Constructor
  const AppError({
    required this.message,
    this.errors,
  });

  /// Factory constructor from Map
  factory AppError.fromMap(Map<String, dynamic> map) {
    final errors = map['errors'];

    // Handle errors as either Map<String, dynamic> or Map<String, List<dynamic>>?
    var parsedErrors = <String, List<dynamic>>{};

    if (errors != null && errors is Map<String, dynamic>) {
      // Convert dynamic values to List<dynamic> if they are not already
      parsedErrors = errors.map((key, value) {
        // if value is a list, return the key and value as is
        if (value is List<dynamic>) {
          return MapEntry(key, value);
        }
        // else, convert the value to a list and return the key and value
        else {
          return MapEntry(key, [value]);
        }
      });
    }

    return AppError(
      message: map['message'] as String? ?? '',
      errors: parsedErrors.isNotEmpty ? parsedErrors : null,
    );
  }

  /// Gets the error from a string
  static AppError? fromString(String message) {
    // Check if this string is empty
    if (message.isEmpty) {
      return null;
    } else {
      // Get this message and for every point of \n, split it into a list with •
      final errorList =
          message.split('\n').map((e) => e.isEmpty ? '' : '• $e').join('\n');

      return AppError(message: errorList);
    }
  }

  /// Message
  final String message;

  /// Errors map
  final Map<String, List<dynamic>>? errors;

  /// Getter errorText from the errors map
  String get errorText {
    final errorsMap = errors;

    if (errorsMap != null && errorsMap.isNotEmpty) {
      // Combine all error messages into a single string
      return errorsMap.entries.map((entry) {
        // Convert each entry value list to a string and join with a comma
        final value = entry.value.join(', ');
        // Return the key and combined value as a single string
        return '• ${entry.key.toTitleCase}: $value';
      }).join('\n');
    } else {
      return '';
    }
  }

  /// Error string
  String get errorString {
    return errorText.isNotEmpty ? '• $message\n$errorText' : message;
  }

  /// Convert to map
  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{}..addAll({'message': message});
    return result;
  }

  @override
  String toString() => 'AppError(message: $message, errors: $errorText)';
}

/// auth error text provider
final appErrorProvider = StateProvider<AppError?>((_) => null);

/// reset api provider
void resetAppError(WidgetRef ref) {
  ref.read(appErrorProvider.notifier).state = null;
}
