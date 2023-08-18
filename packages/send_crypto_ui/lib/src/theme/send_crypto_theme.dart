import 'package:flutter/material.dart';
import 'package:send_crypto_ui/send_crypto_ui.dart';
import 'package:flutter/services.dart';

class SCTheme {

  /// Light Theme example based on Material 2 Design.
  ThemeData get lightTheme {
    return ThemeData(
      primaryColor: SCColors.skyBlue,
      canvasColor: _backgroundColor,
      scaffoldBackgroundColor: _backgroundColor,
      iconTheme: _lightIconTheme,
      appBarTheme: _lightAppBarTheme,
      dividerTheme: _dividerTheme,
      textTheme: _lightTextTheme,
      buttonTheme: _buttonTheme,
      splashColor: SCColors.transparent,
      elevatedButtonTheme: _elevatedButtonTheme,
      textButtonTheme: _textButtonTheme,
      colorScheme: _lightColorScheme,
      bottomSheetTheme: _lightBottomSheetTheme,
      listTileTheme: _listTileTheme,
      switchTheme: _switchTheme,
      progressIndicatorTheme: _progressIndicatorTheme,
      tabBarTheme: _tabBarTheme,
      bottomNavigationBarTheme: _bottomAppBarTheme,
      chipTheme: _chipTheme,
      dividerColor: SCColors.grey,
      outlinedButtonTheme: _lightOutlinedButtonTheme,
    );
  }

  /// Dark Theme example based on Material 2 Design.
  ThemeData get darkTheme => lightTheme.copyWith(
        chipTheme: _darkChipTheme,
        brightness: Brightness.dark,
        scaffoldBackgroundColor: SCColors.black,
        colorScheme: _darkColorScheme,
        appBarTheme: _darkAppBarTheme,
        disabledColor: SCColors.white.withOpacity(0.5),
        textTheme: _darkTextTheme,
        unselectedWidgetColor: SCColors.lightGrey,
        iconTheme: _darkIconTheme,
        bottomSheetTheme: _darkBottomSheetTheme,
        outlinedButtonTheme: _darkOutlinedButtonTheme,
        textButtonTheme: _darkTextButtonTheme,
      );

  /// Returns the correct color based on the current theme.
  ColorScheme get _lightColorScheme {
    return ColorScheme.light(
      primary: SCColors.skyBlue,
      primaryContainer: SCColors.lightBlue200,
      onPrimaryContainer: SCColors.oceanBlue,
      secondary: SCColors.paleSky,
      onSecondary: SCColors.white,
      secondaryContainer: SCColors.lightBlue200,
      onSecondaryContainer: SCColors.oceanBlue,
      tertiary: SCColors.secondary.shade700,
      onTertiary: SCColors.white,
      tertiaryContainer: SCColors.secondary.shade300,
      onTertiaryContainer: SCColors.secondary.shade700,
      error: SCColors.red,
      errorContainer: SCColors.red.shade200,
      onErrorContainer: SCColors.redWine,
      background: _backgroundColor,
      onBackground: SCColors.onBackground,
      surfaceVariant: SCColors.surface,
      onSurfaceVariant: SCColors.grey,
      inversePrimary: SCColors.crystalBlue,
    );
  }

  /// Returns the correct color based on the current theme.
  ColorScheme get _darkColorScheme => _lightColorScheme.copyWith(
        background: SCColors.black,
        onBackground: SCColors.white,
        surface: SCColors.black,
        onSurface: SCColors.lightGrey,
        primary: SCColors.blue,
        onPrimary: SCColors.oceanBlue,
        primaryContainer: SCColors.oceanBlue,
        onPrimaryContainer: SCColors.lightBlue200,
        secondary: SCColors.paleSky,
        onSecondary: SCColors.lightGrey,
        secondaryContainer: SCColors.liver,
        onSecondaryContainer: SCColors.brightGrey,
      );

  /// Returns the correct background color based on the current theme.
  Color get _backgroundColor => SCColors.white;

  /// Returns the correct [AppBarTheme] based on the current theme.
  AppBarTheme get _lightAppBarTheme {
    return AppBarTheme(
      iconTheme: _lightIconTheme,
      titleTextStyle: _lightTextTheme.titleMedium,
      elevation: 0,
      toolbarHeight: 64,
      backgroundColor: SCColors.white,
      toolbarTextStyle: _lightTextTheme.titleLarge,
      systemOverlayStyle: const SystemUiOverlayStyle(
        statusBarIconBrightness: Brightness.dark,
        statusBarBrightness: Brightness.light,
      ),
    );
  }

  /// Returns the correct [AppBarTheme] based on the current theme.
  AppBarTheme get _darkAppBarTheme {
    return _lightAppBarTheme.copyWith(
      backgroundColor: SCColors.grey,
      iconTheme: _darkIconTheme,
      toolbarTextStyle: _darkTextTheme.titleLarge,
      titleTextStyle: _darkTextTheme.titleMedium,
    );
  }

  /// Returns the correct [IconThemeData] based on the current theme.
  IconThemeData get _lightIconTheme {
    return const IconThemeData(
      color: SCColors.black,
    );
  }

