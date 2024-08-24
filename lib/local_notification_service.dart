import 'package:flutter_local_notifications/flutter_local_notifications.dart';

class LocalNotificationService {

  static FlutterLocalNotificationsPlugin  flutterLocalNotificationsPlugin=FlutterLocalNotificationsPlugin();
     static onTap (NotificationResponse notificationResponse) { }

  static   Future init() async{
      InitializationSettings settings=   const InitializationSettings(
        // we  put Icon specialist for android
        android: AndroidInitializationSettings("@mipmap/ic_launcher"),
        iOS: DarwinInitializationSettings(),
      );
     flutterLocalNotificationsPlugin.initialize(
         settings,
         onDidReceiveNotificationResponse: onTap,
         onDidReceiveBackgroundNotificationResponse: onTap,
     );
    }

    //Basic notification

    static void showBasicNotification()async{
    NotificationDetails details= const NotificationDetails(
      android: AndroidNotificationDetails(
           "id 1",
           "basic notification ",
      ),
    );
    await  flutterLocalNotificationsPlugin.show(0, "Basic Notification", "Body Notification", details);
     }


}