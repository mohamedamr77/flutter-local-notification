import 'package:flutter/material.dart';

class NotificationDetailsScreen extends StatelessWidget {
  const NotificationDetailsScreen({super.key, required this.id, required this.body, required this.title});
  final  int? id;
  final String? body;
  final String? title;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.orange,
        title: Text("Notification Details"),centerTitle: true,),
      body: Column(
           mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text("id Notification  :$id"),
          SizedBox(height: 40,),
          Text("title Notification  :$title"),
          SizedBox(height: 40,),
          Text("body Notification  :$body"),
          SizedBox(height: 40,),
        ],
      ),
    );
  }
}
