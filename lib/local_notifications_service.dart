import 'dart:developer';

import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:flutter_timezone/flutter_timezone.dart';
import 'package:timezone/timezone.dart' as tz;
import 'package:timezone/data/latest.dart' as tzz;

class LocalNotificationsService {
  static FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
      FlutterLocalNotificationsPlugin();

  static onBackGroundTap(NotificationResponse notificationResponse) {}

  static onTap(NotificationResponse notificationResponse) {}

  static Future init() async {
    InitializationSettings settings = const InitializationSettings(
        iOS: DarwinInitializationSettings(),
        android: AndroidInitializationSettings("@mipmap/ic_launcher"));

    await flutterLocalNotificationsPlugin.initialize(
      settings,
      onDidReceiveBackgroundNotificationResponse: onBackGroundTap,
      onDidReceiveNotificationResponse: onTap,
    );
  }

  static void showBasicNotifications() async {
    NotificationDetails details = const NotificationDetails(
        android: AndroidNotificationDetails(
      ' id 1',
      'basic notifications',
      importance: Importance.max,
      priority: Priority.high,
    ));
    flutterLocalNotificationsPlugin.show(
        1, "basic Notifications", "basic", details);
  }

  static void showRepeatedNotifications() async {
    NotificationDetails details = const NotificationDetails(
        android: AndroidNotificationDetails(
      ' id 2',
      'repeated notifications',
      importance: Importance.max,
      priority: Priority.high,
    ));
    flutterLocalNotificationsPlugin.periodicallyShow(
      2,
      "Repeated Notifications",
      "Repeated",
      RepeatInterval.everyMinute,
      details,
    );
  }

  static void showScheduledNotifications() async {
    NotificationDetails details = const NotificationDetails(
        android: AndroidNotificationDetails(
      ' id 3',
      'Scheduled notifications',
      importance: Importance.max,
      priority: Priority.high,
    ));

    tzz.initializeTimeZones();
    final String currentTimeZone = await FlutterTimezone.getLocalTimezone();
    tz.setLocalLocation(tz.getLocation(currentTimeZone));
    log(tz.local.name);
    log("${tz.TZDateTime.now(tz.local).hour}");

    await flutterLocalNotificationsPlugin.zonedSchedule(
        3,
        "Scheduled Notifications",
        "Scheduled",
        tz.TZDateTime(tz.local, 2024, 2, 13, 18, 37),
        details,
        uiLocalNotificationDateInterpretation:
            UILocalNotificationDateInterpretation.absoluteTime);
  }

  static void cancelAllNotifications() async {
    await flutterLocalNotificationsPlugin.cancelAll();
  }

  static void cancelNotifications(int id) async {
    await flutterLocalNotificationsPlugin.cancel(id);
  }
}
