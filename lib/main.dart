import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mobile_test/pages/detail/bloc/bloc.dart';
import 'package:mobile_test/pages/detail/pages/detail.dart';
import 'package:mobile_test/pages/home/bloc/bloc.dart';
import 'package:mobile_test/pages/home/page.dart';
import 'package:mobile_test/pages/movies/bloc/bloc.dart';
import 'package:mobile_test/pages/movies/page.dart';
import 'package:mobile_test/repository.dart';
import 'package:mobile_test/theme/colors.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final routes = {
      '/': (_) => const HomePage(),
      '/general': (_) => const Test1Page(),
      '/detail': (_) => const DetailPage(),
    };
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => Test3Bloc(Repository()),
        ),
        BlocProvider(
          create: (context) => Test2Bloc(Repository())..add(const LoadEvent()),
        ),
        BlocProvider(
          create: (context) =>
              Test1Bloc(Repository())..add(const LoadEventHome()),
        ),
      ],
      child: MaterialApp(
        title: 'Material App',
        initialRoute: '/',
        routes: routes,
        theme: Theme.of(context).copyWith(
          primaryColor: AppColors.primary,
          secondaryHeaderColor: AppColors.secondary,
        ),
      ),
    );
  }
}
