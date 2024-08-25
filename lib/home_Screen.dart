import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutterlocalnotification/local_notification_service.dart';
import 'package:flutterlocalnotification/notification_details.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();
    // TODO: implement initState
    listenNotificationStream();
  }

  void listenNotificationStream() {
    LocalNotificationService.streamController.stream.listen(
      (notificationResponse) {
        Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => NotificationDetailsScreen(
                  id: notificationResponse.id,
                  body: notificationResponse.payload,
                  title: notificationResponse.input),
            ));
        log(notificationResponse.id.toString());
        log(notificationResponse.payload.toString());
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.orange,
        title: const Text(
          "Local Notification ",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 24,
          ),
        ),
        actions: [
          IconButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const NotificationDetailsScreen(
                        id: 1,
                        body: 'mohamed',
                        title: 'amr',
                      ),
                    ));
              },
              icon: const Icon(Icons.arrow_forward_ios))
        ],
      ),
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ListTile(
              onTap: () {
                LocalNotificationService.showBasicNotification();
              },
              leading: const Icon(Icons.notifications),
              title: const Text("Basic Notification"),
              trailing: IconButton(
                onPressed: () {
                  LocalNotificationService.cancelNotification(id: 0);
                },
                icon: const Icon(
                  Icons.notifications_off,
                  color: Colors.red,
                ),
              ),
            ),
            ListTile(
              onTap: () {
                LocalNotificationService.showRepeatedNotification();
              },
              leading: const Icon(Icons.notifications),
              title: const Text("Repeated Notification"),
              trailing: IconButton(
                onPressed: () {
                  LocalNotificationService.cancelNotification(id: 1);
                },
                icon: const Icon(
                  Icons.notifications_off,
                  color: Colors.red,
                ),
              ),
            ),
            ListTile(
              onTap: () {
                LocalNotificationService.showScheduledNotification();
              },
              leading: const Icon(Icons.notifications),
              title: const Text("Scheduled Notification"),
              trailing: IconButton(
                onPressed: () {
                  LocalNotificationService.cancelNotification(id: 1);
                },
                icon: const Icon(
                  Icons.notifications_off,
                  color: Colors.red,
                ),
              ),
            ),
            ElevatedButton(
                onPressed: () {
                  LocalNotificationService.cancelAll();
                },
                child: const Text("Cancel All")),
          ],
        ),
      ),
    );
  }
}
