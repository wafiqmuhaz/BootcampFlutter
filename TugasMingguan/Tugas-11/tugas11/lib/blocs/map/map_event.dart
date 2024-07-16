part of 'map_bloc.dart';

abstract class MapEvent extends Equatable {
  const MapEvent();

  @override
  List<Object> get props => [];
}

class AddMarkerEvent extends MapEvent {
  final LatLng point;

  const AddMarkerEvent(this.point);

  @override
  List<Object> get props => [point];
}

class RemoveMarkerEvent extends MapEvent {}