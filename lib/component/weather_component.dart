import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_application/main.dart';
import 'package:weather_application/model/weather_model.dart';
import '../cubits/get_current_cubit/get_weather_cubit.dart';

class WeatherComponent extends StatelessWidget {
  const WeatherComponent({super.key});
  @override
  Widget build(BuildContext context) {
    WeatherModel? models = BlocProvider.of<GetWeatherCubit>(context).weatherModel;
    if (models == null) {
      return const Scaffold(
        body: Center(child: CircularProgressIndicator(
          color: Colors.black,
        )),
      );
    } else {
      return Container(
        decoration: BoxDecoration(
            gradient: LinearGradient(colors: [
          getThemeColor(models.weatherCondition),
          getThemeColor(models.weatherCondition)[300]!,
          getThemeColor(models.weatherCondition)[50]!,
        ], begin: Alignment.topCenter, end: Alignment.bottomCenter)),
        child: Column(
          children: [
            const Spacer(
              flex: 2,
            ),
            Text(
              models.cName,
              style: const TextStyle(fontSize: 27, fontWeight: FontWeight.bold),
            ),
            Text(
              'updated at: ${models.dateTime.hour}:${models.dateTime.minute}',
              style: const TextStyle(
                fontSize: 21,
              ),
            ),
            const Spacer(
              flex: 1,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                models.image.contains('https:')
                    ? Image.network(models.image)
                    : Image.network('https:${models.image}'),
                Text(
                  models.avgTemp.round().toString(),
                  style: const TextStyle(
                      fontSize: 27, fontWeight: FontWeight.bold),
                ),
                Column(
                  children: [
                    Text(
                      'maxTemp:${models.maxTemp.round()}',
                      style: const TextStyle(fontSize: 16),
                    ),
                    Text(
                      'minTemp:${models.minTemp.round()}',
                      style: const TextStyle(fontSize: 16),
                    ),
                  ],
                ),
              ],
            ),
            const Spacer(
              flex: 1,
            ),
            Text(
              models.weatherCondition,
              style: const TextStyle(fontSize: 27, fontWeight: FontWeight.bold),
            ),
            const Spacer(
              flex: 3,
            ),
          ],
        ),
      );
    }
  }
}