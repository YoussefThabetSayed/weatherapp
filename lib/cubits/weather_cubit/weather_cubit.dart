import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weatherapp/cubits/weather_cubit/weather_state.dart';
import 'package:weatherapp/models/weather_models.dart';
import 'package:weatherapp/services/weather_service.dart';

class WeatherCubit extends Cubit<WeatherState> {
  WeatherCubit(this.weatherService) : super(WeatherLoading());

  WeatherService weatherService;
  WeatherModel? weatherModel;

  void getWeather({required String cityName})async {
    emit(WeatherLoading());
   try {
    weatherModel = await weatherService.getWeather(cityName: cityName);
        emit(WeatherSuccess());
   } on Exception catch (e) {
      emit(WeatherFailer());
      }
  }
}
