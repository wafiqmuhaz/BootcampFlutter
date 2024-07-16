part of 'map_bloc.dart';

abstract class MapState extends Equatable {
  const MapState();

  @override
  List<Object> get props => [];
}

class MapInitial extends MapState {}

class MarkerUpdated extends MapState {
  final List<Marker> markers;

  const MarkerUpdated(this.markers);

  @override
  List<Object> get props => [markers];
}