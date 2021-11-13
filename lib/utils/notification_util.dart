import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:push_notifs_o2021/utils/constants_utils.dart';

/// Notificacion basica solo texto
/// El channel debe ser igual al de la inicializacion
Future<void> showBasicNotification(int id) async {
  await AwesomeNotifications().createNotification(
    content: NotificationContent(
      id: id,
      channelKey: channelSimpleId,
      title: simpleTitle,
      body: simpleDescr,
    ),
  );
}

/// Notificacion basica con icono a la derecha
/// payload es datos que pudieramos utilizar para algo
/// El channel debe ser igual al de la inicializacion
Future<void> showLargeIconNotification(int id) async {
  await AwesomeNotifications().createNotification(
    content: NotificationContent(
      id: id,
      channelKey: channelBigPictureId,
      title: bigPictureTitle,
      body: bigPictureDescr,
      largeIcon: iconExample,
      notificationLayout: NotificationLayout.BigPicture,
      payload: {
        'token': 'jkhk23232fkdlskd304ufoem',
        'idUser': '5464sdw321',
      },
    ),
  );
}

Future<void> showBigPictureAndLargeIconNotification(int id) async {
  await AwesomeNotifications().createNotification(
    content: NotificationContent(
      id: id,
      channelKey: channelBigPictureId,
      title: bigPictureTitle,
      body: bigPictureDescr,
      largeIcon: iconExample,
      notificationLayout: NotificationLayout.BigPicture,
      payload: {'token': 'jkhk23232fkdlskd304ufoem'},
    ),
  );
}

Future<void> showBigPictureAndActionButtonsAndReplay(int id) async {
  await AwesomeNotifications().createNotification(
    content: NotificationContent(
      id: id,
      channelKey: channelBigPictureId,
      title: bigPictureTitle,
      body: bigPictureDescr,
      largeIcon: iconExample,
      notificationLayout: NotificationLayout.BigPicture,
      payload: {'token': 'notificacion con acciones'},
    ),
    actionButtons: [
      NotificationActionButton(
        key: actionOneKey,
        label: actionOneTitle,
        buttonType: ActionButtonType.InputField,
      ),
      NotificationActionButton(
        key: actionTwoKey,
        label: actionTwoTitle,
        buttonType: ActionButtonType.Default,
      ),
    ],
  );
}

Future<void> repeatMinuteNotification(int id) async {
  String localTimeZone =
      await AwesomeNotifications().getLocalTimeZoneIdentifier();

  await AwesomeNotifications().createNotification(
    content: NotificationContent(
      id: id,
      channelKey: channelScheduleId,
      title: scheduledTitle,
      body: scheduledDescr,
    ),
    schedule: NotificationInterval(
      interval: 60,
      timeZone: localTimeZone,
      repeats: true,
    ),
  );
}

Future<void> cancelAllSchedules() async {
  await AwesomeNotifications().cancelAllSchedules();
}
