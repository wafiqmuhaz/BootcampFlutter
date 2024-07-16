import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';

import '../blocs/map/map_bloc.dart';

class MapScreen extends StatelessWidget {
  const MapScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MapBloc, MapState>(
      builder: (context, state) {
        List<Marker> markers = [];
        if (state is MarkerUpdated) {
          markers = state.markers;
        }

        return Scaffold(
          body: FlutterMap(
            options: MapOptions(
              initialCenter: const LatLng(-6.921744, 107.607086),
              initialZoom: 18,
              onLongPress: (tapPosition, point) {
                context.read<MapBloc>().add(AddMarkerEvent(point));
              },
            ),
            children: [
              TileLayer(
                urlTemplate: 'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
              ),
              MarkerLayer(
                markers: markers,
              ),
            ],
          ),
        );
      },
    );
  }
}
