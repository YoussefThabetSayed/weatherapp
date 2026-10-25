import '../models/weather_models.dart';

class WeatherState{}

class InitialState extends WeatherState{}

class WeatherLoadedState extends WeatherState{
  final WeatherModel weatherModel;

  WeatherLoadedState(this.weatherModel);
}

class WeatherFailureState extends WeatherState{
  final String errMassage;
  WeatherFailureState(this.errMassage);
}