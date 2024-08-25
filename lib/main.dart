import 'package:flutter/material.dart';

import 'home_Screen.dart';
import 'local_notification_service.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await LocalNotificationService.init();
  // for android 13 and higher  line 11
  LocalNotificationService.requestPermission();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Flutter Demo',
      home: HomeScreen(),
    );
  }
}
