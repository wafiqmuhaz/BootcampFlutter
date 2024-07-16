import 'dart:async';

// ngirimkan pesan menggunakan StreamController
class MessageStream {
  final StreamController<String> _controller = StreamController<String>();

  Stream<String> get stream => _controller.stream;

  void sendMessage(String message) {
    _controller.add(message);
  }

  void dispose() {
    _controller.close();
  }
}

// ke stream dan mencetak pesan yang diterima
class MessagePrinter {
  final MessageStream _messageStream;

  MessagePrinter(this._messageStream) {
    _messageStream.stream.listen((message) {
      print("Pesan diterima: $message");
    });
  }
}

void main() {
  print("============= SOAL 3 =============");
  // Membuat instance dari MessageStream
  MessageStream messageStream = MessageStream();

  // Membuat instance dari MessagePrinter
  MessagePrinter messagePrinter = MessagePrinter(messageStream);

  // Mengirimkan pesan
  messageStream.sendMessage("Hello, Wafiq!");
  messageStream.sendMessage("Ini menggunakan Dart Streams!");

  // Memberikan waktu untuk stream mencetak pesan sebelum menutup aplikasi
  Future.delayed(Duration(seconds: 2), () {
    messageStream.dispose();
  });
}