  /// Returns the correct [IconThemeData] based on the current theme.
  IconThemeData get _darkIconTheme {
    return const IconThemeData(
      color: SCColors.white,
    );
  }

  /// Returns the correct [DividerThemeData] based on the current theme.
  DividerThemeData get _dividerTheme {
    return const DividerThemeData(
      color: SCColors.outlineLight,
      space: SCSpacing.lg,
      thickness: SCSpacing.xxxs,
      indent: SCSpacing.lg,
      endIndent: SCSpacing.lg,
    );
  }

  /// Returns the correct [TextTheme] based on the current theme.
  TextTheme get _lightTextTheme => lightUITextTheme;

  /// Returns the correct [TextTheme] based on the current theme.
  TextTheme get _darkTextTheme {
    return _lightTextTheme.apply(
      bodyColor: SCColors.white,
      displayColor: SCColors.white,
      decorationColor: SCColors.white,
    );
  }

  /// The UI text theme based on [SCTextStyle].
  static final lightUITextTheme = TextTheme(
    displayLarge: SCTextStyle.headline1,
    displayMedium: SCTextStyle.headline2,
    displaySmall: SCTextStyle.headline3,
    titleMedium: SCTextStyle.subtitle1,
    titleSmall: SCTextStyle.subtitle2,
    bodyLarge: SCTextStyle.bodyText1,
    bodyMedium: SCTextStyle.bodyText2,
    labelLarge: SCTextStyle.button,
    bodySmall: SCTextStyle.caption,
    labelSmall: SCTextStyle.overline,
  ).apply(
    bodyColor: SCColors.black,
    displayColor: SCColors.black,
    decorationColor: SCColors.black,
  );

