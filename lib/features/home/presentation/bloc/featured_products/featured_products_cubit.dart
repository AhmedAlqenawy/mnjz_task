import 'package:dartz/dartz.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/error/failure.dart';
import '../../../../../core/strings/failuers.dart';
import '../../../domain/entities/products_entity.dart';
import '../../../domain/use_cases/get_product_use_case.dart';

part 'featured_products_state.dart';

class FeaturedProductsCubit extends Cubit<FeaturedProductsState> {
  final GetProductsUseCase getFeaturedProductsUseCase;
  bool newItem = true;
  List<ProductsEntity>? featuredProducts;

  FeaturedProductsCubit({
    required this.getFeaturedProductsUseCase,
  }) : super(FeaturedProductsInitial());

  static FeaturedProductsCubit get(context) => BlocProvider.of(context);

  changeIsItemView(bool val) {
    newItem = val;
    emit(UpdateViewType());
  }

  getFeaturedProducts() async {
    emit(LoadingFeaturedProductsState());
    final failureOrFeaturedProducts = await getFeaturedProductsUseCase();
    emit(_mapFailureOrFeaturedProductsToState(failureOrFeaturedProducts));
  }

  FeaturedProductsState _mapFailureOrFeaturedProductsToState(
      Either<Failure, List<ProductsEntity>> either) {
    return either.fold(
      (failure) => ErrorFeaturedProductsState(),
      (val) {
        featuredProducts = val;
        return LoadedFeaturedProductsState();
      },
    );
  }

  String _mapFailureToMessage(Failure failure) {
    switch (failure.runtimeType) {
      case ServerFailure:
        return SERVER_FAILURE_MESSAGE;
      case EmptyCacheFailure:
        return EMPTY_CACHE_FAILURE_MESSAGE;
      case OfflineFailure:
        return OFFLINE_FAILURE_MESSAGE;

      default:
        return "Unexpected Error , Please try again later";
    }
  }
}
