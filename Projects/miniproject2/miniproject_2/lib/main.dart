import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart' as http;
import 'package:miniproject_1/bloc/cart_bloc/cart_bloc.dart';
import 'package:miniproject_1/bloc/cart_bloc/cart_event.dart';
import 'package:miniproject_1/bloc/product_bloc/product_bloc.dart';
import 'package:miniproject_1/bloc/product_bloc/product_event.dart';
import 'package:miniproject_1/routes/routers.dart';
import 'bloc/searchproduct/searchproduct_bloc.dart';
import 'bloc/user_bloc/user_bloc.dart';
import 'bloc/user_bloc/user_event.dart';
import 'services/api_service.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {

    final http.Client httpClient = http.Client();
    final ApiService apiService = ApiService(httpClient);

    //MultiBlocProvider: Menyediakan beberapa BLoC ke tree/context/setiap widget yang berhubungan.
    return MultiBlocProvider(
      providers: [
        //UserBloc: inisialisasi dengan ApiService dan LoadUserEvent.
        BlocProvider<UserBloc>(
          create: (context) => UserBloc(apiService)..add(LoadUserEvent()),
        ),
        BlocProvider<CartBloc>(
          create: (context) => CartBloc(apiService)..add(GetCartsEvent()),
        ),
        BlocProvider<ProductBloc>(
          create: (context) =>
              ProductBloc(apiService)..add(LoadProductsEvent()),
        ),
        BlocProvider(
          create: (context) => SearchProductBloc(apiService),
        ),
      ],
      child: MaterialApp.router(
        debugShowCheckedModeBanner: false,
        title: 'E-commerce App',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        routerConfig: AppRouter.shared.router,
      ),
    );
  }
}
