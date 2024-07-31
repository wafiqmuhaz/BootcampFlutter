import 'package:permission_handler/permission_handler.dart';

import 'presentation/blocs/admin_home/admin_home_bloc.dart';
import 'presentation/blocs/cart/cart_bloc.dart';
import 'presentation/blocs/images/images_cubit.dart';
import 'presentation/blocs/network/network_bloc.dart';
import 'presentation/blocs/purchase/purchase_bloc.dart';
import 'presentation/blocs/stripe/stripe_bloc.dart';
// import 'package:flutter_stripe/flutter_stripe.dart';

import 'config/routes/router.dart';
import 'core/constants/colors.dart';
import 'core/constants/keys.dart';
import 'firebase_options.dart';
import 'presentation/blocs/product_details/product_details_bloc.dart';
import 'presentation/blocs/admin_tools/add_category/add_category_bloc.dart';
import 'presentation/blocs/admin_tools/add_product/add_product_bloc.dart';
import 'presentation/blocs/admin_tools/category/category_bloc.dart';
import 'presentation/blocs/admin_tools/product/product_bloc.dart';
import 'presentation/blocs/admin_tools/users/users_bloc.dart';
import 'package:firebase_core/firebase_core.dart';
import 'core/services/service_locator.dart' as locator;
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'presentation/blocs/auth/auth_bloc.dart';
import 'presentation/blocs/forgot_password/forgot_password_bloc.dart';
import 'presentation/blocs/sign_in/sign_in_bloc.dart';
import 'presentation/blocs/sign_up/sign_up_bloc.dart';
import 'presentation/blocs/user_home/user_home_bloc.dart';

void main() async {
  // initialize Flutter Binding
  WidgetsFlutterBinding.ensureInitialized();
  // initialize firebase
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  // initialize dependency injection
  await locator.serviceLocator();

  var status = await Permission.storage.status;
  if (!status.isGranted) {
    // Meminta izin jika belum diberikan
    if (await Permission.storage.request().isDenied) {
      // Jika pengguna menolak permintaan izin
      print('Izin membaca penyimpanan eksternal ditolak');
      return;
    }
  }

  // initialize stripe publishable key
  // Stripe.publishableKey = AppKeys.STRIPE_TEST_PUBLISHABLE_KEY;
  // await Stripe.instance.applySettings();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<SignUpBloc>(
          create: (context) => locator.sl<SignUpBloc>(),
        ),
        BlocProvider<SignInBloc>(
          create: (context) => locator.sl<SignInBloc>(),
        ),
        BlocProvider<AuthBloc>(
          create: (context) => locator.sl<AuthBloc>(),
        ),
        BlocProvider<ForgotPasswordBloc>(
          create: (context) => locator.sl<ForgotPasswordBloc>(),
        ),
        BlocProvider<AdminHomeBloc>(
          create: (context) => locator.sl<AdminHomeBloc>(),
        ),
        BlocProvider<AddCategoryBloc>(
          create: (context) => locator.sl<AddCategoryBloc>(),
        ),
        BlocProvider<CategoryBloc>(
          create: (context) =>
              locator.sl<CategoryBloc>()..add(GetAllCategoriesEvent()),
        ),
        BlocProvider<AddProductBloc>(
          create: (context) => locator.sl<AddProductBloc>(),
        ),
        BlocProvider<ProductBloc>(
          create: (context) =>
              locator.sl<ProductBloc>()..add(GetAllProductsEvent()),
        ),
        BlocProvider<UsersBloc>(
          create: (context) => locator.sl<UsersBloc>()..add(GetAllUsersEvent()),
        ),
        BlocProvider<UserHomeBloc>(
          create: (context) => locator.sl<UserHomeBloc>(),
        ),
        BlocProvider<ProductDetailsBloc>(
          create: (context) => locator.sl<ProductDetailsBloc>(),
        ),
        BlocProvider<CartBloc>(
          create: (context) => locator.sl<CartBloc>(),
        ),
        BlocProvider<StripeBloc>(
          create: (context) => locator.sl<StripeBloc>(),
        ),
        BlocProvider<PurchaseBloc>(
          create: (context) => locator.sl<PurchaseBloc>(),
        ),
        BlocProvider<NetworkBloc>(
          create: (context) => locator.sl<NetworkBloc>(),
        ),
        BlocProvider<ImagesCubit>(
          create: (BuildContext context) => ImagesCubit(),
        ),
      ],
      child: MaterialApp.router(
        title: 'SanberShop',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          brightness: Brightness.light,
          scaffoldBackgroundColor: AppColors.primary,
          appBarTheme: const AppBarTheme(
            backgroundColor: AppColors.primary,
          ),
          bottomNavigationBarTheme: const BottomNavigationBarThemeData(
            backgroundColor: AppColors.primary,
          ),
          textSelectionTheme: const TextSelectionThemeData(
            cursorColor: AppColors.secondary,
            selectionHandleColor: AppColors.secondary,
          ),
          useMaterial3: true,
          fontFamily: 'Poppins',
        ),
        routerConfig: goRouter,
      ),
    );
  }
}
