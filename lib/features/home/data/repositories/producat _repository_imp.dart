import 'package:dartz/dartz.dart';
import 'package:mnjz_task/features/home/data/models/producat%20_model.dart';

import '../../../../core/error/exceptions.dart';
import '../../../../core/error/failure.dart';
import '../../../../core/network/network_info.dart';
import '../../domain/repositories/product_repository.dart';
import '../data_sources/product_local_data_source.dart';
import '../data_sources/product_remote_data_source.dart';

class ProductRepositoryImplementation extends ProductsRepository {
  final ProductRemoteDataSource remoteDataSource;
  final ProductLocalDataSource localDataSource;
  final NetworkInfo networkInfo;

  ProductRepositoryImplementation(
      {required this.remoteDataSource,
      required this.localDataSource,
      required this.networkInfo});

  /*
 @override
 Future<Either<Failure, List<ProductsModel>>> getProducts() async {
    try {
      final product = await localDataSource.getCachedProductList();
      return Right(product);
    } on EmptyCacheException {
      if (await networkInfo.isConnected) {
        try {
          final product = await remoteDataSource.getProductList();
          localDataSource.cacheProductList(product);
          return Right(product);
        } on ServerException {
          return Left(ServerFailure());
        }
      } else {
        return Left(OfflineFailure());
      }
    }
  }*/

  @override
  Future<Either<Failure, List<ProductsModel>>> getProducts() async {
    try {
      if (await networkInfo.isConnected) {
        final product = await remoteDataSource.getProductList();
        localDataSource.cacheProductList(product);
        return Right(product);
      } else {
        print("no Data");
        try {
          final product = await localDataSource.getCachedProductList();
          return Right(product);
        } catch (e) {
          print(e);
          return Left(EmptyCacheFailure());
        }
      }
    } on EmptyCacheException {

      try {
        final product = await localDataSource.getCachedProductList();
        localDataSource.cacheProductList(product);
        return Right(product);
      } on EmptyCacheException {
        return Left(EmptyCacheFailure());
      }
    }
  }
}
