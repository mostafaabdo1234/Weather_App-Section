class WeatherModel {
  final String cName;
  final DateTime dateTime;
  final String image;
  final double avgTemp;
  final double maxTemp;
  final double minTemp;
  final String weatherCondition;

  const WeatherModel(
      {required this.cName,
      required this.dateTime,
      required this.image,
      required this.avgTemp,
      required this.maxTemp,
      required this.minTemp,
      required this.weatherCondition});

  factory WeatherModel.fromJson(json) {
    return WeatherModel(
        cName: json['location']['name'],
        dateTime: DateTime.parse(json['current']['last_updated']),
        image: json['forecast']['forecastday'][0]['day']['condition']['icon'],
        avgTemp: json['forecast']['forecastday'][0]['day']['avgtemp_c'],
        maxTemp: json['forecast']['forecastday'][0]['day']['maxtemp_c'],
        minTemp: json['forecast']['forecastday'][0]['day']['mintemp_c'],
        weatherCondition: json['forecast']['forecastday'][0]['day']['condition']
            ['text']);
  }
}