import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import '../../helpers/notification_helper.dart';
import '../../helpers/socket_helper.dart';
import 'dart:convert';
import 'dart:math' as math;

part 'notification_event.dart';
part 'notification_state.dart';


// Bloc
class NotificationBloc extends Bloc<NotificationEvent, NotificationState> {
  final SocketHelper _socketHelper = SocketHelper();

  NotificationBloc() : super(NotificationInitial()) {
    _socketHelper.connectAndListen();

    on<SendNotificationEvent>((event, emit) async {

      int randColor = math.Random().nextInt(99);

      await NotificationHelper.flutterLocalNotificationsPlugin.show(
        math.Random().nextInt(99),
        "Aplikasi menampilkan Data",
        "Menampilkan data dari socket berhasil!!!",
        NotificationHelper.notificationDetails(Color(randColor)),
        payload: jsonEncode({"data": "test"}),
      );

      _socketHelper.callMsgEvent();

      _socketHelper.getResponse.listen((data) {
        emit(NotificationSent(data));
      });
    });
  }
}
