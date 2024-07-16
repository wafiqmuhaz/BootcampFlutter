import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: MateriFlutterMap(),
    );
  }
}

class MateriFlutterMap extends StatefulWidget {
  const MateriFlutterMap({super.key});

  @override
  State<MateriFlutterMap> createState() => _MateriFlutterMapState();
}

class _MateriFlutterMapState extends State<MateriFlutterMap> {
  // Marker
  List<Marker> markers = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          "Materi Flutter Map",
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.blue,
      ),
      body: FlutterMap(
        // Opsi yang dapat kita konfigurasi
        options: MapOptions(
          initialCenter: const LatLng(-6.921744, 107.607086),
          initialZoom: 18,
          onLongPress: (tapPosition, point) {
            setState(() {
              // Hapus marker terakhir
              markers.isNotEmpty ? markers.removeLast() : null;

              // Masukkan marker baru
              markers.add(
                Marker(
                  point: point,
                  child: const Icon(
                    Icons.location_on,
                    color: Colors.red,
                    size: 40,
                  ),
                ),
              );
            });
          },
        ),
        children: [
          // Selalu masukkan Tile Layer di bagian paling atas
          // karena konsepnya mirip seperti [Stack]
          TileLayer(
            // Peta yang ditampilkan
            urlTemplate: 'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
          ),
          // Marker jika ada.
          MarkerLayer(
            rotate: true,
            markers: markers,
          ),
        ],
      ),
    );
  }
}
