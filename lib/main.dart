import 'package:cats/core/config/routes.dart';
import 'package:cats/core/theme/theme.dart';
import 'package:cats/features/cat/presentation/bloc/cat_bloc.dart';
import 'package:cats/injections.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await init();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp])
      .then((_) {
    runApp(const MyApp());
  });
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => sl<CatBloc>(),
      child: MaterialApp(
        title: 'Cat',
        debugShowCheckedModeBanner: false,
        theme: AppTheme.defaultTheme,
        onGenerateRoute: RouteGenerator.generateRoute,
      ),
    );
  }
}
