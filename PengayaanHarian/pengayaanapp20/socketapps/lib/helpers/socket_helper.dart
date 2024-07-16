import 'dart:async';
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:socket_io_client/socket_io_client.dart' as socket_io;

class SocketHelper {
  socket_io.Socket? socket;
  final _socketResponse = StreamController<String>();

  void Function(String) get addResponse => _socketResponse.sink.add;
  Stream<String> get getResponse => _socketResponse.stream;

  void connectAndListen() {
    socket?.close();

    socket = socket_io.io(
      'http://localhost:3001',
      socket_io.OptionBuilder().setTransports(['websocket']).build(),
    );

    socket?.onConnect((_) => debugPrint('Socket Connected'));
    socket?.on('msg', (data) {
      addResponse(data);
    });
    socket?.onDisconnect((_) => debugPrint('disconnect'));
  }

  void callMsgEvent() {
    socket?.emit('msg', 'Data dari event ${Random().nextInt(999)}');
  }

  void dispose() {
    socket?.close();
    _socketResponse.close();
  }
}
