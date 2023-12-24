import 'package:dartz/dartz.dart';

import '../../../../core/error/failure.dart';
import '../entities/products_entity.dart';

abstract class ProductsRepository {
  Future<Either<Failure, List<ProductsEntity>>> getProducts();
}
