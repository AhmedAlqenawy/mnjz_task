import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mnjz_task/utile/components/comman.dart';
import 'package:mnjz_task/utile/components/extensions.dart';
import 'package:mnjz_task/utile/fonts.dart';

import '../../domain/entities/products_entity.dart';

class ProductWidget extends StatelessWidget {
  const ProductWidget({super.key, required this.products});

  final ProductsEntity products;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 295.w,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: 16.toCircular,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 295.w,
            height: 140.h,
            decoration: BoxDecoration(
              color: 0xffe4e4e4.toColor,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(16.r),
                topRight: Radius.circular(16.r),
              ),
            ),
            padding: EdgeInsets.all(8.0.w),
            child: Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                    image: NetworkImage(
                      "${products.image}",
                    ),
                    fit: BoxFit.fill),
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(16.r),
                  topRight: Radius.circular(16.r),
                ),
              ),

              //child: ,
            ),
          ),
          Expanded(
            child: Container(
              //height: 100.h,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(8.r),
                  topRight: Radius.circular(8.r),
                ),
              ),
              padding: EdgeInsets.symmetric(horizontal: 8.w),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  space(8.h, 0),
                  Text(
                    products.title ?? "___",
                    style: openSans(15.sp, Colors.black, AppFontWeight.bold),
                    textScaleFactor: 1,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  space(2.h, 0),
                  Text(
                    products.category ?? "___",
                    style: openSans(
                        13.sp, 0xff33333D.toColor, AppFontWeight.regular),
                    textScaleFactor: 1,
                    maxLines: 2,
                  ),
                  space(8.h, 0),
                  Text(
                    "${products.price ?? "____"}",
                    style: openSans(15.sp, Colors.black, AppFontWeight.bold),
                    textScaleFactor: 1,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Icon(
                            Icons.star,
                            color: Colors.red,
                            size: 18.r,
                          ),
                          Text(
                            "${products.rating?.rate ?? "____"}",
                            style: openSans(13.sp, 0xff33333D.toColor,
                                AppFontWeight.regular),
                            textScaleFactor: 1,
                            maxLines: 2,
                          ),
                        ],
                      ),
                      Icon(
                        Icons.favorite_border,
                        color: Colors.red,
                        size: 22.r,
                      ),
                    ],
                  ),
                  space(8.h, 0),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
