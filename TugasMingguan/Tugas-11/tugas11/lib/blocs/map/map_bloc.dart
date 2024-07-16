import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';

part 'map_event.dart';
part 'map_state.dart';


class MapBloc extends Bloc<MapEvent, MapState> {
  List<Marker> markers = [];

  MapBloc() : super(MapInitial()) {
    on<AddMarkerEvent>((event, emit) {
      markers.add(
        Marker(
          point: event.point,
          child: const Icon(
            Icons.location_on,
            color: Colors.red,
            size: 40,
          ),
        ),
      );
      emit(MarkerUpdated(markers));
    });

    on<RemoveMarkerEvent>((event, emit) {
      if (markers.isNotEmpty) markers.removeLast();
      emit(MarkerUpdated(markers));
    });
  }
}
