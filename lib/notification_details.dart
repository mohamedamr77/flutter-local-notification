import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

class NotificationDetailsScreen extends StatelessWidget {
  const NotificationDetailsScreen(
      {super.key, required this.notificationResponse,});
  final NotificationResponse notificationResponse;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.orange,
        title: const Text("Notification Details"),
        centerTitle: true,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text("id Notification  :${notificationResponse.id}"),
          const SizedBox(
            height: 40,
          ),
          Text("title Notification  :${notificationResponse.payload}"),
          ]

      ),
    );
  }
}
