import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:miniproject_1/bloc/searchproduct/searchproduct_event.dart';
import 'package:miniproject_1/bloc/searchproduct/searchproduct_state.dart';

import '../../services/api_service.dart';


class SearchProductBloc extends Bloc<SearchProductEvent, SearchProductState> {
  final ApiService apiService;

  SearchProductBloc(this.apiService) : super(SearchProductInitial()) {
    on<LoadProductsEvent>((event, emit) async {
      emit(SearchProductLoading());
      try {
        final products = await apiService.fetchProducts();
        emit(SearchProductLoaded(products: products));
      } catch (e) {
        emit(SearchProductError(message: e.toString()));
      }
    });

    on<SearchProductsEvent>((event, emit) async {
      emit(SearchProductLoading());
      try {
        final products = await apiService.fetchProducts();
        final filteredProducts = products.where((product) =>
          product.title.toLowerCase().contains(event.query.toLowerCase())
        ).toList();
        emit(SearchProductLoaded(products: filteredProducts));
      } catch (e) {
        emit(SearchProductError(message: e.toString()));
      }
    });
  }
}
