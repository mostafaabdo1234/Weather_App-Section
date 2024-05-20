import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_application/component/weather_component.dart';
import '../cubits/get_current_cubit/get_weather_cubit.dart';

class TextFieldComponent extends StatelessWidget {
  const TextFieldComponent({super.key});
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: TextField(
          onSubmitted: (value) async {
            BlocProvider.of<GetWeatherCubit>(context)
                .getWeather(cityName: value);
            Navigator.push(context, MaterialPageRoute(builder: (context){
              return WeatherComponent();
            }));
          },
          decoration:const InputDecoration(
            contentPadding: EdgeInsets.symmetric(horizontal: 15, vertical: 30),
            labelText: 'Search',
            hintText: 'Enter City Name',
            suffixIcon: Icon(Icons.search),
            suffixIconColor: Colors.black,
            border: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.green),
            ),
          ),
        ),
      ),
    );
  }
}
