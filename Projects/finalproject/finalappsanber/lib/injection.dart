import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:get_it/get_it.dart';
import 'package:google_sign_in/google_sign_in.dart';

import 'package:finalappsanber/data/datasources/auth_local_data_source.dart';
import 'package:finalappsanber/data/datasources/auth_remote_data_source.dart';
import 'package:finalappsanber/data/datasources/category_local_data_source.dart';
import 'package:finalappsanber/data/datasources/point_remote_data_source.dart';
import 'package:finalappsanber/data/datasources/product_local_data_source.dart';
import 'package:finalappsanber/data/datasources/report_remote_data_source.dart';
import 'package:finalappsanber/data/datasources/transaction_remote_data_source.dart';
import 'package:finalappsanber/data/datasources/user_remote_data_source.dart';
import 'package:finalappsanber/data/db/database_helper.dart';
import 'package:finalappsanber/data/pf/preference_helper.dart';
import 'package:finalappsanber/data/repositories/auth_repository_impl.dart';
import 'package:finalappsanber/data/repositories/cart_repository_impl.dart';
import 'package:finalappsanber/data/repositories/category_repository_impl.dart';
import 'package:finalappsanber/data/repositories/point_repository_impl.dart';
import 'package:finalappsanber/data/repositories/product_repository_impl.dart';
import 'package:finalappsanber/data/repositories/report_repository_impl.dart';
import 'package:finalappsanber/data/repositories/transaction_repository_impl.dart';
import 'package:finalappsanber/data/repositories/user_repository_impl.dart';
import 'package:finalappsanber/domain/repositories/auth_repository.dart';
import 'package:finalappsanber/domain/repositories/cart_repository.dart';
import 'package:finalappsanber/domain/repositories/category_repository.dart';
import 'package:finalappsanber/domain/repositories/point_repository.dart';
import 'package:finalappsanber/domain/repositories/product_repository.dart';
import 'package:finalappsanber/domain/repositories/report_repository.dart';
import 'package:finalappsanber/domain/repositories/transaction_repository.dart';
import 'package:finalappsanber/domain/repositories/user_repository.dart';
import 'package:finalappsanber/domain/usecases/auth/get_login_status.dart';
import 'package:finalappsanber/domain/usecases/auth/get_role.dart';
import 'package:finalappsanber/domain/usecases/auth/login_with_google.dart';
import 'package:finalappsanber/domain/usecases/auth/logout.dart';
import 'package:finalappsanber/domain/usecases/auth/set_role.dart';
import 'package:finalappsanber/domain/usecases/cart/add_product_quantity.dart';
import 'package:finalappsanber/domain/usecases/cart/add_product_to_cart.dart';
import 'package:finalappsanber/domain/usecases/cart/clear_cart.dart';
import 'package:finalappsanber/domain/usecases/cart/get_all_carts_map.dart';
import 'package:finalappsanber/domain/usecases/cart/reduce_product_quantity.dart';
import 'package:finalappsanber/domain/usecases/category/get_all_categories.dart';
import 'package:finalappsanber/domain/usecases/category/insert_category.dart';
import 'package:finalappsanber/domain/usecases/category/remove_category.dart';
import 'package:finalappsanber/domain/usecases/category/update_category.dart';
import 'package:finalappsanber/domain/usecases/point/get_all_points_history.dart';
import 'package:finalappsanber/domain/usecases/product/get_all_products.dart';
import 'package:finalappsanber/domain/usecases/product/insert_product.dart';
import 'package:finalappsanber/domain/usecases/product/remove_product.dart';
import 'package:finalappsanber/domain/usecases/product/update_product.dart';
import 'package:finalappsanber/domain/usecases/report/get_count_transactions_today.dart';
import 'package:finalappsanber/domain/usecases/report/get_turn_over_transactions_today.dart';
import 'package:finalappsanber/domain/usecases/transaction/get_all_transactions.dart';
import 'package:finalappsanber/domain/usecases/transaction/get_all_transactions_by_user_id.dart';
import 'package:finalappsanber/domain/usecases/transaction/save_transaction.dart';
import 'package:finalappsanber/domain/usecases/user/get_current_user.dart';
import 'package:finalappsanber/domain/usecases/user/update_current_user.dart';
import 'package:finalappsanber/presentation/blocs/auth/auth_bloc.dart';
import 'package:finalappsanber/presentation/blocs/category/category_bloc.dart';
import 'package:finalappsanber/presentation/blocs/point/point_bloc.dart';
import 'package:finalappsanber/presentation/blocs/pos/pos_bloc.dart';
import 'package:finalappsanber/presentation/blocs/product/product_bloc.dart';
import 'package:finalappsanber/presentation/blocs/profile/profile_bloc.dart';
import 'package:finalappsanber/presentation/blocs/report/report_bloc.dart';
import 'package:finalappsanber/presentation/blocs/transaction/transaction_bloc.dart';

import 'domain/usecases/auth/login_with_email.dart';
import 'domain/usecases/auth/register_with_email.dart';

final locator = GetIt.instance;

