import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mnjz_task/utile/components/components.dart';

 import '../../../../utile/components/comman.dart';
import '../../../../utile/constants/colors.dart';
import '../../domain/entities/products_entity.dart';
import '../bloc/featured_products/featured_products_cubit.dart';
import '../widgets/product_widget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 500),
    );

    _animation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Curves.easeInOut,
      ),
    );

    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    List<ProductsEntity>? products;

    return Scaffold(
      appBar: defaultAppBar(
        title: "All Product",
        context: context,
      ),
      backgroundColor: backgroundColor,
      body: Padding(
        padding: EdgeInsets.all(8.0.w),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Expanded(
              child: AnimatedBuilder(
                animation: _animation,
                builder: (context, child) {
                  return Opacity(
                    opacity: _animation.value,
                    child: BlocConsumer<FeaturedProductsCubit,
                        FeaturedProductsState>(
                      listener: (context, state) {},
                      builder: (context, state) {
                        FeaturedProductsCubit cubit =
                            FeaturedProductsCubit.get(context);

                        if (cubit.featuredProducts == null) {
                          cubit.getFeaturedProducts();
                        } else {
                          products = cubit.featuredProducts;
                        }
                        return ConditionalBuilder(
                          condition: products != null,
                          fallback: (context) => const Center(
                            child: CircularProgressIndicator(
                              color: Colors.red,
                            ),
                          ),
                          builder: (context) => ConditionalBuilder(
                            condition: products!.isNotEmpty,
                            fallback: (context) => space(0, 0),
                            builder: (context) => SingleChildScrollView(
                              child: GridView.builder(
                                padding: EdgeInsets.zero,
                                scrollDirection: Axis.vertical,
                                shrinkWrap: true,
                                physics: const NeverScrollableScrollPhysics(),
                                gridDelegate:
                                    SliverGridDelegateWithFixedCrossAxisCount(
                                        crossAxisCount: 2,
                                        crossAxisSpacing: 16.h,
                                        mainAxisSpacing: 16.w,
                                        mainAxisExtent: 290.h),
                                itemCount: products!.length,
                                itemBuilder: (BuildContext ctx, index) =>
                                    GestureDetector(
                                  onTap: () {},
                                  child: ProductWidget(
                                    products: products![index],
                                  ),
                                ),
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  );
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
