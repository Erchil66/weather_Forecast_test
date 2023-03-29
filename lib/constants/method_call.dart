import 'package:dio/dio.dart' as d;

class UrlsWeather {
  static const String baseUrl = "http://dataservice.accuweather.com",
      autoComplete = "$baseUrl/locations/v1/search",
      geoposition = "$baseUrl/locations/v1/cities/geoposition/search",
      todayForecast = "$baseUrl/forecasts/v1/daily/1day";
}

class Methodcall {
  static final dio = d.Dio();
  static Future<d.Response> diohandler(
      {String? apiString, bool? getorPost, dynamic postdata}) async {
    d.Response? response;
    /*
       *
       *  GET 
       * 
       */
    if (getorPost == true) {
      response = await dio.get(
        apiString!,
      );
    }

    /*
       *
       *  POST 
       * 
       */
    if (getorPost == false) {
      response = await dio.post(
        apiString!,
        data: postdata,
      );
    }

    return response!;
  }
}
