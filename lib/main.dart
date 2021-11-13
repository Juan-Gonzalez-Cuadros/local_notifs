import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:push_notifs_o2021/home/home_page.dart';

import 'utils/constants_utils.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  AwesomeNotifications().initialize('resource://drawable/res_app_icon', [
    // Your notification channels go here
    NotificationChannel(
      channelKey: channelBigPictureId,
      channelName: channelBigPictureName,
      channelDescription: channelBigPictureDescr,
      defaultColor: Colors.purple,
      ledColor: Colors.yellow,
      importance: NotificationImportance.High,
    ),
  ]);

  // Create the initialization for your desired push service here
  FirebaseApp firebaseApp = await Firebase.initializeApp();
  FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);

  await initLocalNotifications();
  runApp(MyApp());
}

// Declared as global, outside of any class
Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  // If you're going to use other Firebase services in the background, such as Firestore,
  // make sure you call `initializeApp` before using other Firebase services.
  await Firebase.initializeApp();

  print("Handling a background message: ${message.messageId}");

  // Use this method to automatically convert the push data, in case you gonna use our data standard
  AwesomeNotifications().createNotificationFromJsonData(message.data);
}

Future initLocalNotifications() async {
  // inicializar los canales
  await AwesomeNotifications().initialize(
    null,
    [
      NotificationChannel(
        channelKey: channelSimpleId,
        channelName: channelSimpleName,
        channelDescription: channelSimpleDescr,
        defaultColor: Colors.purple,
        ledColor: Colors.blue,
        importance: NotificationImportance.Default,
      ),
      NotificationChannel(
        channelKey: channelBigPictureId,
        channelName: channelBigPictureName,
        channelDescription: channelBigPictureDescr,
        defaultColor: Colors.purple,
        ledColor: Colors.yellow,
        importance: NotificationImportance.High,
      ),
      NotificationChannel(
        channelKey: channelScheduleId,
        channelName: channelScheduleName,
        channelDescription: channelScheduleDescr,
        defaultColor: Colors.purple,
        ledColor: Colors.red,
        importance: NotificationImportance.Default,
      ),
    ],
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.from(
        colorScheme: ColorScheme(
          primary: Colors.indigo,
          primaryVariant: Colors.indigoAccent,
          secondary: Colors.green,
          secondaryVariant: Colors.lime,
          surface: Colors.grey[200]!,
          background: Colors.grey[200]!,
          // background: Colors.deepPurple[100]!,
          error: Colors.red,
          onPrimary: Colors.white,
          onSecondary: Colors.white,
          onSurface: Colors.grey,
          onBackground: Colors.deepPurple[100]!,
          onError: Colors.red,
          brightness: Brightness.light,
        ),
      ),
      home: HomePage(),
    );
  }
}
