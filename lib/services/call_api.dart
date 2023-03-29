import 'package:forecast/constants/constants.dart';
import 'package:forecast/models/models.dart';

class ServiceWeatherCall {
  static const apiKey = "?apikey=EI6bQIGiXtbpLSrLPdDFVXWHigTwUurX";

  /*
   * 
   * Get the current position by lat long 
   * 
   */
  static Future<LocationPlace> returnKeyLocation(
      {double? lat, double? long}) async {
    final result = await Methodcall.diohandler(
      getorPost: true,
      apiString: "${UrlsWeather.geoposition}$apiKey&q=$lat,$long",
    );

    if (result.data != null) {
      return LocationPlace.fromJson(result.data);
    } else {
      return LocationPlace();
    }
  }

  /*
   * 
   * Get  Current Today Forecast
   * 
   */
  static Future<Forecast> getTodayForecast({
    String? locationkey,
  }) async {
    final result = await Methodcall.diohandler(
        getorPost: true,
        apiString:
            "${UrlsWeather.todayForecast}/$locationkey$apiKey&details=true");
    if (result.data != null) {
      return Forecast.fromJson(result.data);
    } else {
      return Forecast();
    }
  }

  /*
   * 
   * Search Location
   * 
   */
  static Future<List<LocationPlace>> autoComplete({String? textSearch}) async {
    final result = await Methodcall.diohandler(
      getorPost: true,
      apiString:
          "${UrlsWeather.autoComplete}$apiKey&q=$textSearch&details=fase",
    );

    if (result.statusCode == 200) {
      final List<dynamic> list = result.data;

      return list.map((e) => LocationPlace.fromJson(e)).toList();
    } else {
      return [];
    }
  }
}
