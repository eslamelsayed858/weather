import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hallo_cs/cubits/weather_cubits/weather_cubit.dart';
import 'package:hallo_cs/cubits/weather_cubits/weather_state.dart';
import 'package:hallo_cs/model/weather_model.dart';
import 'package:hallo_cs/pages/search_page.dart';

class HomePage extends StatelessWidget {
  WeatherModel? weatherData;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) {
                  return SearchPage();
                }),
              );
            },
            icon: Icon(Icons.search),
          ),
        ],
        title: Text('Weather App'),
      ),
      body: BlocBuilder<WeatherCubit, WatherState>(
        builder: (context, State) {
          if (State is WeatherLoading) {
            return Center(
              child: CircularProgressIndicator(),
            );
          } else if (State is WeatherSuccess) {
            weatherData = BlocProvider.of<WeatherCubit>(context).weatherModel;
            return SuccessBody(weatherData: weatherData);
          } else if (State is WeatherFailure) {
            return Center(
              child: Text('Something went wron please try again'),
            );
          } else {
            return DefaultBody();
          }
        },
      ),
    );
  }
}

class SuccessBody extends StatelessWidget {
  SuccessBody({
    Key? key,
    required this.weatherData,
  }) : super(key: key);

  WeatherModel? weatherData;

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
            gradient: LinearGradient(
          colors: [
            weatherData!.getThemeColor(),
            weatherData!.getThemeColor()[300]!,
            weatherData!.getThemeColor()[100]!,
          ],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        )),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Spacer(
              flex: 3,
            ),
            Text(
              BlocProvider.of<WeatherCubit>(context).cityName!,
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              ' updated to : ${weatherData!.date.hour.toString()} :${weatherData!.date.minute.toString()}',
              style: TextStyle(
                fontSize: 22,
              ),
            ),
            const Spacer(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Image.asset(weatherData!.getImage()),
                Text(
                  weatherData!.temp.toInt().toString(),
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Column(
                  children: [
                    Text('maxTenp : ${weatherData!.maxtemp.toInt()}'),
                    Text('minTenp : ${weatherData!.mintemp.toInt()}'),
                  ],
                ),
              ],
            ),
            Spacer(),
            Text(
              weatherData!.weatherStatrName,
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
              ),
            ),
            const Spacer(
              flex: 4,
            )
          ],
        ));
  }
}

class DefaultBody extends StatelessWidget {
  const DefaultBody({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            'ther is no weather ',
            style: TextStyle(
              fontSize: 30,
            ),
          ),
          Text(
            'searching now ',
            style: TextStyle(
              fontSize: 30,
            ),
          ),
        ],
      ),
    );
  }
}
