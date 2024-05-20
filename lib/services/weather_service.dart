import 'package:dio/dio.dart';
import 'package:weather_application/model/weather_model.dart';

class WeatherService {
  final Dio dio;
  final String baseUrl = 'https://api.weatherapi.com/v1';
  final String apiKey = '5f0a4962ac1d44f4811150942241104';
  WeatherService(this.dio);
  Future<WeatherModel> getCurrentWeather({required String cityName}) async {
    try {
      var response = await dio
          .get('$baseUrl/forecast.json?key=$apiKey&q=$cityName&days=1');
      WeatherModel weatherModel = WeatherModel.fromJson(response.data);
      return weatherModel;
    } on DioException catch (e) {
      final String errMessage = e.response?.data['error']['message'] ??
          'oops there was an error, try later';
      throw Exception(errMessage);
    } catch (e) {
      throw Exception('oops there was an error, try later');
    }
  }
}