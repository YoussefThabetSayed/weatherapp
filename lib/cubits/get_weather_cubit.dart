import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../services/weather_service.dart';
import '../models/weather_models.dart';
import 'get_weather_cubit_state.dart';

class GetWeatherCubit extends Cubit<WeatherState>{
  GetWeatherCubit():super(InitialState());
  WeatherModel? weatherModel;

  getWeather({required String cityName}) async{
    try {
      weatherModel= await
      WeatherService(Dio()).getCurrentWeather(cityName: cityName);
      emit(WeatherLoadedState(weatherModel!));
    }catch (e) {
      emit(WeatherFailureState(e.toString()));
    }



  }

}