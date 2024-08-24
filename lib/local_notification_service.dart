import 'package:flutter_local_notifications/flutter_local_notifications.dart';

class LocalNotificationService {

  static FlutterLocalNotificationsPlugin  flutterLocalNotificationsPlugin=FlutterLocalNotificationsPlugin();

  static   Future init() async{
      InitializationSettings settings=   const InitializationSettings(
        // we  put Icon specialist for android
        android: AndroidInitializationSettings("@mipmap/ic_launcher"),
        iOS: DarwinInitializationSettings(),
      );
     flutterLocalNotificationsPlugin.initialize(
         settings,
         onDidReceiveNotificationResponse: (details) {},
         onDidReceiveBackgroundNotificationResponse: (details) { },
     );
    }
    //moamr


}