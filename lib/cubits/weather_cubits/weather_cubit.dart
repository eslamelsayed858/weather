import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hallo_cs/cubits/weather_cubits/weather_state.dart';
import 'package:hallo_cs/model/weather_model.dart';
import 'package:hallo_cs/services/weather_service.dart';

class WeatherCubit extends Cubit<WatherState> {
  WeatherService weatherService;
  String? cityName;
  WeatherModel? weatherModel;

  WeatherCubit(this.weatherService) : super(WeatherInitial());
  void getWeather({required String cityName}) async {
    emit(WeatherLoading());

    try {
      weatherModel = await weatherService.getWeather(cityName: cityName);
      emit(WeatherSuccess());
    } on Exception catch (e) {
      emit(WeatherFailure());
    }
  }
}
