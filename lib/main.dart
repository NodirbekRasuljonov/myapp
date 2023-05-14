import 'package:flutter/material.dart';
import 'package:flutter_downloader/flutter_downloader.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:myapp/core/routes/app_routes.dart';
import 'package:myapp/pages/contact_view/cubit/contact_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await FlutterDownloader.initialize(debug: true, ignoreSsl: true);

  runApp(MultiBlocProvider(
    providers: [
      BlocProvider(
        create: (context) => ContactCubit(),
      )
    ],
    child: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    AppRoutes routes = AppRoutes();
    return ScreenUtilInit(
      designSize: const Size(385, 800),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Flutter Demo',
          theme: ThemeData.light(),
          onGenerateRoute: routes.onGenerateRoute,
          initialRoute: "/home",
        );
      },
    );
  }
}
