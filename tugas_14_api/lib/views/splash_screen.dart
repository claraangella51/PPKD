import 'dart:async';

import 'package:flutter/material.dart';
import 'package:tugas_14_api/views/char.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(const Duration(seconds: 7), () {
      if (!mounted) return;
      Navigator.of(context).pushReplacement(
        PageRouteBuilder(
          pageBuilder: (context, animation, secondaryAnimation) =>
              const GetCharAOT(),
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            return FadeTransition(opacity: animation, child: child);
          },
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          Image.asset('assets/images/aot_splash.jpg', fit: BoxFit.cover),
          DecoratedBox(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Colors.black.withValues(alpha: 0.15),
                  Colors.black.withValues(alpha: 0.5),
                  Colors.black.withValues(alpha: 0.82),
                ],
              ),
            ),
          ),
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Spacer(),
                  Text(
                    'ATTACK ON TITAN',
                    style: theme.textTheme.headlineMedium?.copyWith(
                      color: const Color(0xFFF3E9D2),
                      fontWeight: FontWeight.w900,
                      letterSpacing: 2.4,
                    ),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    'Character Archive',
                    style: theme.textTheme.titleLarge?.copyWith(
                      color: const Color(0xFFD5C4A1),
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  const SizedBox(height: 18),
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 14,
                      vertical: 10,
                    ),
                    decoration: BoxDecoration(
                      color: const Color(0xFF8C1D18).withValues(alpha: 0.85),
                      borderRadius: BorderRadius.circular(14),
                    ),
                    child: const Text(
                      'Humanity fights on beyond the walls.',
                      style: TextStyle(
                        color: Color(0xFFF8F1E3),
                        fontSize: 15,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                  const SizedBox(height: 32),
                  const LinearProgressIndicator(
                    minHeight: 5,
                    borderRadius: BorderRadius.all(Radius.circular(99)),
                  ),
                  const SizedBox(height: 12),
                  Text(
                    'Loading the scout records...',
                    style: theme.textTheme.bodyMedium?.copyWith(
                      color: const Color(0xFFF3E9D2),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
