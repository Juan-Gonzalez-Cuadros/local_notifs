import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:push_notifs_o2021/books.dart';
import 'package:push_notifs_o2021/utils/constants_utils.dart';
import 'package:push_notifs_o2021/utils/notification_util.dart';

import 'notif_menu.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    AwesomeNotifications().requestPermissionToSendNotifications().then(
          (value) => (isAllowed) {
            if (isAllowed) {
              // escuchar por notificaciones con puro texto
              AwesomeNotifications().displayedStream.listen(
                (notificationMsg) {
                  print(notificationMsg);
                },
              );

              // escuchar por notificaciones con botones
              AwesomeNotifications().actionStream.listen(
                (notificationAction) {
                  if (!StringUtils.isNullOrEmpty(
                      notificationAction.buttonKeyInput)) {
                    // respuesta de un mensaje input de texto
                    print(notificationAction);
                  } else {
                    // abrir pantalla
                    // logica para hacer algo cuando presionen boton
                    processDefaultActionReceived(notificationAction);
                  }
                },
              );
            }
          },
        );

    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      AwesomeNotifications().createNotification(
        content: NotificationContent(
          id: 0,
          channelKey: channelSimpleId,
          title: message.notification!.title,
          body: message.notification!.body,
        ),
      );
    });

    Future<void> getKey() async {
      String? token = await FirebaseMessaging.instance.getToken();
      print('token: ${token}');
    }

    getKey();
    super.initState();
  }

  void processDefaultActionReceived(ReceivedAction action) {
    print("Accion recibida >>>>>> $action");
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => Books(
          datos: action.title,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Home"),
      ),
      body: Column(
        children: [
          Expanded(
            flex: 3,
            child: CircleAvatar(
              maxRadius: 120,
              backgroundColor: Colors.black87,
              child: Image.asset(
                "assets/books.png",
                height: 120,
              ),
            ),
          ),
          Expanded(
            flex: 2,
            child: NotifMenu(
              notifSimple: () => showBasicNotification(123),
              notifConIcono: () => showLargeIconNotification(321),
              notifConImagen: () =>
                  showBigPictureAndLargeIconNotification(7410),
              notifConAccion: () =>
                  showBigPictureAndActionButtonsAndReplay(789),
              notifAgendada: () => repeatMinuteNotification(159),
              cancelNotifAgendada: () => cancelAllSchedules(),
            ),
          ),
        ],
      ),
    );
  }
}
