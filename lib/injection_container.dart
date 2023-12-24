import 'package:get_it/get_it.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:mnjz_task/features/home/data/data_sources/product_remote_data_source.dart';

import 'core/network/network_info.dart';
import 'features/home/data/data_sources/product_local_data_source.dart';
import 'features/home/data/repositories/producat _repository_imp.dart';
import 'features/home/domain/repositories/product_repository.dart';
import 'features/home/domain/use_cases/get_product_use_case.dart';
import 'features/home/presentation/bloc/featured_products/featured_products_cubit.dart';
//asdasd
final sl = GetIt.instance;

Future<void> init() async {
  /// Features - FeaturedProduct
  // Bloc
  sl.registerFactory(
          () => FeaturedProductsCubit(getFeaturedProductsUseCase: sl()));

  // UseCases
  sl.registerLazySingleton<GetProductsUseCase>(
          () => GetProductsUseCase(productsRepository: sl()));

  //Repository
  sl.registerLazySingleton<ProductsRepository>(
          () =>
          ProductRepositoryImplementation(
              localDataSource: sl(), remoteDataSource: sl(), networkInfo:sl()));

  //DataSources
  sl.registerLazySingleton<ProductLocalDataSource>(
          () => ProductLocalDataSourceImp());
  sl.registerLazySingleton<ProductRemoteDataSource>(
          () => ProductRemoteDataSourceImp());

  ///External
  sl.registerLazySingleton<NetworkInfo>(
          () => NetworkInfoImpl(connectionChecker: sl()));

  ///External
  sl.registerLazySingleton(() => InternetConnectionChecker());
}
