import 'package:forecast/constants/constants.dart';
import 'package:forecast/models/models.dart';

class ServiceWeatherCall {
  static const apiKey = "?apikey=EI6bQIGiXtbpLSrLPdDFVXWHigTwUurX";

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
