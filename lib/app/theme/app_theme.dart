import 'package:flutter/material.dart';
import 'package:flyfinder/app/theme/app_color_scheme.dart';
import 'package:flyfinder/app/theme/app_text_theme.dart';
abstract final class AppTheme {
  static final light = ThemeData(
    useMaterial3: true,
    typography: Typography.material2021(),
    textTheme: AppTextTheme.light,
    colorScheme: AppColorScheme.light,
    filledButtonTheme: FilledButtonThemeData(
      style: FilledButton.styleFrom(
        padding: const EdgeInsets.all(16),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        textStyle: AppTextTheme.light.titleMedium,
      ),
    ),
    inputDecorationTheme: InputDecorationTheme(
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: BorderSide.none,
      ),
      filled: true,
      fillColor: AppColorScheme.light.surfaceContainer,
      contentPadding: const EdgeInsets.symmetric(
        horizontal: 16,
        vertical: 12.5,
      ),
      hintStyle: AppTextTheme.light.bodyLarge?.copyWith(
        fontSize: 16,
        color: AppColorScheme.light.outlineVariant,
      ),
      prefixIconColor: AppColorScheme.light.outlineVariant,
      suffixIconColor: AppColorScheme.light.outlineVariant,
    ),
    searchBarTheme: SearchBarThemeData(
      padding: const WidgetStatePropertyAll(
        EdgeInsets.symmetric(horizontal: 12),
      ),
      elevation: const WidgetStatePropertyAll(0),
      hintStyle: WidgetStatePropertyAll(
        AppTextTheme.light.bodyLarge?.copyWith(
          color: AppColorScheme.light.outlineVariant,
        ),
      ),
      textStyle: WidgetStatePropertyAll(
        AppTextTheme.light.bodyLarge?.copyWith(fontSize: 16),
      ),
      shape: WidgetStateProperty.resolveWith<OutlinedBorder>(
        (states) {
          final focused = states.contains(WidgetState.focused);
          return RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
            side: BorderSide(
              color: focused ?  AppColorScheme.light.primary : Colors.transparent,
              width: focused ? 2 : 1,
            ),
          );
        },
      ),
    ),
  );

  static final dark = ThemeData(
    useMaterial3: true,
    typography: Typography.material2021(),
    textTheme: AppTextTheme.dark,
    colorScheme: AppColorScheme.dark,
    filledButtonTheme: FilledButtonThemeData(
      style: FilledButton.styleFrom(
        padding: const EdgeInsets.all(20),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        textStyle: AppTextTheme.dark.titleMedium,
      ),
    ),
    outlinedButtonTheme: OutlinedButtonThemeData(
      style: OutlinedButton.styleFrom(
        padding: const EdgeInsets.all(20),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadiusGeometry.circular(12),
          side: BorderSide(color: AppColorScheme.dark.outline),
        ),
        textStyle: AppTextTheme.dark.titleMedium,
        foregroundColor: AppColorScheme.dark.onSurface,
      ),
    ),
    inputDecorationTheme: InputDecorationTheme(
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: BorderSide(color: AppColorScheme.dark.outlineVariant),
      ),
      contentPadding: const EdgeInsets.symmetric(
        vertical: 12.5,
        horizontal: 13,
      ),
      hintStyle: AppTextTheme.dark.bodyLarge?.copyWith(
        color: AppColorScheme.dark.outlineVariant,
      ),
      prefixIconColor: AppColorScheme.dark.outlineVariant,
      suffixIconColor: AppColorScheme.dark.outlineVariant,
      filled: true,
      fillColor: AppColorScheme.dark.surfaceContainer,
    ),
  );
}
