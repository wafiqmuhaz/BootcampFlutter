part of 'notification_bloc.dart';

// States
abstract class NotificationState extends Equatable {
  const NotificationState();

  @override
  List<Object> get props => [];
}

class NotificationInitial extends NotificationState {}

class NotificationSent extends NotificationState {
  final String data;

  const NotificationSent(this.data);

  @override
  List<Object> get props => [data];
}