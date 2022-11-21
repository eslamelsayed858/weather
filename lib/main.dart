import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hallo_cs/cubits/weather_cubits/weather_cubit.dart';

import 'package:hallo_cs/pages/home_page.dart';

import 'package:hallo_cs/services/weather_service.dart';

void main() {
  runApp(
    BlocProvider(
      create: (context) {
        return WeatherCubit(WeatherService());
      },
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
          primarySwatch:
              BlocProvider.of<WeatherCubit>(context).weatherModel == null
                  ? Colors.blue
                  : BlocProvider.of<WeatherCubit>(context)
                      .weatherModel!
                      .getThemeColor()),
      home: HomePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}
