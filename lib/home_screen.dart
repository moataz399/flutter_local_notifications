import 'package:flutter/material.dart';
import 'package:flutter_local_notification/local_notifications_service.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
        centerTitle: true,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ListTile(
            onTap: () {
              LocalNotificationsService.showBasicNotifications();
            },
            leading: const Icon(Icons.notifications),
            title: const Text("Basic Notifications"),
            trailing: IconButton(
                onPressed: () {
                  LocalNotificationsService.cancelNotifications(0);
                },
                icon: Icon(
                  Icons.cancel,
                  color: Colors.red,
                ),),
          ),
          const SizedBox(
            height: 20,
          ),
          ListTile(
              onTap: () {
                LocalNotificationsService.showRepeatedNotifications();
              },
              leading: const Icon(Icons.notifications),
              title: const Text("Repeated Notifications"),
              trailing: IconButton(
                  onPressed: () {
                    LocalNotificationsService.cancelNotifications(1);
                  },
                  icon: Icon(
                    Icons.cancel,
                    color: Colors.red,
                  )),
          ),

          const SizedBox(
            height: 20,
          ),
          ListTile(
            onTap: () {
              LocalNotificationsService.showScheduledNotifications();
            },
            leading: const Icon(Icons.notifications),
            title: const Text("Scheduled Notifications"),
            trailing: IconButton(
                onPressed: () {
                  LocalNotificationsService.cancelNotifications(1);
                },
                icon: Icon(
                  Icons.cancel,
                  color: Colors.red,
                )),
          ),
        ],
      ),
    );
  }
}
