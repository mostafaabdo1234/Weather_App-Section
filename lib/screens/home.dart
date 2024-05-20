import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_application/component/weather_component.dart';
import 'package:weather_application/screens/search_page.dart';
import '../cubits/get_current_cubit/get_weather_cubit.dart';
import '../cubits/get_current_cubit/weather_state.dart';

class Home extends StatelessWidget {
  const Home({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title:const Text(
          'Weather',
          style: TextStyle(fontSize: 24),
        ),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return const SearchPage();
              }));
            },
            icon:const Icon(
              Icons.search,
              size: 28,
            ),
          )
        ],
      ),
      body:
          BlocBuilder<GetWeatherCubit, WeatherState>(builder: (context, state) {
          if (state is WeatherSuccessState) {
          return WeatherComponent();
        } else {
          return const Center(
              child: Text(
            'oops there was an error , try later',
            style: TextStyle(fontSize: 25),
          ));
        }
      }),
    );
  }
}