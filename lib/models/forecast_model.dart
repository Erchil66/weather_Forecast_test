// To parse this JSON data, do
//
//     final forecast = forecastFromJson(jsonString);

import 'dart:convert';

Forecast forecastFromJson(String str) => Forecast.fromJson(json.decode(str));

String forecastToJson(Forecast data) => json.encode(data.toJson());

class Forecast {
  Forecast({
    this.headline,
    this.dailyForecasts,
  });

  Headline? headline;
  List<DailyForecast>? dailyForecasts;

  Forecast copyWith({
    Headline? headline,
    List<DailyForecast>? dailyForecasts,
  }) =>
      Forecast(
        headline: headline ?? this.headline,
        dailyForecasts: dailyForecasts ?? this.dailyForecasts,
      );

  factory Forecast.fromJson(Map<String, dynamic> json) => Forecast(
        headline: json["Headline"] == null
            ? null
            : Headline.fromJson(json["Headline"]),
        dailyForecasts: json["DailyForecasts"] == null
            ? []
            : List<DailyForecast>.from(
                json["DailyForecasts"]!.map((x) => DailyForecast.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "Headline": headline?.toJson(),
        "DailyForecasts": dailyForecasts == null
            ? []
            : List<dynamic>.from(dailyForecasts!.map((x) => x.toJson())),
      };
}

class DailyForecast {
  DailyForecast({
    this.date,
    this.epochDate,
    this.sun,
    this.moon,
    this.temperature,
    this.realFeelTemperature,
    this.realFeelTemperatureShade,
    this.hoursOfSun,
    this.degreeDaySummary,
    this.airAndPollen,
    this.day,
    this.night,
    this.sources,
  });

  DateTime? date;
  int? epochDate;
  Sun? sun;
  Moon? moon;
  RealFeelTemperature? temperature;
  RealFeelTemperature? realFeelTemperature;
  RealFeelTemperature? realFeelTemperatureShade;
  double? hoursOfSun;
  DegreeDaySummary? degreeDaySummary;
  List<AirAndPollen>? airAndPollen;
  Day? day;
  Day? night;
  List<String>? sources;

  DailyForecast copyWith({
    DateTime? date,
    int? epochDate,
    Sun? sun,
    Moon? moon,
    RealFeelTemperature? temperature,
    RealFeelTemperature? realFeelTemperature,
    RealFeelTemperature? realFeelTemperatureShade,
    double? hoursOfSun,
    DegreeDaySummary? degreeDaySummary,
    List<AirAndPollen>? airAndPollen,
    Day? day,
    Day? night,
    List<String>? sources,
  }) =>
      DailyForecast(
        date: date ?? this.date,
        epochDate: epochDate ?? this.epochDate,
        sun: sun ?? this.sun,
        moon: moon ?? this.moon,
        temperature: temperature ?? this.temperature,
        realFeelTemperature: realFeelTemperature ?? this.realFeelTemperature,
        realFeelTemperatureShade:
            realFeelTemperatureShade ?? this.realFeelTemperatureShade,
        hoursOfSun: hoursOfSun ?? this.hoursOfSun,
        degreeDaySummary: degreeDaySummary ?? this.degreeDaySummary,
        airAndPollen: airAndPollen ?? this.airAndPollen,
        day: day ?? this.day,
        night: night ?? this.night,
        sources: sources ?? this.sources,
      );

  factory DailyForecast.fromJson(Map<String, dynamic> json) => DailyForecast(
        date: json["Date"] == null ? null : DateTime.parse(json["Date"]),
        epochDate: json["EpochDate"],
        sun: json["Sun"] == null ? null : Sun.fromJson(json["Sun"]),
        moon: json["Moon"] == null ? null : Moon.fromJson(json["Moon"]),
        temperature: json["Temperature"] == null
            ? null
            : RealFeelTemperature.fromJson(json["Temperature"]),
        realFeelTemperature: json["RealFeelTemperature"] == null
            ? null
            : RealFeelTemperature.fromJson(json["RealFeelTemperature"]),
        realFeelTemperatureShade: json["RealFeelTemperatureShade"] == null
            ? null
            : RealFeelTemperature.fromJson(json["RealFeelTemperatureShade"]),
        hoursOfSun: json["HoursOfSun"]?.toDouble(),
        degreeDaySummary: json["DegreeDaySummary"] == null
            ? null
            : DegreeDaySummary.fromJson(json["DegreeDaySummary"]),
        airAndPollen: json["AirAndPollen"] == null
            ? []
            : List<AirAndPollen>.from(
                json["AirAndPollen"]!.map((x) => AirAndPollen.fromJson(x))),
        day: json["Day"] == null ? null : Day.fromJson(json["Day"]),
        night: json["Night"] == null ? null : Day.fromJson(json["Night"]),
        sources: json["Sources"] == null
            ? []
            : List<String>.from(json["Sources"]!.map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "Date": date?.toIso8601String(),
        "EpochDate": epochDate,
        "Sun": sun?.toJson(),
        "Moon": moon?.toJson(),
        "Temperature": temperature?.toJson(),
        "RealFeelTemperature": realFeelTemperature?.toJson(),
        "RealFeelTemperatureShade": realFeelTemperatureShade?.toJson(),
        "HoursOfSun": hoursOfSun,
        "DegreeDaySummary": degreeDaySummary?.toJson(),
        "AirAndPollen": airAndPollen == null
            ? []
            : List<dynamic>.from(airAndPollen!.map((x) => x.toJson())),
        "Day": day?.toJson(),
        "Night": night?.toJson(),
        "Sources":
            sources == null ? [] : List<dynamic>.from(sources!.map((x) => x)),
      };
}

class AirAndPollen {
  AirAndPollen({
    this.name,
    this.value,
    this.category,
    this.categoryValue,
    this.type,
  });

  String? name;
  int? value;
  String? category;
  int? categoryValue;
  String? type;

  AirAndPollen copyWith({
    String? name,
    int? value,
    String? category,
    int? categoryValue,
    String? type,
  }) =>
      AirAndPollen(
        name: name ?? this.name,
        value: value ?? this.value,
        category: category ?? this.category,
        categoryValue: categoryValue ?? this.categoryValue,
        type: type ?? this.type,
      );

  factory AirAndPollen.fromJson(Map<String, dynamic> json) => AirAndPollen(
        name: json["Name"],
        value: json["Value"],
        category: json["Category"],
        categoryValue: json["CategoryValue"],
        type: json["Type"],
      );

  Map<String, dynamic> toJson() => {
        "Name": name,
        "Value": value,
        "Category": category,
        "CategoryValue": categoryValue,
        "Type": type,
      };
}

class Day {
  Day({
    this.icon,
    this.iconPhrase,
    this.hasPrecipitation,
    this.precipitationType,
    this.precipitationIntensity,
    this.shortPhrase,
    this.longPhrase,
    this.precipitationProbability,
    this.thunderstormProbability,
    this.rainProbability,
    this.snowProbability,
    this.iceProbability,
    this.wind,
    this.windGust,
    this.totalLiquid,
    this.rain,
    this.snow,
    this.ice,
    this.hoursOfPrecipitation,
    this.hoursOfRain,
    this.hoursOfSnow,
    this.hoursOfIce,
    this.cloudCover,
    this.evapotranspiration,
    this.solarIrradiance,
  });

  int? icon;
  String? iconPhrase;
  bool? hasPrecipitation;
  String? precipitationType;
  String? precipitationIntensity;
  String? shortPhrase;
  String? longPhrase;
  int? precipitationProbability;
  int? thunderstormProbability;
  int? rainProbability;
  int? snowProbability;
  int? iceProbability;
  Wind? wind;
  Wind? windGust;
  Evapotranspiration? totalLiquid;
  Evapotranspiration? rain;
  Evapotranspiration? snow;
  Evapotranspiration? ice;
  int? hoursOfPrecipitation;
  int? hoursOfRain;
  int? hoursOfSnow;
  int? hoursOfIce;
  int? cloudCover;
  Evapotranspiration? evapotranspiration;
  Evapotranspiration? solarIrradiance;

  Day copyWith({
    int? icon,
    String? iconPhrase,
    bool? hasPrecipitation,
    String? precipitationType,
    String? precipitationIntensity,
    String? shortPhrase,
    String? longPhrase,
    int? precipitationProbability,
    int? thunderstormProbability,
    int? rainProbability,
    int? snowProbability,
    int? iceProbability,
    Wind? wind,
    Wind? windGust,
    Evapotranspiration? totalLiquid,
    Evapotranspiration? rain,
    Evapotranspiration? snow,
    Evapotranspiration? ice,
    int? hoursOfPrecipitation,
    int? hoursOfRain,
    int? hoursOfSnow,
    int? hoursOfIce,
    int? cloudCover,
    Evapotranspiration? evapotranspiration,
    Evapotranspiration? solarIrradiance,
  }) =>
      Day(
        icon: icon ?? this.icon,
        iconPhrase: iconPhrase ?? this.iconPhrase,
        hasPrecipitation: hasPrecipitation ?? this.hasPrecipitation,
        precipitationType: precipitationType ?? this.precipitationType,
        precipitationIntensity:
            precipitationIntensity ?? this.precipitationIntensity,
        shortPhrase: shortPhrase ?? this.shortPhrase,
        longPhrase: longPhrase ?? this.longPhrase,
        precipitationProbability:
            precipitationProbability ?? this.precipitationProbability,
        thunderstormProbability:
            thunderstormProbability ?? this.thunderstormProbability,
        rainProbability: rainProbability ?? this.rainProbability,
        snowProbability: snowProbability ?? this.snowProbability,
        iceProbability: iceProbability ?? this.iceProbability,
        wind: wind ?? this.wind,
        windGust: windGust ?? this.windGust,
        totalLiquid: totalLiquid ?? this.totalLiquid,
        rain: rain ?? this.rain,
        snow: snow ?? this.snow,
        ice: ice ?? this.ice,
        hoursOfPrecipitation: hoursOfPrecipitation ?? this.hoursOfPrecipitation,
        hoursOfRain: hoursOfRain ?? this.hoursOfRain,
        hoursOfSnow: hoursOfSnow ?? this.hoursOfSnow,
        hoursOfIce: hoursOfIce ?? this.hoursOfIce,
        cloudCover: cloudCover ?? this.cloudCover,
        evapotranspiration: evapotranspiration ?? this.evapotranspiration,
        solarIrradiance: solarIrradiance ?? this.solarIrradiance,
      );

  factory Day.fromJson(Map<String, dynamic> json) => Day(
        icon: json["Icon"],
        iconPhrase: json["IconPhrase"],
        hasPrecipitation: json["HasPrecipitation"],
        precipitationType: json["PrecipitationType"],
        precipitationIntensity: json["PrecipitationIntensity"],
        shortPhrase: json["ShortPhrase"],
        longPhrase: json["LongPhrase"],
        precipitationProbability: json["PrecipitationProbability"],
        thunderstormProbability: json["ThunderstormProbability"],
        rainProbability: json["RainProbability"],
        snowProbability: json["SnowProbability"],
        iceProbability: json["IceProbability"],
        wind: json["Wind"] == null ? null : Wind.fromJson(json["Wind"]),
        windGust:
            json["WindGust"] == null ? null : Wind.fromJson(json["WindGust"]),
        totalLiquid: json["TotalLiquid"] == null
            ? null
            : Evapotranspiration.fromJson(json["TotalLiquid"]),
        rain: json["Rain"] == null
            ? null
            : Evapotranspiration.fromJson(json["Rain"]),
        snow: json["Snow"] == null
            ? null
            : Evapotranspiration.fromJson(json["Snow"]),
        ice: json["Ice"] == null
            ? null
            : Evapotranspiration.fromJson(json["Ice"]),
        hoursOfPrecipitation: json["HoursOfPrecipitation"],
        hoursOfRain: json["HoursOfRain"],
        hoursOfSnow: json["HoursOfSnow"],
        hoursOfIce: json["HoursOfIce"],
        cloudCover: json["CloudCover"],
        evapotranspiration: json["Evapotranspiration"] == null
            ? null
            : Evapotranspiration.fromJson(json["Evapotranspiration"]),
        solarIrradiance: json["SolarIrradiance"] == null
            ? null
            : Evapotranspiration.fromJson(json["SolarIrradiance"]),
      );

  Map<String, dynamic> toJson() => {
        "Icon": icon,
        "IconPhrase": iconPhrase,
        "HasPrecipitation": hasPrecipitation,
        "PrecipitationType": precipitationType,
        "PrecipitationIntensity": precipitationIntensity,
        "ShortPhrase": shortPhrase,
        "LongPhrase": longPhrase,
        "PrecipitationProbability": precipitationProbability,
        "ThunderstormProbability": thunderstormProbability,
        "RainProbability": rainProbability,
        "SnowProbability": snowProbability,
        "IceProbability": iceProbability,
        "Wind": wind?.toJson(),
        "WindGust": windGust?.toJson(),
        "TotalLiquid": totalLiquid?.toJson(),
        "Rain": rain?.toJson(),
        "Snow": snow?.toJson(),
        "Ice": ice?.toJson(),
        "HoursOfPrecipitation": hoursOfPrecipitation,
        "HoursOfRain": hoursOfRain,
        "HoursOfSnow": hoursOfSnow,
        "HoursOfIce": hoursOfIce,
        "CloudCover": cloudCover,
        "Evapotranspiration": evapotranspiration?.toJson(),
        "SolarIrradiance": solarIrradiance?.toJson(),
      };
}

class Evapotranspiration {
  Evapotranspiration({
    this.value,
    this.unit,
    this.unitType,
    this.phrase,
  });

  double? value;
  Unit? unit;
  int? unitType;
  String? phrase;

  Evapotranspiration copyWith({
    double? value,
    Unit? unit,
    int? unitType,
    String? phrase,
  }) =>
      Evapotranspiration(
        value: value ?? this.value,
        unit: unit ?? this.unit,
        unitType: unitType ?? this.unitType,
        phrase: phrase ?? this.phrase,
      );

  factory Evapotranspiration.fromJson(Map<String, dynamic> json) =>
      Evapotranspiration(
        value: json["Value"]?.toDouble(),
        unit: unitValues.map[json["Unit"]]!,
        unitType: json["UnitType"],
        phrase: json["Phrase"],
      );

  Map<String, dynamic> toJson() => {
        "Value": value,
        "Unit": unitValues.reverse[unit],
        "UnitType": unitType,
        "Phrase": phrase,
      };
}

enum Unit { IN, W_M, MI_H, F }

final unitValues = EnumValues(
    {"F": Unit.F, "in": Unit.IN, "mi/h": Unit.MI_H, "W/m²": Unit.W_M});

class Wind {
  Wind({
    this.speed,
    this.direction,
  });

  Evapotranspiration? speed;
  Direction? direction;

  Wind copyWith({
    Evapotranspiration? speed,
    Direction? direction,
  }) =>
      Wind(
        speed: speed ?? this.speed,
        direction: direction ?? this.direction,
      );

  factory Wind.fromJson(Map<String, dynamic> json) => Wind(
        speed: json["Speed"] == null
            ? null
            : Evapotranspiration.fromJson(json["Speed"]),
        direction: json["Direction"] == null
            ? null
            : Direction.fromJson(json["Direction"]),
      );

  Map<String, dynamic> toJson() => {
        "Speed": speed?.toJson(),
        "Direction": direction?.toJson(),
      };
}

class Direction {
  Direction({
    this.degrees,
    this.localized,
    this.english,
  });

  int? degrees;
  String? localized;
  String? english;

  Direction copyWith({
    int? degrees,
    String? localized,
    String? english,
  }) =>
      Direction(
        degrees: degrees ?? this.degrees,
        localized: localized ?? this.localized,
        english: english ?? this.english,
      );

  factory Direction.fromJson(Map<String, dynamic> json) => Direction(
        degrees: json["Degrees"],
        localized: json["Localized"],
        english: json["English"],
      );

  Map<String, dynamic> toJson() => {
        "Degrees": degrees,
        "Localized": localized,
        "English": english,
      };
}

class DegreeDaySummary {
  DegreeDaySummary({
    this.heating,
    this.cooling,
  });

  Evapotranspiration? heating;
  Evapotranspiration? cooling;

  DegreeDaySummary copyWith({
    Evapotranspiration? heating,
    Evapotranspiration? cooling,
  }) =>
      DegreeDaySummary(
        heating: heating ?? this.heating,
        cooling: cooling ?? this.cooling,
      );

  factory DegreeDaySummary.fromJson(Map<String, dynamic> json) =>
      DegreeDaySummary(
        heating: json["Heating"] == null
            ? null
            : Evapotranspiration.fromJson(json["Heating"]),
        cooling: json["Cooling"] == null
            ? null
            : Evapotranspiration.fromJson(json["Cooling"]),
      );

  Map<String, dynamic> toJson() => {
        "Heating": heating?.toJson(),
        "Cooling": cooling?.toJson(),
      };
}

class Moon {
  Moon({
    this.rise,
    this.epochRise,
    this.moonSet,
    this.epochSet,
    this.phase,
    this.age,
  });

  DateTime? rise;
  int? epochRise;
  DateTime? moonSet;
  int? epochSet;
  String? phase;
  int? age;

  Moon copyWith({
    DateTime? rise,
    int? epochRise,
    DateTime? moonSet,
    int? epochSet,
    String? phase,
    int? age,
  }) =>
      Moon(
        rise: rise ?? this.rise,
        epochRise: epochRise ?? this.epochRise,
        moonSet: moonSet ?? this.moonSet,
        epochSet: epochSet ?? this.epochSet,
        phase: phase ?? this.phase,
        age: age ?? this.age,
      );

  factory Moon.fromJson(Map<String, dynamic> json) => Moon(
        rise: json["Rise"] == null ? null : DateTime.parse(json["Rise"]),
        epochRise: json["EpochRise"],
        moonSet: json["Set"] == null ? null : DateTime.parse(json["Set"]),
        epochSet: json["EpochSet"],
        phase: json["Phase"],
        age: json["Age"],
      );

  Map<String, dynamic> toJson() => {
        "Rise": rise?.toIso8601String(),
        "EpochRise": epochRise,
        "Set": moonSet?.toIso8601String(),
        "EpochSet": epochSet,
        "Phase": phase,
        "Age": age,
      };
}

class RealFeelTemperature {
  RealFeelTemperature({
    this.minimum,
    this.maximum,
  });

  Evapotranspiration? minimum;
  Evapotranspiration? maximum;

  RealFeelTemperature copyWith({
    Evapotranspiration? minimum,
    Evapotranspiration? maximum,
  }) =>
      RealFeelTemperature(
        minimum: minimum ?? this.minimum,
        maximum: maximum ?? this.maximum,
      );

  factory RealFeelTemperature.fromJson(Map<String, dynamic> json) =>
      RealFeelTemperature(
        minimum: json["Minimum"] == null
            ? null
            : Evapotranspiration.fromJson(json["Minimum"]),
        maximum: json["Maximum"] == null
            ? null
            : Evapotranspiration.fromJson(json["Maximum"]),
      );

  Map<String, dynamic> toJson() => {
        "Minimum": minimum?.toJson(),
        "Maximum": maximum?.toJson(),
      };
}

class Sun {
  Sun({
    this.rise,
    this.epochRise,
    this.sunSet,
    this.epochSet,
  });

  DateTime? rise;
  int? epochRise;
  DateTime? sunSet;
  int? epochSet;

  Sun copyWith({
    DateTime? rise,
    int? epochRise,
    DateTime? sunSet,
    int? epochSet,
  }) =>
      Sun(
        rise: rise ?? this.rise,
        epochRise: epochRise ?? this.epochRise,
        sunSet: sunSet ?? this.sunSet,
        epochSet: epochSet ?? this.epochSet,
      );

  factory Sun.fromJson(Map<String, dynamic> json) => Sun(
        rise: json["Rise"] == null ? null : DateTime.parse(json["Rise"]),
        epochRise: json["EpochRise"],
        sunSet: json["Set"] == null ? null : DateTime.parse(json["Set"]),
        epochSet: json["EpochSet"],
      );

  Map<String, dynamic> toJson() => {
        "Rise": rise?.toIso8601String(),
        "EpochRise": epochRise,
        "Set": sunSet?.toIso8601String(),
        "EpochSet": epochSet,
      };
}

class Headline {
  Headline({
    this.effectiveDate,
    this.effectiveEpochDate,
    this.severity,
    this.text,
    this.category,
    this.endDate,
    this.endEpochDate,
    this.mobileLink,
    this.link,
  });

  DateTime? effectiveDate;
  int? effectiveEpochDate;
  int? severity;
  String? text;
  String? category;
  DateTime? endDate;
  int? endEpochDate;
  String? mobileLink;
  String? link;

  Headline copyWith({
    DateTime? effectiveDate,
    int? effectiveEpochDate,
    int? severity,
    String? text,
    String? category,
    DateTime? endDate,
    int? endEpochDate,
    String? mobileLink,
    String? link,
  }) =>
      Headline(
        effectiveDate: effectiveDate ?? this.effectiveDate,
        effectiveEpochDate: effectiveEpochDate ?? this.effectiveEpochDate,
        severity: severity ?? this.severity,
        text: text ?? this.text,
        category: category ?? this.category,
        endDate: endDate ?? this.endDate,
        endEpochDate: endEpochDate ?? this.endEpochDate,
        mobileLink: mobileLink ?? this.mobileLink,
        link: link ?? this.link,
      );

  factory Headline.fromJson(Map<String, dynamic> json) => Headline(
        effectiveDate: json["EffectiveDate"] == null
            ? null
            : DateTime.parse(json["EffectiveDate"]),
        effectiveEpochDate: json["EffectiveEpochDate"],
        severity: json["Severity"],
        text: json["Text"],
        category: json["Category"],
        endDate:
            json["EndDate"] == null ? null : DateTime.parse(json["EndDate"]),
        endEpochDate: json["EndEpochDate"],
        mobileLink: json["MobileLink"],
        link: json["Link"],
      );

  Map<String, dynamic> toJson() => {
        "EffectiveDate": effectiveDate?.toIso8601String(),
        "EffectiveEpochDate": effectiveEpochDate,
        "Severity": severity,
        "Text": text,
        "Category": category,
        "EndDate": endDate?.toIso8601String(),
        "EndEpochDate": endEpochDate,
        "MobileLink": mobileLink,
        "Link": link,
      };
}

class EnumValues<T> {
  Map<String, T> map;
  late Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    reverseMap = map.map((k, v) => MapEntry(v, k));
    return reverseMap;
  }
}