void init() {
  // bloc
  locator.registerFactory(
    () => AuthBloc(
      login: locator(),
      getLoginStatus: locator(),
      setRole: locator(),
      getRole: locator(),
      logout: locator(),
      loginWithEmail: locator(),
      registerWithEmail: locator(),
    ),
  );
  locator.registerFactory(
    () => ProfileBloc(
      updateCurrentUser: locator(),
      getCurrentUser: locator(),
    ),
  );
  locator.registerFactory(
    () => CategoryBloc(
      getAllCategories: locator(),
      insertCategory: locator(),
      updateCategory: locator(),
      removeCategory: locator(),
    ),
  );
  locator.registerFactory(
    () => ProductBloc(
      getAllProducts: locator(),
      insertProduct: locator(),
      updateProduct: locator(),
      removeProduct: locator(),
    ),
  );
  locator.registerFactory(
    () => PosBloc(
      addProductToCart: locator(),
      addProductQuantity: locator(),
      reduceProductQuantity: locator(),
      clearCart: locator(),
      getAllCartsMap: locator(),
    ),
  );
  locator.registerFactory(
    () => PointBloc(getAllPointsHistory: locator()),
  );
  locator.registerFactory(
    () => TransactionBloc(
      getAllTransactions: locator(),
      getAllTransactionsByUserId: locator(),
      saveTransaction: locator(),
    ),
  );
  locator.registerFactory(
    () => ReportBloc(
      getCountTransactionsToday: locator(),
      getTurnOverTransactionsToday: locator(),
    ),
  );

  //regis
  locator.registerLazySingleton(() => LoginEmail(locator()));
  locator.registerLazySingleton(() => RegisterEmail(locator()));
  // usecase
  locator.registerLazySingleton(() => Login(locator()));
  locator.registerLazySingleton(() => GetLoginStatus(locator()));
  locator.registerLazySingleton(() => SetRole(locator()));
  locator.registerLazySingleton(() => GetRole(locator()));
  locator.registerLazySingleton(() => Logout(locator()));
  locator.registerLazySingleton(() => GetCurrentUser(locator()));
  locator.registerLazySingleton(() => UpdateCurrentUser(locator()));
  locator.registerLazySingleton(() => GetAllCategories(locator()));
  locator.registerLazySingleton(() => InsertCategory(locator()));
  locator.registerLazySingleton(() => UpdateCategory(locator()));
  locator.registerLazySingleton(() => RemoveCategory(locator()));
  locator.registerLazySingleton(() => GetAllProducts(locator()));
  locator.registerLazySingleton(() => InsertProduct(locator()));
  locator.registerLazySingleton(() => UpdateProduct(locator()));
  locator.registerLazySingleton(() => RemoveProduct(locator()));
  locator.registerLazySingleton(() => AddProductToCart(locator()));
  locator.registerLazySingleton(() => AddProductQuantity(locator()));
  locator.registerLazySingleton(() => ReduceProductQuantity(locator()));
  locator.registerLazySingleton(() => ClearCart(locator()));
  locator.registerLazySingleton(() => GetAllCartsMap(locator()));
  locator.registerLazySingleton(() => GetAllPointsHistory(locator()));
  locator.registerLazySingleton(() => GetAllTransactions(locator()));
  locator.registerLazySingleton(() => GetAllTransactionsByUserId(locator()));
  locator.registerLazySingleton(() => SaveTransaction(locator()));
  locator.registerLazySingleton(() => GetCountTransactionsToday(locator()));
  locator.registerLazySingleton(() => GetTurnOverTransactionsToday(locator()));

  // repository
  locator.registerLazySingleton<AuthRepository>(
    () => AuthRepositoryImpl(
      remoteDataSource: locator(),
      localDataSource: locator(),
    ),
  );
  locator.registerLazySingleton<UserRepository>(
    () => UserRepositoryImpl(locator()),
  );
  locator.registerLazySingleton<CategoryRepository>(
    () => CategoryRepositoryImpl(locator()),
  );
  locator.registerLazySingleton<ProductRepository>(
    () => ProductRepositoryImpl(locator()),
  );
  locator.registerLazySingleton<CartRepository>(
    () => CartRepositoryImpl(),
  );
  locator.registerLazySingleton<PointRepository>(
    () => PointRepositoryImpl(locator()),
  );
  locator.registerLazySingleton<TransactionRepository>(
    () => TransactionRepositoryImpl(locator()),
  );
  locator.registerLazySingleton<ReportRepository>(
    () => ReportRepositoryImpl(locator()),
  );

  // data source
  locator.registerLazySingleton<AuthRemoteDataSource>(
    () => AuthRemoteDataSourceImpl(
      googleSignIn: locator(),
      firebaseAuth: locator(),
      firebaseFirestore: locator(),
    ),
  );
  locator.registerLazySingleton<AuthLocalDataSource>(
    () => AuthLocalDataSourceImpl(locator()),
  );
  locator.registerLazySingleton<UserRemoteDataSource>(
    () => UserRemoteDataSourceImpl(
      firebaseAuth: locator(),
      firebaseFirestore: locator(),
      firebaseStorage: locator(),
    ),
  );
  locator.registerLazySingleton<CategoryLocalDataSource>(
    () => CategoryLocalDataSourceImpl(locator()),
  );
  locator.registerLazySingleton<ProductLocalDataSource>(
    () => ProductLocalDataSourceImpl(locator()),
  );
  locator.registerLazySingleton<PointRemoteDataSource>(
    () => PointRemoteDataSourceImpl(
      firebaseAuth: locator(),
      firebaseFirestore: locator(),
    ),
  );
  locator.registerLazySingleton<TransactionRemoteDataSource>(
    () => TransactionRemoteDataSourceImpl(
      firebaseAuth: locator(),
      firebaseFirestore: locator(),
    ),
  );
  locator.registerLazySingleton<ReportRemoteDataSource>(
    () => ReportRemoteDataSourceImpl(locator()),
  );

  // helper
  locator.registerLazySingleton<PreferenceHelper>(() => PreferenceHelper());
  locator.registerLazySingleton<DatabaseHelper>(() => DatabaseHelper());

  // external
  locator.registerLazySingleton(() => GoogleSignIn(scopes: ['email']));
  locator.registerLazySingleton(() => FirebaseAuth.instance);
  locator.registerLazySingleton(() => FirebaseFirestore.instance);
  locator.registerLazySingleton(() => FirebaseStorage.instance);
}
