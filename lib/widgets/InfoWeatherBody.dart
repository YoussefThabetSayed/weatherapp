import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


import '../cubits/get_weather_cubit.dart';
import '../main.dart';
import '../models/weather_models.dart';
class InfoWeatherBody extends StatelessWidget {
  const InfoWeatherBody({super.key, required this.weather});
  final WeatherModel weather;

  @override
  Widget build(BuildContext context) {
    WeatherModel weatherModel= BlocProvider.of<GetWeatherCubit>(context).weatherModel!;
    return  Container(
      decoration:   BoxDecoration(
        gradient: LinearGradient(colors: [
          getThemeColor(weatherModel.weatherCondition),
          getThemeColor(weatherModel.weatherCondition)[300]!,
          getThemeColor(weatherModel.weatherCondition)[50]!

        ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter
        ),
      ),
      child: Padding(
        padding:  const EdgeInsets.symmetric(horizontal: 16),
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text( weatherModel.cityName,style: const TextStyle(fontSize: 34),),
              Text('Update at ${weatherModel.date.hour}:${weatherModel.date.minute}',
                  style: const TextStyle(fontSize: 20)),
              const SizedBox(
                  height: 16
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Image.network("https:${weatherModel.image}",
                    height: 60,
                    width: 60,
                  ),
                  Text(weatherModel.temp.round().toString(),style: const TextStyle(fontSize: 32),),
                  Column(
                    children: [
                      Text('Max temp: ${weatherModel.maxTemp.round()}'),
                      Text('Min temp: ${weatherModel.minTemp.round()}'),
                    ],
                  ),
                ],
              ),
              const SizedBox(height: 16,),
              Text(weatherModel.weatherCondition,style:  const TextStyle(fontSize: 42,),),
            ],
          ),
        ),
      ),
    );
  }
}
