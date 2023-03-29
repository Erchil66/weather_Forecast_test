// To parse this JSON data, do
//
//     final locationPlace = locationPlaceFromJson(jsonString);

import 'dart:convert';

LocationPlace locationPlaceFromJson(String str) =>
    LocationPlace.fromJson(json.decode(str));

String locationPlaceToJson(LocationPlace data) => json.encode(data.toJson());

class LocationPlace {
  LocationPlace({
    this.version,
    this.key,
    this.type,
    this.rank,
    this.localizedName,
    this.englishName,
    this.primaryPostalCode,
    this.region,
    this.country,
    this.administrativeArea,
    this.timeZone,
    this.geoPosition,
    this.isAlias,
    this.supplementalAdminAreas,
    this.dataSets,
  });

  int? version;
  String? key;
  String? type;
  int? rank;
  String? localizedName;
  String? englishName;
  String? primaryPostalCode;
  Country? region;
  Country? country;
  AdministrativeArea? administrativeArea;
  TimeZone? timeZone;
  GeoPosition? geoPosition;
  bool? isAlias;
  List<dynamic>? supplementalAdminAreas;
  List<String>? dataSets;

  LocationPlace copyWith({
    int? version,
    String? key,
    String? type,
    int? rank,
    String? localizedName,
    String? englishName,
    String? primaryPostalCode,
    Country? region,
    Country? country,
    AdministrativeArea? administrativeArea,
    TimeZone? timeZone,
    GeoPosition? geoPosition,
    bool? isAlias,
    List<dynamic>? supplementalAdminAreas,
    List<String>? dataSets,
  }) =>
      LocationPlace(
        version: version ?? this.version,
        key: key ?? this.key,
        type: type ?? this.type,
        rank: rank ?? this.rank,
        localizedName: localizedName ?? this.localizedName,
        englishName: englishName ?? this.englishName,
        primaryPostalCode: primaryPostalCode ?? this.primaryPostalCode,
        region: region ?? this.region,
        country: country ?? this.country,
        administrativeArea: administrativeArea ?? this.administrativeArea,
        timeZone: timeZone ?? this.timeZone,
        geoPosition: geoPosition ?? this.geoPosition,
        isAlias: isAlias ?? this.isAlias,
        supplementalAdminAreas:
            supplementalAdminAreas ?? this.supplementalAdminAreas,
        dataSets: dataSets ?? this.dataSets,
      );

  factory LocationPlace.fromJson(Map<String, dynamic> json) => LocationPlace(
        version: json["Version"],
        key: json["Key"],
        type: json["Type"],
        rank: json["Rank"],
        localizedName: json["LocalizedName"],
        englishName: json["EnglishName"],
        primaryPostalCode: json["PrimaryPostalCode"],
        region:
            json["Region"] == null ? null : Country.fromJson(json["Region"]),
        country:
            json["Country"] == null ? null : Country.fromJson(json["Country"]),
        administrativeArea: json["AdministrativeArea"] == null
            ? null
            : AdministrativeArea.fromJson(json["AdministrativeArea"]),
        timeZone: json["TimeZone"] == null
            ? null
            : TimeZone.fromJson(json["TimeZone"]),
        geoPosition: json["GeoPosition"] == null
            ? null
            : GeoPosition.fromJson(json["GeoPosition"]),
        isAlias: json["IsAlias"],
        supplementalAdminAreas: json["SupplementalAdminAreas"] == null
            ? []
            : List<dynamic>.from(json["SupplementalAdminAreas"]!.map((x) => x)),
        dataSets: json["DataSets"] == null
            ? []
            : List<String>.from(json["DataSets"]!.map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "Version": version,
        "Key": key,
        "Type": type,
        "Rank": rank,
        "LocalizedName": localizedName,
        "EnglishName": englishName,
        "PrimaryPostalCode": primaryPostalCode,
        "Region": region?.toJson(),
        "Country": country?.toJson(),
        "AdministrativeArea": administrativeArea?.toJson(),
        "TimeZone": timeZone?.toJson(),
        "GeoPosition": geoPosition?.toJson(),
        "IsAlias": isAlias,
        "SupplementalAdminAreas": supplementalAdminAreas == null
            ? []
            : List<dynamic>.from(supplementalAdminAreas!.map((x) => x)),
        "DataSets":
            dataSets == null ? [] : List<dynamic>.from(dataSets!.map((x) => x)),
      };
}

class AdministrativeArea {
  AdministrativeArea({
    this.id,
    this.localizedName,
    this.englishName,
    this.level,
    this.localizedType,
    this.englishType,
    this.countryId,
  });

  String? id;
  String? localizedName;
  String? englishName;
  int? level;
  String? localizedType;
  String? englishType;
  String? countryId;

  AdministrativeArea copyWith({
    String? id,
    String? localizedName,
    String? englishName,
    int? level,
    String? localizedType,
    String? englishType,
    String? countryId,
  }) =>
      AdministrativeArea(
        id: id ?? this.id,
        localizedName: localizedName ?? this.localizedName,
        englishName: englishName ?? this.englishName,
        level: level ?? this.level,
        localizedType: localizedType ?? this.localizedType,
        englishType: englishType ?? this.englishType,
        countryId: countryId ?? this.countryId,
      );

