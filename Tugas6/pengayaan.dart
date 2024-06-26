import 'dart:async';

// Kelas MessageStream: Mengelola pengiriman pesan melalui stream
class MessageStream {
  final StreamController<String> _controller = StreamController<String>();

  // Fungsi untuk mengirimkan pesan
  void sendMessage(String message) {
    _controller.sink.add(message);
    
  }

  // Mendapatkan stream untuk berlangganan pesan
  Stream<String> get stream => _controller.stream;

  // Fungsi untuk menutup stream ketika tidak lagi dibutuhkan
  void dispose() {
    _controller.close();
  }
}

// Kelas MessagePrinter: Mendengarkan stream dan mencetak pesan
class MessagePrinter {
  final MessageStream _messageStream;
  late StreamSubscription<String> _subscription;

  // Constructor yang menerima MessageStream dan berlangganan ke stream
  MessagePrinter(this._messageStream) {
    _subscription = _messageStream.stream.listen(_printMessage);
  }

  // Fungsi untuk mencetak pesan yang diterima dari stream
  void _printMessage(String message) {
    print("Pesan diterima: $message");
  }

  // Fungsi untuk berhenti berlangganan ketika tidak lagi dibutuhkan
  void stop() {
    _subscription.cancel();
  }
}

void main() {
  // Membuat instance dari MessageStream
  final messageStream = MessageStream();

  // Membuat instance dari MessagePrinter yang berlangganan ke MessageStream
  final messagePrinter = MessagePrinter(messageStream);

  // Mengirimkan beberapa pesan
  messageStream.sendMessage("Halo, dunia!");
  messageStream.sendMessage("Ini adalah contoh penggunaan Stream di Dart.");
  messageStream.sendMessage("Selamat belajar Dart!");

  // Berhenti berlangganan setelah beberapa waktu
  Future.delayed(Duration(seconds: 2), () {
    messagePrinter.stop();
    messageStream.dispose();
  });
}
