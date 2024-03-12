part of 'colors.dart';

ColorDTO _$ColorDTOFromJson(Map<String, dynamic> json) => ColorDTO(
      name: json['name'] as String,
      value: json['value'] as String?,
    );

Map<String, dynamic> _$ColorDTOToJson(ColorDTO instance) => <String, dynamic>{
      'name': instance.name,
      'value': instance.value,
    };

// Содержит цвет и его характеристики, полученные с сервера