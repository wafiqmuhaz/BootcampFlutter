import 'package:flutter/material.dart';
import 'package:socket_io/socket_io.dart';

class AppSocketServer {
  static Server io = Server();

  void initialize() {
    io.on('connection', (client) {
      debugPrint('connection default namespace');

      client.on('msg', (data) {
        client.emit('msg', 'OK - $data');
      });
    });

    io.listen(3001);
  }
}
