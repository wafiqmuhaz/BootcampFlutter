import 'package:equatable/equatable.dart';

import '../../model/product_model.dart';

abstract class SearchProductState extends Equatable {
  @override
  List<Object> get props => [];
}

class SearchProductInitial extends SearchProductState {}

class SearchProductLoading extends SearchProductState {}

class SearchProductLoaded extends SearchProductState {
  final List<ProductModel> products;

  SearchProductLoaded({required this.products});

  @override
  List<Object> get props => [products];
}

class SearchProductError extends SearchProductState {
  final String message;

  SearchProductError({required this.message});

  @override
  List<Object> get props => [message];
}