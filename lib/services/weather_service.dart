import 'package:dio/dio.dart';
import '../models/weather_models.dart';

class WeatherService{
  final Dio dio;
  final String baseUrl='https://api.weatherapi.com/v1';
  final String apiKey='ccd5331f806d445993b160701261507';
  WeatherService(this.dio);

  Future<WeatherModel> getCurrentWeather({required String cityName}) async
  {
    try {
      Response response =await dio.get(
          '$baseUrl/forecast.json?key=$apiKey&q=$cityName&days=1');
      WeatherModel weatherModel= WeatherModel.fromJson(response.data);
      return weatherModel;
    }on DioException catch (e) {
      final errMessage= e.response?.data['error']['message']??
          'oops error!,try later';
      throw Exception(errMessage);
    }
    catch(e){
      throw Exception('try later');
    }
  }
}