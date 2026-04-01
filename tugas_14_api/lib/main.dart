import 'package:flutter/material.dart';
import 'package:tugas_14_api/views/char.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    const parchment = Color(0xFFF3E9D2);
    const wallStone = Color(0xFFD5C4A1);
    const regimentGreen = Color(0xFF2E4A3F);
    const titanBrown = Color(0xFF6B3E2E);
    const steel = Color(0xFF222222);
    const bloodAccent = Color(0xFF8C1D18);

    final colorScheme =
        ColorScheme.fromSeed(
          seedColor: regimentGreen,
          brightness: Brightness.light,
        ).copyWith(
          primary: regimentGreen,
          secondary: bloodAccent,
          tertiary: titanBrown,
          surface: parchment,
          onSurface: steel,
        );

    final baseTheme = ThemeData(
      useMaterial3: true,
      colorScheme: colorScheme,
      scaffoldBackgroundColor: parchment,
      appBarTheme: const AppBarTheme(
        backgroundColor: regimentGreen,
        foregroundColor: parchment,
        centerTitle: true,
        elevation: 0,
      ),
      cardTheme: CardThemeData(
        color: const Color(0xFFF8F1E3),
        elevation: 2,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(18),
          side: const BorderSide(color: wallStone),
        ),
      ),
      chipTheme: ChipThemeData(
        backgroundColor: wallStone,
        selectedColor: bloodAccent,
        disabledColor: wallStone.withValues(alpha: 0.4),
        secondarySelectedColor: regimentGreen,
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
        labelStyle: const TextStyle(color: steel, fontWeight: FontWeight.w600),
        secondaryLabelStyle: const TextStyle(color: parchment),
        brightness: Brightness.light,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
      ),
      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: const Color(0xFFF8F1E3),
        labelStyle: const TextStyle(
          color: regimentGreen,
          fontWeight: FontWeight.w600,
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: const BorderSide(color: wallStone),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: const BorderSide(color: wallStone),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: const BorderSide(color: titanBrown, width: 2),
        ),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: regimentGreen,
          foregroundColor: parchment,
          padding: const EdgeInsets.symmetric(vertical: 14),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(14),
          ),
          textStyle: const TextStyle(fontWeight: FontWeight.w700),
        ),
      ),
      outlinedButtonTheme: OutlinedButtonThemeData(
        style: OutlinedButton.styleFrom(
          foregroundColor: titanBrown,
          side: const BorderSide(color: titanBrown),
          padding: const EdgeInsets.symmetric(vertical: 14),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(14),
          ),
          textStyle: const TextStyle(fontWeight: FontWeight.w700),
        ),
      ),
      progressIndicatorTheme: const ProgressIndicatorThemeData(
        color: bloodAccent,
        linearTrackColor: wallStone,
      ),
      textTheme: ThemeData.light().textTheme
          .apply(bodyColor: steel, displayColor: steel)
          .copyWith(
            headlineSmall: const TextStyle(
              fontSize: 28,
              fontWeight: FontWeight.w800,
              letterSpacing: 0.3,
            ),
            titleLarge: const TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.w800,
            ),
            titleMedium: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w700,
              color: regimentGreen,
            ),
            bodyLarge: const TextStyle(fontSize: 16, height: 1.45),
            bodyMedium: const TextStyle(fontSize: 14, height: 1.4),
          ),
    );

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Attack on Titan Archive',
      theme: baseTheme,
      home: const GetCharAOT(),
    );
  }
}
