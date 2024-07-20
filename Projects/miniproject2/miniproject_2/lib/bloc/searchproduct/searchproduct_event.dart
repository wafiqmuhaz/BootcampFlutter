import 'package:equatable/equatable.dart';

abstract class SearchProductEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class LoadProductsEvent extends SearchProductEvent {}

class SearchProductsEvent extends SearchProductEvent {
  final String query;

  SearchProductsEvent({required this.query});

  @override
  List<Object> get props => [query];
}
