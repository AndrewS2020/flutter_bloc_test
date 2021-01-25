// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'country.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Country _$CountryFromJson(Map<String, dynamic> json) {
  return Country(
    name: json['name'] as String,
    topLevelDomain:
        (json['topLevelDomain'] as List)?.map((e) => e as String)?.toList(),
    alpha2Code: json['alpha2Code'] as String,
    alpha3Code: json['alpha3Code'] as String,
    callingCodes:
        (json['callingCodes'] as List)?.map((e) => e as String)?.toList(),
    capital: json['capital'] as String,
    altSpellings:
        (json['altSpellings'] as List)?.map((e) => e as String)?.toList(),
    region: json['region'] as String,
    subregion: json['subregion'] as String,
    population: json['population'] as int,
    demonym: json['demonym'] as String,
    area: json['area'],
    gini: (json['gini'] as num)?.toDouble(),
    timezones: (json['timezones'] as List)?.map((e) => e as String)?.toList(),
    borders: (json['borders'] as List)?.map((e) => e as String)?.toList(),
    nativeName: json['nativeName'] as String,
    numericCode: json['numericCode'] as String,
    flag: json['flag'] as String,
    cioc: json['cioc'] as String,
  );
}

Map<String, dynamic> _$CountryToJson(Country instance) => <String, dynamic>{
      'name': instance.name,
      'topLevelDomain': instance.topLevelDomain,
      'alpha2Code': instance.alpha2Code,
      'alpha3Code': instance.alpha3Code,
      'callingCodes': instance.callingCodes,
      'capital': instance.capital,
      'altSpellings': instance.altSpellings,
      'region': instance.region,
      'subregion': instance.subregion,
      'population': instance.population,
      'demonym': instance.demonym,
      'area': instance.area,
      'gini': instance.gini,
      'timezones': instance.timezones,
      'borders': instance.borders,
      'nativeName': instance.nativeName,
      'numericCode': instance.numericCode,
      'flag': instance.flag,
      'cioc': instance.cioc,
    };
