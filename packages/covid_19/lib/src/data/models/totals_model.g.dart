// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'totals_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TotalsModel _$TotalsModelFromJson(Map<String, dynamic> json) {
  return TotalsModel(
    confirmed: json['confirmed'] as int,
    recovered: json['recovered'] as int,
    critical: json['critical'] as int,
    deaths: json['deaths'] as int,
    lastChange: DateTime.parse(json['lastChange'] as String),
    lastUpdate: DateTime.parse(json['lastUpdate'] as String),
  );
}

Map<String, dynamic> _$TotalsModelToJson(TotalsModel instance) =>
    <String, dynamic>{
      'confirmed': instance.confirmed,
      'recovered': instance.recovered,
      'critical': instance.critical,
      'deaths': instance.deaths,
      'lastChange': instance.lastChange.toIso8601String(),
      'lastUpdate': instance.lastUpdate.toIso8601String(),
    };
