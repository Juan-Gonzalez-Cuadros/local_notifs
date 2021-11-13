import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class NotifMenu extends StatelessWidget {
  final void Function() notifSimple;
  final void Function() notifAgendada;
  final void Function() notifConImagen;
  final void Function() notifConIcono;
  final void Function() notifConAccion;
  final void Function() cancelNotifAgendada;
  NotifMenu({
    Key? key,
    required this.notifSimple,
    required this.notifAgendada,
    required this.notifConImagen,
    required this.notifConIcono,
    required this.notifConAccion,
    required this.cancelNotifAgendada,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(20),
      decoration: BoxDecoration(
        // border: Border.all(width: 1),
        boxShadow: [
          BoxShadow(
            color: Colors.grey,
            spreadRadius: 4,
            blurRadius: 6,
            offset: Offset(-2, 5), // changes position of shadow
          ),
        ],
        borderRadius: BorderRadius.all(Radius.circular(15)),
        color: Colors.blue[50],
      ),
      child: Column(
        // mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Text(
            "Notificaciones locales",
            style: TextStyle(fontSize: 24),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ActionChip(
                tooltip: "Notificacion normal",
                labelStyle: TextStyle(
                  color: Colors.grey[200],
                ),
                avatar: Icon(
                  FontAwesomeIcons.brush,
                  color: Colors.grey[200],
                ),
                label: Text("Normal"),
                backgroundColor: Colors.black87,
                onPressed: notifSimple,
              ),
              ActionChip(
                tooltip: "Notificacion con icono",
                labelStyle: TextStyle(
                  color: Colors.grey[200],
                ),
                avatar: Icon(
                  FontAwesomeIcons.icons,
                  color: Colors.grey[200],
                ),
                label: Text("Con icono"),
                backgroundColor: Colors.black87,
                onPressed: notifConIcono,
              ),
              ActionChip(
                tooltip: "Notificacion con imagen",
                labelStyle: TextStyle(
                  color: Colors.grey[200],
                ),
                avatar: Icon(
                  FontAwesomeIcons.photoVideo,
                  color: Colors.grey[200],
                ),
                label: Text("Con imagen"),
                backgroundColor: Colors.black87,
                onPressed: notifConImagen,
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ActionChip(
                tooltip: "Notificacion calendarizada",
                labelStyle: TextStyle(
                  color: Colors.grey[200],
                ),
                avatar: Icon(
                  FontAwesomeIcons.clock,
                  color: Colors.grey[200],
                ),
                label: Text("Cada Minuto"),
                backgroundColor: Colors.black87,
                onPressed: notifAgendada,
              ),
              ActionChip(
                tooltip: "Cancelar notificacion calendarizada",
                labelStyle: TextStyle(
                  color: Colors.grey[200],
                ),
                avatar: Icon(
                  FontAwesomeIcons.clock,
                  color: Colors.grey[200],
                ),
                label: Text("Cancelar"),
                backgroundColor: Colors.black87,
                onPressed: cancelNotifAgendada,
              ),
              ActionChip(
                tooltip: "Notificacion con acciones",
                labelStyle: TextStyle(
                  color: Colors.grey[200],
                ),
                avatar: Icon(
                  FontAwesomeIcons.personBooth,
                  color: Colors.grey[200],
                ),
                label: Text("Con accion"),
                backgroundColor: Colors.black87,
                onPressed: notifConAccion,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
