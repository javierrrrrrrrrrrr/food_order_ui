import 'package:data_connection_checker_tv/data_connection_checker.dart';
import 'package:food_order_ui/features/auth/data/repositories/auth_user_repository_impl.dart';
import 'package:food_order_ui/features/auth/domain/repositories/auth_user_repository.dart';
import 'package:food_order_ui/features/auth/domain/usecases/login_user_with_email_and_password_usecase.dart';
import 'package:food_order_ui/features/auth/domain/usecases/register_user_with_email_and_password_usecase.dart';
import 'package:food_order_ui/features/auth/presentation/pages/bloc/authetication/authentication_bloc.dart';
import 'package:food_order_ui/features/auth/presentation/pages/bloc/login/login_bloc.dart';

import 'features/auth/data/datasource/user_remote_data_source.dart';
import 'features/products/data/datasources/product_local_data_source.dart';
import 'features/products/domain/usecases/create_product_usecase.dart';
import 'features/products/domain/usecases/get_all_favorite_products_form_DB.dart';
import 'features/products/presentation/bloc/bloc/favorites_bloc/cubit/fav_icon_cubit.dart';
import 'features/products/presentation/bloc/bloc/five_starts_products_bloc/bloc/five_start_products_bloc_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'core/platform/network/network_info.dart';
import 'features/payments/presentation/bloc/cart_bloc.dart';
import 'features/products/data/repositories/product_repository_imp.dart';
import 'features/products/domain/usecases/get_all_five_start_rating_product_use_case.dart';
import 'features/products/domain/usecases/get_product_by_id_usecase.dart';
import 'features/products/domain/usecases/remove_favorite_product_from_DB.dart';
import 'features/products/domain/usecases/save_product_favorites_into_db.dart';
import 'features/products/presentation/bloc/bloc/favorites_bloc/favorites_bloc.dart';
import 'features/products/presentation/bloc/bloc/product_bloc/product_bloc.dart';
import 'package:get_it/get_it.dart';

import 'features/products/data/datasources/product_remote_datasource.dart';
import 'features/products/domain/repositories/product_repository.dart';
import 'features/products/domain/usecases/get_all_products_usecase.dart';
import 'package:http/http.dart' as http;

final getIt = GetIt.instance;

Future<void> init() async {
  getIt.registerSingleton(http.Client());
  getIt.registerSingleton(DataConnectionChecker());

  getIt.registerSingleton<NetworkInfo>(
      NetworkInfoImpl(getIt<DataConnectionChecker>()));

  getIt.registerLazySingletonAsync<SharedPreferences>(
      () async => SharedPreferences.getInstance());

//////////////////////////////////////////////////////////////
  //? DataSources

  getIt.registerSingleton<UserRemoteDataSource>(UserRemoteDataSourceImpl(
      client: getIt<http.Client>(), sharedPreferences: await getIt.getAsync()));

  getIt.registerSingleton<ProductRemoteDataSource>(
      ProductRemoteDataSourceImpl(client: getIt()));

  getIt.registerSingleton<ProductLocalDataSource>(
      ProductLocalDataSourceImpl(sharedP: await getIt.getAsync()));

  //?Repositories

  getIt.registerSingleton<AuthUserRepository>(AuthUserRepositoryImpl(
      networkInfo: getIt<NetworkInfo>(),
      userRemoteDataSource: getIt<UserRemoteDataSource>()));

  getIt.registerSingleton<ProductRepository>(ProductRepositoryImpl(
      localDataSource: getIt<ProductLocalDataSource>(),
      networkInfo: getIt<NetworkInfo>(),
      remoteDataSource: getIt<ProductRemoteDataSource>()));

  //? UseCases
  //?Product UseCases...

  getIt.registerSingleton(GetAllProductsUseCase(getIt<ProductRepository>()));
  getIt.registerSingleton(CreateProductUseCase(getIt<ProductRepository>()));
  getIt.registerSingleton(GetProductByIdUseCase(getIt<ProductRepository>()));
  getIt.registerSingleton(
      GetAllFiveStartRatingProductsUseCase(getIt<ProductRepository>()));
  getIt.registerSingleton(
      GetAllFavoriteProductsFromDBUseCase(getIt<ProductRepository>()));
  getIt.registerSingleton(
      SaveProductFavoriteIntoDBUseCase(getIt<ProductRepository>()));
  getIt.registerSingleton(
      RemoveFavoriteProductFromDBUseCase(getIt<ProductRepository>()));

  //? User UseCase...
  getIt.registerLazySingleton(
      () => LoginUserWithEmailAndPasswordUsecase(getIt<AuthUserRepository>()));
  getIt.registerLazySingleton(() =>
      RegisterUserWithEmailAndPasswordUsecase(getIt<AuthUserRepository>()));

  //? Blocs
  //Blocs
  getIt.registerFactory<ProductBloc>(
    () => ProductBloc(
      getProductByIdUseCase: getIt<GetProductByIdUseCase>(),
      getAllProductsUseCase: getIt<GetAllProductsUseCase>(),
    ),
  );
  getIt.registerFactory<FiveStartProductsBloc>(
    () => FiveStartProductsBloc(
        getAllFiveStartRatingProductsUseCase:
            getIt<GetAllFiveStartRatingProductsUseCase>()),
  );
  getIt.registerFactory<CartBloc>(
    () => CartBloc(),
  );
  getIt.registerFactory(() => FavIconCubit());
  getIt.registerFactory<FavoritesBloc>(
    () => FavoritesBloc(
      getAllFavoriteProductsFromDBUseCase:
          getIt<GetAllFavoriteProductsFromDBUseCase>(),
      removeFavoriteProductFromDBUseCase:
          getIt<RemoveFavoriteProductFromDBUseCase>(),
      saveProductFavoriteIntoDBUseCase:
          getIt<SaveProductFavoriteIntoDBUseCase>(),
    ),
  );
  final SharedPreferences sharedPreferencesInstance = await getIt.getAsync();
  getIt.registerFactory<AuthenticationBloc>(
      () => AuthenticationBloc(sharedPreferences: sharedPreferencesInstance));

  getIt.registerFactoryAsync(() async => LoginBloc(
      authenticationBloc: getIt<AuthenticationBloc>(),
      sharedPreferences: sharedPreferencesInstance,
      usecase: getIt<LoginUserWithEmailAndPasswordUsecase>()));

  //Core
}
