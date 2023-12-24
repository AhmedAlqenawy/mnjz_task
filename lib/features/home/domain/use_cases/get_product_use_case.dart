import 'package:dartz/dartz.dart';

import '../../../../core/error/failure.dart';
import '../entities/products_entity.dart';
import '../repositories/product_repository.dart';

class GetProductsUseCase {
  final  ProductsRepository productsRepository;

  const GetProductsUseCase({required this.productsRepository});

  Future<Either<Failure, List<ProductsEntity>>> call() {
    return productsRepository.getProducts();
  }
}
