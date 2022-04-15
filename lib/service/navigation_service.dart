import 'package:flutter/cupertino.dart';

class NavigationService {
  final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

  Future<dynamic>? navigateTo(String routeName) {
    // navigatorKey.currentState.
    try {
      return navigatorKey.currentState?.pushNamedAndRemoveUntil(routeName, (route) => false);
      // return navigatorKey.currentState?.pushNamed(routeName);
    } catch (e) {
      // return navigatorKey.currentState?.pushNamed(routeName, (route) => false);
    }
  }

  void goBack() {
    return navigatorKey.currentState?.pop();
  }
}