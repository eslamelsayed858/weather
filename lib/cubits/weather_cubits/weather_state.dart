abstract class WatherState {}

class WeatherInitial extends WatherState {}

class WeatherLoading extends WatherState {}

class WeatherSuccess extends WatherState {}

class WeatherFailure extends WatherState {}
