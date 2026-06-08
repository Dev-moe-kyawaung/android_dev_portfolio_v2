import 'package:flutter/material.dart';
import '../shared/theme/app_theme.dart';
import '../features/home/home_page.dart';

class PortfolioApp extends StatelessWidget {
  const PortfolioApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Android Dev Portfolio V2',
      theme: AppTheme.dark(),
      home: const HomePage(),
    );
  }
}
