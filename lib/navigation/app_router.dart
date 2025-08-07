// lib/navigation/app_router.dart
import 'package:flutter/material.dart';
import '../constants/route_names.dart';
import '../screens/auth/login_screen.dart';
import '../screens/careplan/careplan_screen.dart';
import '../screens/assessments/assessments_screen.dart';

class AppRouter {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case RouteNames.login:
        return MaterialPageRoute(
          builder: (_) => const LoginScreen(),
          settings: settings,
        );

      case RouteNames.careplan:
        return MaterialPageRoute(
          builder: (_) => const CareplanScreen(),
          settings: settings,
        );

      case RouteNames.assessments:
        return MaterialPageRoute(
          builder: (_) => const AssessmentsScreen(),
          settings: settings,
        );

      default:
        return MaterialPageRoute(
          builder: (_) => const LoginScreen(), // Default to login
          settings: settings,
        );
    }
  }
}
