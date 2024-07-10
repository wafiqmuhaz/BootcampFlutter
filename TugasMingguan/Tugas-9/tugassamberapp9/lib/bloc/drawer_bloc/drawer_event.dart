// ignore_for_file: override_on_non_overriding_member

part of 'drawer_bloc.dart';

@immutable
abstract class DrawerEvent {
  const DrawerEvent();
}

class OpenDrawerEvent extends DrawerEvent {
  @override
  List<Object> get props => [];
}

class CloseDrawerEvent extends DrawerEvent {
  @override
  List<Object> get props => [];
}
