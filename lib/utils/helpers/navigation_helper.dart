// lib/utils/navigation_helper.dart
import 'package:flutter/material.dart';
import 'package:flutter_application_1/constants/route_names.dart';

class NavigationHelper {
  // Navigate to specific screens
  static void goToLogin(BuildContext context) {
    Navigator.pushNamedAndRemoveUntil(
      context,
      RouteNames.login,
      (route) => false, // Remove all previous routes
    );
  }

  static void goToCareplan(BuildContext context) {
    Navigator.pushReplacementNamed(context, RouteNames.careplan);
  }

  static void goToAssessments(BuildContext context) {
    Navigator.pushNamed(context, RouteNames.assessments);
  }

  // Go back
  static void goBack(BuildContext context) {
    Navigator.pop(context);
  }
}
