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
        padding: const EdgeInsets.all(20),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        textStyle: AppTextTheme.light.titleMedium,
      ),
    ),
    outlinedButtonTheme: OutlinedButtonThemeData(
      style: OutlinedButton.styleFrom(
        padding: const EdgeInsets.all(20),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadiusGeometry.circular(12),
          side: BorderSide(color: AppColorScheme.light.outline),
        ),
        textStyle: AppTextTheme.light.titleMedium,
        foregroundColor: AppColorScheme.light.onSurface,
      ),
    ),
    inputDecorationTheme: InputDecorationTheme(
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: BorderSide(color: AppColorScheme.light.surfaceContainer),
      ),
      contentPadding: const EdgeInsets.symmetric(
        vertical: 12.5,
        horizontal: 13,
      ),
      hintStyle: AppTextTheme.light.bodyLarge?.copyWith(
        color: AppColorScheme.light.outlineVariant,
      ),
      prefixIconColor: AppColorScheme.light.outlineVariant,
      suffixIconColor: AppColorScheme.light.outlineVariant,
      filled: true,
      fillColor: AppColorScheme.light.surfaceContainer,
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
