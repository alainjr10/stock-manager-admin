import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:stock_manager_admin/src/utils/constants/constants.dart';
import 'package:stock_manager_admin/src/utils/extensions/extensions.dart';

class StockManCustomTheme {
  static ThemeData themeData(bool isDarkMode, BuildContext context) {
    return ThemeData(
      brightness: Brightness.dark,
      scaffoldBackgroundColor: const Color(0xff08080B),
      // isDarkMode ? const Color(0xFF222222) : Colors.white,
      useMaterial3: true,
      switchTheme: SwitchThemeData(
        trackColor: MaterialStateProperty.all(
          isDarkMode ? const Color(0xFF303330) : Colors.grey,
        ),
        thumbColor: MaterialStateProperty.all(
          kSecondaryColor,
        ),
      ),

      textTheme: Theme.of(context)
          .textTheme
          .copyWith(
            bodyMedium: GoogleFonts.poppins().copyWith(),
            bodySmall: GoogleFonts.poppins().copyWith(),
            bodyLarge: GoogleFonts.poppins().copyWith(),
            titleLarge: GoogleFonts.poppins().copyWith(),
            titleMedium: GoogleFonts.poppins().copyWith(),
            titleSmall: GoogleFonts.poppins().copyWith(),
            displayLarge: GoogleFonts.poppins().copyWith(),
            displayMedium: GoogleFonts.poppins().copyWith(),
            displaySmall: GoogleFonts.poppins().copyWith(),
            headlineLarge: GoogleFonts.poppins().copyWith(),
            headlineMedium: GoogleFonts.poppins().copyWith(),
            headlineSmall: GoogleFonts.poppins().copyWith(),
            labelLarge: GoogleFonts.poppins().copyWith(),
            labelMedium: GoogleFonts.poppins().copyWith(),
            labelSmall: GoogleFonts.poppins().copyWith(),
          )
          .apply(
            // bodyColor: isDarkMode ? Colors.white : Colors.black,
            bodyColor: const Color(0xffFBFAFB),
            displayColor: Colors.grey,
          ),
      // primaryColor: isDarkMode ? const Color(0xFF202320) : Colors.white,
      primaryColor: const Color(0xff08080B),
      indicatorColor: kPrimaryColor,
      disabledColor: Colors.grey,
      cardColor: kPrimaryColor,
      canvasColor: kPrimaryColor,
      buttonTheme: Theme.of(context).buttonTheme.copyWith(
            colorScheme: Theme.of(context).colorScheme,
            buttonColor: kSecondaryColor,
          ),
      appBarTheme: AppBarTheme.of(context).copyWith(
        systemOverlayStyle: const SystemUiOverlayStyle(
          statusBarBrightness: Brightness.dark,
          statusBarIconBrightness: Brightness.light,
          statusBarColor: Color(0xFF111113),
        ),
        backgroundColor: kPrimaryColor,
        foregroundColor: kSecondaryColor,
        elevation: 0,
        titleTextStyle: context.titleMedium.secondaryColor,
        actionsIconTheme: const IconThemeData(
          color: kSecondaryColor,
          size: 28,
          weight: 700,
        ),
      ),
      drawerTheme: DrawerTheme.of(context).copyWith(
        elevation: 0,
        backgroundColor: const Color(0xFF111113),
      ),
      iconButtonTheme: IconButtonThemeData(
        style: ButtonStyle(
          foregroundColor: MaterialStateProperty.all(
            kSecondaryColor,
          ),
          iconSize: MaterialStateProperty.all<double>(28.0),
          iconColor: MaterialStateProperty.all<Color>(
            kSecondaryColor,
          ),
        ),
      ),
      textButtonTheme: TextButtonThemeData(
        style: ButtonStyle(
          foregroundColor: MaterialStateProperty.all(
            kSecondaryColor,
          ),
          iconSize: MaterialStateProperty.all<double>(28.0),
          iconColor: MaterialStateProperty.all<Color>(
            kSecondaryColor,
          ),
        ),
      ),

      dialogTheme: DialogTheme.of(context).copyWith(
        backgroundColor: kPrimaryColor,
        titleTextStyle: context.titleMedium.secondaryColor.bold700,
        contentTextStyle: context.bodyMedium.secondaryColor,
      ),

      datePickerTheme: DatePickerTheme.of(context).copyWith(
        backgroundColor: kPrimaryColor,
        headerForegroundColor: kSecondaryColor,
      ),

      checkboxTheme: CheckboxThemeData(
        fillColor: MaterialStateProperty.resolveWith((states) {
          if (states.contains(MaterialState.disabled)) {
            return kPrimaryColor.withOpacity(0.5);
          } else if (states.contains(MaterialState.selected)) {
            return kTertiaryColor;
          }
          return kPrimaryColor;
        }),
        checkColor: MaterialStateProperty.all(
          kSecondaryColor,
        ),
        side: const BorderSide(
          color: kSecondaryColor,
          width: 0.75,
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(4),
        ),
      ),

      colorScheme: ColorScheme.fromSeed(
        seedColor: const Color(0xff03192A),
      ).copyWith(
        brightness: isDarkMode ? Brightness.dark : Brightness.light,
        primary: kPrimaryColor,
        onPrimary: kSecondaryColor,
        primaryContainer: const Color(0xff26262A),
        onPrimaryContainer: Colors.grey.shade500,
        onSurface: kSecondaryColor,
        secondary: kSecondaryColor,
        onSecondary: kPrimaryColor,
      ),
      // primaryContainer: const Color.fromRGBO(38, 38, 42, 1)),
    );
  }
}
