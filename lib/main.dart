import 'package:provider/provider.dart';
import 'package:flutter/material.dart';

import 'src/theming/theme_manager.dart';

void main() {
  runApp(
    ChangeNotifierProvider<ThemeNotifier>(
        create: (_) => ThemeNotifier(), child: const MyApp()),
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
        home: const SplashPage(),
        routes: <String, WidgetBuilder>{
          '/first': (BuildContext context) => const MainPage(),
        },
      ),
    );
  }
}

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashState();
}

class _SplashState extends State<SplashPage> {
  @override
  void initState() {
    moveToMain();
    super.initState();
  }

  moveToMain() {
    Future.delayed(const Duration(seconds: 2),
        () => Navigator.of(context).pushNamed('/first'));
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold();
  }
}

class MainPage extends StatelessWidget {
  const MainPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<ThemeNotifier>(
      builder: (context, theme, child) => Scaffold(
        appBar: AppBar(
          leading: const SizedBox.shrink(),
          title: const Text('Multiple Theme'),
          actions: [
            PopupMenuButton<int>(
              itemBuilder: (context) => [
                PopupMenuItem(
                  value: 1,
                  child: const Text('Light Theme'),
                  onTap: () => theme.setLightMode(),
                ),
                PopupMenuItem(
                  value: 2,
                  child: const Text("Dark Theme"),
                  onTap: () => theme.setDarkMode(),
                ),
                PopupMenuItem(
                  value: 3,
                  child: const Text("Red Theme"),
                  onTap: () => theme.setRedMode(),
                ),
                PopupMenuItem(
                  value: 45,
                  child: const Text("Green Theme"),
                  onTap: () => theme.setGreenMode(),
                ),
              ],
            ),
          ],
        ),
        body: Column(
          children: [
            const Text(
                "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum."),
            const SizedBox(height: 20),
            const Icon(Icons.ac_unit, size: 50),
            const SizedBox(height: 20),
            TextButton(
              onPressed: () {},
              child: const Text(
                "Test Button",
                style: TextStyle(color: Colors.white),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
