import 'package:flutter/material.dart';

void main() {
  runApp(const ITSupportApp());
}

class ITSupportApp extends StatelessWidget {
  const ITSupportApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "My IT Support App",
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Color(0xFF1976D2),
        primarySwatch: Colors.blue,
        colorScheme: ColorScheme.fromSeed(seedColor: Color(0xFF1976D2)),
        appBarTheme: AppBarThemeData(
          backgroundColor: Color(0xFF1976D2),
          foregroundColor: Colors.white,
          elevation: 2,
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            elevation: 2,
            backgroundColor: Color(0xFF1976D2),
            foregroundColor: Colors.white,
            padding: EdgeInsets.symmetric(vertical: 12, horizontal: 24),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8)
            )
          )
        ),
        cardTheme: CardThemeData(
          elevation: 4,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12)
          )
        ),
        useMaterial3: true,
      ),
      supportedLocales: const [Locale("en", "")],
      home: MainNavigationScreen(),
    );
  }
}

class MainNavigationScreen extends StatefulWidget {
  const MainNavigationScreen({super.key});

  @override
  State<MainNavigationScreen> createState() => _MainNavigationScreenState();
}

class _MainNavigationScreenState extends State<MainNavigationScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold();
  }
}
