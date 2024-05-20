import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_application/cubits/get_current_cubit/weather_state.dart';
import '../../model/weather_model.dart';
import '../../services/weather_service.dart';

class GetWeatherCubit extends Cubit<WeatherState> {
  GetWeatherCubit():super(WeatherSuccessState());
  WeatherModel? weatherModel;
  getWeather({required String cityName}) async {
    try {
     weatherModel =
          await WeatherService(Dio()).getCurrentWeather(cityName: cityName);
      emit(WeatherSuccessState());
    } catch (e) {
      emit(WeatherFailureState());
    }
  }
}