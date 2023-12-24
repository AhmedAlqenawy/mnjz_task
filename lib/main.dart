import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:mnjz_task/features/home/presentation/pages/home_page.dart';
import 'package:mnjz_task/utile/network/local/cache_helper.dart';

import 'features/home/presentation/bloc/featured_products/featured_products_cubit.dart';
import 'injection_container.dart' as di;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await di.init();
  await CacheHelper.init();
  //await DioHelper.init();

  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => di.sl<FeaturedProductsCubit>()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: ScreenUtilInit(
          designSize: const Size(375, 812),
          minTextAdapt: true,
          builder: (context, child) => const GetMaterialApp(
            title: 'Sondos',
            debugShowCheckedModeBanner: false,
            home: HomeScreen(),
            locale: Locale("En"),
            fallbackLocale: Locale('er'),
          ),
        ),
      ),
    );
  }
}
