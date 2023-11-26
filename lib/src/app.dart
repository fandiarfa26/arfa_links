import 'package:arfa_links/src/presentation/controllers/dark_mode_controller.dart';
import 'package:arfa_links/src/presentation/widgets/main_screen.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class ArfaLinksApp extends ConsumerWidget {
  const ArfaLinksApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isDarkMode = ref.watch(darkModeProvider);

    final themeData = ThemeData(
      brightness: isDarkMode ? Brightness.dark : Brightness.light,
      textTheme: GoogleFonts.notoSansTextTheme(),
      colorSchemeSeed: Colors.blue,
    );

    return MaterialApp(
      themeMode: isDarkMode ? ThemeMode.dark : ThemeMode.light,
      theme: themeData,
      darkTheme: themeData,
      home: const MainScreen(),
    );
  }
}