  factory AdministrativeArea.fromJson(Map<String, dynamic> json) =>
      AdministrativeArea(
        id: json["ID"],
        localizedName: json["LocalizedName"],
        englishName: json["EnglishName"],
        level: json["Level"],
        localizedType: json["LocalizedType"],
        englishType: json["EnglishType"],
        countryId: json["CountryID"],
      );

  Map<String, dynamic> toJson() => {
        "ID": id,
        "LocalizedName": localizedName,
        "EnglishName": englishName,
        "Level": level,
        "LocalizedType": localizedType,
        "EnglishType": englishType,
        "CountryID": countryId,
      };
}

class Country {
  Country({
    this.id,
    this.localizedName,
    this.englishName,
  });

  String? id;
  String? localizedName;
  String? englishName;

  Country copyWith({
    String? id,
    String? localizedName,
    String? englishName,
  }) =>
      Country(
        id: id ?? this.id,
        localizedName: localizedName ?? this.localizedName,
        englishName: englishName ?? this.englishName,
      );

  factory Country.fromJson(Map<String, dynamic> json) => Country(
        id: json["ID"],
        localizedName: json["LocalizedName"],
        englishName: json["EnglishName"],
      );

  Map<String, dynamic> toJson() => {
        "ID": id,
        "LocalizedName": localizedName,
        "EnglishName": englishName,
      };
}

class GeoPosition {
  GeoPosition({
    this.latitude,
    this.longitude,
    this.elevation,
  });

  double? latitude;
  double? longitude;
  Elevation? elevation;

  GeoPosition copyWith({
    double? latitude,
    double? longitude,
    Elevation? elevation,
  }) =>
      GeoPosition(
        latitude: latitude ?? this.latitude,
        longitude: longitude ?? this.longitude,
        elevation: elevation ?? this.elevation,
      );

  factory GeoPosition.fromJson(Map<String, dynamic> json) => GeoPosition(
        latitude: json["Latitude"]?.toDouble(),
        longitude: json["Longitude"]?.toDouble(),
        elevation: json["Elevation"] == null
            ? null
            : Elevation.fromJson(json["Elevation"]),
      );

  Map<String, dynamic> toJson() => {
        "Latitude": latitude,
        "Longitude": longitude,
        "Elevation": elevation?.toJson(),
      };
}

class Elevation {
  Elevation({
    this.metric,
    this.imperial,
  });

  Imperial? metric;
  Imperial? imperial;

  Elevation copyWith({
    Imperial? metric,
    Imperial? imperial,
  }) =>
      Elevation(
        metric: metric ?? this.metric,
        imperial: imperial ?? this.imperial,
      );

  factory Elevation.fromJson(Map<String, dynamic> json) => Elevation(
        metric:
            json["Metric"] == null ? null : Imperial.fromJson(json["Metric"]),
        imperial: json["Imperial"] == null
            ? null
            : Imperial.fromJson(json["Imperial"]),
      );

  Map<String, dynamic> toJson() => {
        "Metric": metric?.toJson(),
        "Imperial": imperial?.toJson(),
      };
}

class Imperial {
  Imperial({
    this.value,
    this.unit,
    this.unitType,
  });

  int? value;
  String? unit;
  int? unitType;

  Imperial copyWith({
    int? value,
    String? unit,
    int? unitType,
  }) =>
      Imperial(
        value: value ?? this.value,
        unit: unit ?? this.unit,
        unitType: unitType ?? this.unitType,
      );

  factory Imperial.fromJson(Map<String, dynamic> json) => Imperial(
        value: json["Value"],
        unit: json["Unit"],
        unitType: json["UnitType"],
      );

  Map<String, dynamic> toJson() => {
        "Value": value,
        "Unit": unit,
        "UnitType": unitType,
      };
}

class TimeZone {
  TimeZone({
    this.code,
    this.name,
    this.gmtOffset,
    this.isDaylightSaving,
    this.nextOffsetChange,
  });

  String? code;
  String? name;
  int? gmtOffset;
  bool? isDaylightSaving;
  dynamic nextOffsetChange;

  TimeZone copyWith({
    String? code,
    String? name,
    int? gmtOffset,
    bool? isDaylightSaving,
    dynamic nextOffsetChange,
  }) =>
      TimeZone(
        code: code ?? this.code,
        name: name ?? this.name,
        gmtOffset: gmtOffset ?? this.gmtOffset,
        isDaylightSaving: isDaylightSaving ?? this.isDaylightSaving,
        nextOffsetChange: nextOffsetChange ?? this.nextOffsetChange,
      );

  factory TimeZone.fromJson(Map<String, dynamic> json) => TimeZone(
        code: json["Code"],
        name: json["Name"],
        gmtOffset: json["GmtOffset"],
        isDaylightSaving: json["IsDaylightSaving"],
        nextOffsetChange: json["NextOffsetChange"],
      );

  Map<String, dynamic> toJson() => {
        "Code": code,
        "Name": name,
        "GmtOffset": gmtOffset,
        "IsDaylightSaving": isDaylightSaving,
        "NextOffsetChange": nextOffsetChange,
      };
}
