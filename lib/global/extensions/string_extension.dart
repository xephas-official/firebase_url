/// an extension on the string class that provides a getter to convert a string to snake_case
extension StringX on String {
  /// as snake_case getter that converts a string in the formt numberOfDependants to snake_case as number_of_dependants
  /// Coverts a string to snale case so that the API can use it
  String get inSnakeCase {
    // convert the string in format "firstName" to "first_name"
    final text = replaceAllMapped(
      RegExp('(?<=[a-z])[A-Z]'),
      (match) => '_${match.group(0)}',
    ).toLowerCase();
    // then convert the string in format "first name" to "first_name"
    final snakedText = text.replaceAll(RegExp(r'[\s-]'), '_');

    return snakedText;
  }

  /// in sentence case getter that converts a string to sentence case e.g'
  /// or converts "socialProgram" to "Social Program" or "implementingAgency" to "Implementing Agency"
  String get inSentenceCase {
    // convert the string in format "firstName" to "First Name" or "socialProgram" to "Social Program"
    final text = replaceAllMapped(
      RegExp('(?<=[a-z])[A-Z]'),
      (match) => ' ${match.group(0)}',
    );

    // capitalize the first letter of the string
    final sentenceCase = text[0].toUpperCase() + text.substring(1);

    //   sentence
    return sentenceCase;
  }

  // as number but removing all commas
  /// as number getter that converts a string to a number by removing all commas
  /// e.g "1,000,000" to 1000000
  String get asNumber {
    // Remove all commas from the input so we can format it cleanly
    final number = replaceAll(',', '');

    return number;
  }

  // without dashes
  /// without dashes getter that removes all dashes from a string
  /// e.g "2021-10-10" to "20211010"
  String get withoutDashes {
    // Remove all dashes from the input so we can format it cleanly
    final text = replaceAll('-', '');

    return text;
  }

  /// converts from snake_case to sentence case
  String get toTitleCase {
    // convert the string in format "first_name" to "First Name"
    final text = split('_').map((word) {
      return word[0].toUpperCase() + word.substring(1);
    }).join(' ');

    return text;
  }

  /// remove P tages
  String get removeTags {
    return replaceAll('<p>', '').replaceAll('</p>', '');
  }

  /// splits a string by space
  List<String> get asList => split(' ');

  // sting get as lowerCase
  /// as lowerCase getter that converts a string to lowerCase
  String get inLowerCase => toLowerCase();

  // sting get as uppercase
  /// as uppercase getter that converts a string to uppercase
  String get inUpperCase => toUpperCase();

  /// as username getter that converts a string in the format "John Doe" to "johndoe"
  String get asUserName {
    // Split the name into a list of words.
    var words = split(' ');

    // Convert each word to lowercase.
    words = words.map((word) => word.toLowerCase()).toList();

    // Remove any punctuation from the words.
    words =
        words.map((word) => word.replaceAll(RegExp(r'[^\w\s]'), '')).toList();

    // Join the words back together as one string without anyspace between them
    final username = words.join();

    return username;
  }
}
