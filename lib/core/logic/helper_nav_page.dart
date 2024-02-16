import 'package:flutter/material.dart';

final navigatorKey = GlobalKey<NavigatorState>();

void ToNavigator(Widget page) {
  Navigator.push(
    navigatorKey.currentContext!,
    MaterialPageRoute(builder: (context) => page
    ),
  );
}
void Showmassage(String mes){
  ScaffoldMessenger.of(navigatorKey.currentContext!).showSnackBar(SnackBar(content: Text(mes)));
}
