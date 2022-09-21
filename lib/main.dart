import 'package:provider/provider.dart';
import 'package:flutter/material.dart';

import '/theming/theme_manager.dart';
import '/screen/main_page.dart';
import '/screen/splash.dart';

void main() {
  runApp(
    ChangeNotifierProvider<ThemeNotifier>(
      create: (_) => ThemeNotifier(),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<ThemeNotifier>(
      builder: (context, theme, child) => MaterialApp(
        theme: theme.getTheme(),
        title: 'Multiple Theme Demo',
        home: const LogoApp(),
        routes: <String, WidgetBuilder>{
          '/first': (BuildContext context) => const MainPage(),
        },
      ),
    );
  }
}
