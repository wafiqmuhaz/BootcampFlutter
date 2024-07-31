part of 'network_bloc.dart';

abstract class NetworkEvent extends Equatable {
  const NetworkEvent();

  @override
  List<Object> get props => [];
}

class CheckNetworkConnectivity extends NetworkEvent {
  final ConnectivityResult result;

  const CheckNetworkConnectivity({required this.result});

  @override
  List<Object> get props => [result];
}
