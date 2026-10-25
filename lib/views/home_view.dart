import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../cubits/get_weather_cubit.dart';
import '../cubits/get_weather_cubit_state.dart';
import '../widgets/InfoWeatherBody.dart';
import '../widgets/NoWeatherBody.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<GetWeatherCubit, WeatherState>(
          builder: (context,state){
            if (state is InitialState){
              return const NoWeatherBody();
            }else if(state is WeatherLoadedState){
              return   InfoWeatherBody(
                weather: state.weatherModel,
              );
            }else{
              return const Center(child: Text('Oops There Was an Error!',
                style: TextStyle(fontSize: 24),
              ));
            }
          }),
    );
  }
}