  /// Returns the correct [ChipThemeData] based on the current theme.
  ChipThemeData get _chipTheme {
    return ChipThemeData(
      backgroundColor: SCColors.secondary.shade300,
      disabledColor: _backgroundColor,
      selectedColor: SCColors.secondary.shade700,
      secondarySelectedColor: SCColors.secondary.shade700,
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
      labelStyle: SCTextStyle.button.copyWith(color: SCColors.black),
      secondaryLabelStyle:
          SCTextStyle.labelSmall.copyWith(color: SCColors.white),
      brightness: Brightness.light,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(22),
        side: const BorderSide(),
      ),
    );
  }

  /// Returns the correct [ChipThemeData] based on the current theme.
  ChipThemeData get _darkChipTheme {
    return _chipTheme.copyWith(
      backgroundColor: SCColors.white,
      disabledColor: _backgroundColor,
      selectedColor: SCColors.secondary.shade700,
      secondarySelectedColor: SCColors.secondary.shade700,
      labelStyle: SCTextStyle.button.copyWith(
        color: SCColors.secondary.shade700,
      ),
      secondaryLabelStyle: SCTextStyle.labelSmall.copyWith(
        color: SCColors.black,
      ),
      shape: RoundedRectangleBorder(
        side: const BorderSide(color: SCColors.white, width: 2),
        borderRadius: BorderRadius.circular(22),
      ),
    );
  }

  /// Returns the correct [ButtonThemeData] based on the current theme.
  ButtonThemeData get _buttonTheme {
    return ButtonThemeData(
      textTheme: ButtonTextTheme.primary,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(SCSpacing.sm),
      ),
      padding: const EdgeInsets.symmetric(vertical: SCSpacing.lg),
      buttonColor: SCColors.blue,
      disabledColor: SCColors.lightGrey,
      height: 48,
      minWidth: 48,
    );
  }

  /// Returns the correct [ElevatedButtonThemeData] based on the current theme.
  ElevatedButtonThemeData get _elevatedButtonTheme {
    return ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(30)),
        ),
        padding: const EdgeInsets.symmetric(vertical: SCSpacing.lg),
        textStyle: _lightTextTheme.labelLarge?.copyWith(
          fontWeight: SCFontWeight.bold,
        ),
        backgroundColor: SCColors.blue,
      ),
    );
  }

  /// Returns the correct [TextButtonThemeData] based on the current theme.
  TextButtonThemeData get _textButtonTheme {
    return TextButtonThemeData(
      style: TextButton.styleFrom(
        textStyle: _lightTextTheme.labelLarge?.copyWith(
          fontWeight: SCFontWeight.light,
        ),
        foregroundColor: SCColors.black,
      ),
    );
  }

  /// Returns the correct [TextButtonThemeData] based on the current theme.
  TextButtonThemeData get _darkTextButtonTheme {
    return TextButtonThemeData(
      style: TextButton.styleFrom(
        textStyle: _lightTextTheme.labelLarge?.copyWith(
          fontWeight: SCFontWeight.light,
        ),
        foregroundColor: SCColors.white,
      ),
    );
  }

  /// Returns the correct [BottomSheetThemeData] based on the current theme.
  BottomSheetThemeData get _lightBottomSheetTheme {
    return const BottomSheetThemeData(
      backgroundColor: SCColors.modalBackground,
      clipBehavior: Clip.hardEdge,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(SCSpacing.lg),
          topRight: Radius.circular(SCSpacing.lg),
        ),
      ),
    );
  }

  /// Returns the correct [BottomSheetThemeData] based on the current theme.
  BottomSheetThemeData get _darkBottomSheetTheme {
    return _lightBottomSheetTheme.copyWith(
      backgroundColor: SCColors.grey,
    );
  }

  /// Returns the correct [ListTileThemeData] based on the current theme.
  ListTileThemeData get _listTileTheme {
    return const ListTileThemeData(
      iconColor: SCColors.onBackground,
      contentPadding: EdgeInsets.all(SCSpacing.lg),
    );
  }

  /// Returns the correct [SwitchThemeData] based on the current theme.
  SwitchThemeData get _switchTheme {
    return SwitchThemeData(
      thumbColor:
          MaterialStateProperty.resolveWith((Set<MaterialState> states) {
        if (states.contains(MaterialState.selected)) {
          return SCColors.darkAqua;
        }
        return SCColors.black;
      }),
      trackColor:
          MaterialStateProperty.resolveWith((Set<MaterialState> states) {
        if (states.contains(MaterialState.selected)) {
          return SCColors.primaryContainer;
        }
        return SCColors.paleSky;
      }),
    );
  }

  /// Returns the correct [ProgressIndicatorThemeData] based on the current
  /// theme.
  ProgressIndicatorThemeData get _progressIndicatorTheme {
    return const ProgressIndicatorThemeData(
      color: SCColors.darkAqua,
      circularTrackColor: SCColors.borderOutline,
    );
  }

  /// Returns the correct [TabBarTheme] based on the current theme.
  TabBarTheme get _tabBarTheme {
    return TabBarTheme(
      labelStyle: SCTextStyle.button,
      labelColor: SCColors.darkAqua,
      labelPadding: const EdgeInsets.symmetric(
        horizontal: SCSpacing.lg,
        vertical: SCSpacing.md + SCSpacing.xxs,
      ),
      unselectedLabelStyle: SCTextStyle.button,
      unselectedLabelColor: SCColors.mediumEmphasisSurface,
      indicator: const UnderlineTabIndicator(
        borderSide: BorderSide(
          width: 3,
          color: SCColors.darkAqua,
        ),
      ),
      indicatorSize: TabBarIndicatorSize.label,
    );
  }

  /// Returns the correct [BottomNavigationBarThemeData] based on the current
  /// theme.
  BottomNavigationBarThemeData get _bottomAppBarTheme {
    return BottomNavigationBarThemeData(
      backgroundColor: SCColors.black,
      selectedItemColor: SCColors.white,
      unselectedItemColor: SCColors.white.withOpacity(0.74),
    );
  }

  /// Returns the correct [OutlinedButtonThemeData] based on the current theme.
  OutlinedButtonThemeData get _lightOutlinedButtonTheme {
    return OutlinedButtonThemeData(
      style: ButtonStyle(
        shape: MaterialStateProperty.all(const StadiumBorder()),
        backgroundColor: MaterialStateColor.resolveWith(
          (states) => SCColors.white,
        ),
        side: MaterialStateProperty.resolveWith(
          (states) => const BorderSide(),
        ),
        padding: MaterialStateProperty.all(
          const EdgeInsets.symmetric(
            horizontal: SCSpacing.xlg,
            vertical: SCSpacing.lg,
          ),
        ),
        alignment: Alignment.center,
        textStyle: MaterialStateProperty.resolveWith(
          (states) => states.contains(MaterialState.disabled)
              ? SCTextStyle.button.copyWith(
                  color: SCColors.black,
                  fontWeight: FontWeight.w500,
                )
              : SCTextStyle.button.copyWith(
                  color: states.contains(MaterialState.disabled)
                      ? SCColors.black
                      : SCColors.white,
                  fontWeight: FontWeight.w500,
                ),
        ),
      ),
    );
  }

  /// Returns the correct [OutlinedButtonThemeData] based on the current theme.
  OutlinedButtonThemeData get _darkOutlinedButtonTheme {
    return OutlinedButtonThemeData(
      style: ButtonStyle(
        shape: MaterialStateProperty.all(const StadiumBorder()),
        backgroundColor: MaterialStateColor.resolveWith(
          (states) => SCColors.black,
        ),
        side: MaterialStateProperty.resolveWith(
          (states) => const BorderSide(color: SCColors.white),
        ),
        padding: MaterialStateProperty.all(
          const EdgeInsets.symmetric(
            horizontal: SCSpacing.xlg,
            vertical: SCSpacing.lg,
          ),
        ),
        alignment: Alignment.center,
        textStyle: MaterialStateProperty.resolveWith(
          (states) => states.contains(MaterialState.disabled)
              ? SCTextStyle.button.copyWith(
                  color: SCColors.white,
                  fontWeight: FontWeight.w500,
                )
              : SCTextStyle.button.copyWith(
                  color: states.contains(MaterialState.disabled)
                      ? SCColors.black
                      : SCColors.white,
                  fontWeight: FontWeight.w500,
                ),
        ),
      ),
    );
  }

}
