import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  final Function(int)? onNavigateToTab;
  
  const HomeScreen({super.key, this.onNavigateToTab});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<Appointment> _todaysAppointments = [];
  List<Appointment> _upcomingAppointments = [];
  int _pendingCount = 0;
  int _completedCount = 0;
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    _loadDashboardData();
  }

  Future<void> _loadDashboardData() async {
    setState(() {
      _isLoading = true;
    });

    try {
      await Future.delayed(const Duration(milliseconds: 500));

      _todaysAppointments = AppointmentService.instance.getTodaysAppointments();
      _upcomingAppointments = AppointmentService.instance
          .getUpcomingAppointments()
          .take(3)
          .toList();
      _completedCount = AppointmentService.instance
          .getCompletedAppointmentsCount();
      _pendingCount = AppointmentService.instance.getPendingAppointmentsCount();
    } finally {
      if (mounted) {
        setState(() {
          _isLoading = false;
        });
      }
    }
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold();
  }
}
