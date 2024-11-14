import 'package:google_fonts/google_fonts.dart';

import '../../app_exporter.dart';

///* this provides the default theme for the app
final appThemeProvider = Provider<ThemeData>((ref) {
  return AppTheme.light;
});

/// font
final appFontFamily = baseFont.fontFamily;

/// This is the default theme for the app
class AppTheme {
  /// light theme
  static ThemeData get light {
    // text theme
    final textTheme = ThemeData.light().textTheme;

    const textStyleFunction = GoogleFonts.montserrat;

    return ThemeData(
      useMaterial3: true,
      brightness: Brightness.light,
      colorSchemeSeed: caribbeanGreen,


      scaffoldBackgroundColor: appWhite,

      //* -- Visual Density
      visualDensity: VisualDensity.adaptivePlatformDensity,

      //* -- Appbar
      appBarTheme: AppBarTheme(
        centerTitle: false,
        elevation: 0,
        scrolledUnderElevation: 0,
        foregroundColor: appBlack,
        backgroundColor: appWhite,
        titleTextStyle: boldTextStyle.copyWith(
          fontSize: 18,
          color: appBlack,
        ),
      ),

      //* -- tooltip
      tooltipTheme: const TooltipThemeData(
        textStyle: TextStyle(color: appWhite),
        decoration: BoxDecoration(
          color: appDarkColor,
          borderRadius: borderRadius4,
        ),
      ),

      //* -- text button
      textButtonTheme: TextButtonThemeData(
        style: ButtonStyle(
          padding: WidgetStateProperty.all(
            padding16,
          ),
        ),
      ),

      //* Text Theme
      textTheme: TextTheme(
        displayLarge: textStyleFunction(textStyle: textTheme.displayLarge),
        displayMedium: textStyleFunction(textStyle: textTheme.displayMedium),
        displaySmall: textStyleFunction(textStyle: textTheme.displaySmall),
        headlineLarge: textStyleFunction(textStyle: textTheme.headlineLarge),
        headlineMedium: textStyleFunction(textStyle: textTheme.headlineMedium),
        headlineSmall: textStyleFunction(textStyle: textTheme.headlineSmall),
        titleLarge: textStyleFunction(textStyle: textTheme.titleLarge),
        titleMedium: textStyleFunction(textStyle: textTheme.titleMedium),
        titleSmall: textStyleFunction(textStyle: textTheme.titleSmall),
        bodyLarge: textStyleFunction(textStyle: textTheme.bodyLarge),
        bodyMedium: textStyleFunction(textStyle: textTheme.bodyMedium),
        bodySmall: textStyleFunction(textStyle: textTheme.bodySmall),
        labelLarge: textStyleFunction(textStyle: textTheme.labelLarge),
        labelMedium: textStyleFunction(textStyle: textTheme.labelMedium),
        labelSmall: textStyleFunction(textStyle: textTheme.labelSmall),
      ),
    );
  }
}
