import 'package:freezed_annotation/freezed_annotation.dart';

part 'service.freezed.dart';
part 'service.g.dart';

@freezed
class Service with _$Service {
  const factory Service({
    @Default(0) int id,
    @Default('') String name,
    @Default('') String description,
    @Default(0) int createdAt,
    @Default(0) int updatedAt,
  }) = _Service;

  factory Service.fromJson(Map<String, dynamic> json) => _$ServiceFromJson(json);
}
