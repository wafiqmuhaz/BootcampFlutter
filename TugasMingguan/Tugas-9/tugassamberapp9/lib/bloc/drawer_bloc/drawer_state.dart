// ignore_for_file: override_on_non_overriding_member

part of 'drawer_bloc.dart';

@immutable
abstract class DrawerState {}

class DrawerInitial extends DrawerState {
  @override
  List<Object> get props => [];
}

class DrawerOpen extends DrawerState {
  @override
  List<Object> get props => [];
}

class DrawerClosed extends DrawerState {
  @override
  List<Object> get props => [];
}
