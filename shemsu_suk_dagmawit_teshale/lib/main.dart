import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shemsu_suk_dagmawit_teshale/routes.dart';
import 'package:shemsu_suk_dagmawit_teshale/views/home.dart';
import 'package:shemsu_suk_dagmawit_teshale/views/cart.dart';
import 'package:shemsu_suk_dagmawit_teshale/views/profile.dart';
import 'bloc/activity_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => activityBloc(),
      child: MaterialApp(
        initialRoute: Routes.home,
        routes: {
          Routes.home: (context) => const home_page(),
        
         
        },
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
      ),
    );
  }
}
