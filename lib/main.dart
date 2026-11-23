import 'package:flutter/material.dart';
import 'package:mytoy/screens/home_screen.dart';

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
  int _currentIndex = 0;
  final List<Widget> _screens = [];

  @override
  void initState() {
    super.initState();

    _screens.addAll([
      HomeScreen(onNavigateToTab: _onTabTapped),
      BookAppointmentScreen(onAppointmentBooked: () => _onTabTapped(2),),
      const AppointmentsScreen(),
    ]);
  }

  void _onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(index: _currentIndex, children: _screens,),
      bottomNavigationBar: BottomNavigationBar(
        onTap: _onTabTapped,
        currentIndex: _currentIndex,
        type: BottomNavigationBarType.fixed,
        selectedItemColor: Theme.of(context).primaryColor,
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'HOME'),
          BottomNavigationBarItem(icon: Icon(Icons.calendar_today), label: 'BOOK'),
          BottomNavigationBarItem(icon: Icon(Icons.list), label: 'APPOINTMENTS')
        ]
      ),
    );
  }
}
