import 'package:flutter_local_notifications/flutter_local_notifications.dart';

class LocalNotificationService {
  static FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
      FlutterLocalNotificationsPlugin();
  static onTap(NotificationResponse notificationResponse) {}

  static Future init() async {
    InitializationSettings settings = const InitializationSettings(
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

  static void showBasicNotification() async {
    NotificationDetails details = const NotificationDetails(
      android: AndroidNotificationDetails(
        // line 27 and 28 to show notification above screen
        //delte storage before add two this line
        importance: Importance.max,
        priority: Priority.high,
        "id 1", //channel id
        "basic notification ", //cahnnel name
      ),
    );
    await flutterLocalNotificationsPlugin.show(
        0, //id
        "Basic Notification", //title
        "Body Notification", //body
        details,
        payload: "Payload Data");
  }

  static void showRepeatedNotification() async {
    NotificationDetails details = const NotificationDetails(
      android: AndroidNotificationDetails(
        // line 27 and 28 to show notification above screen
        //delte storage before add two this line
        importance: Importance.max,
        priority: Priority.high,
        "id 2", //channel id
        "Repeated notification ", //cahnnel name
      ),
    );
    await flutterLocalNotificationsPlugin.periodicallyShow(
        1, //id
        "Repeated Notification", //title
        "Repeated Body", //body
        RepeatInterval.everyMinute,
        details,
        payload: "Payload Data");
  }

  static void cancelNotification({required int id})async{
    await flutterLocalNotificationsPlugin.cancel(id);
  }

}
