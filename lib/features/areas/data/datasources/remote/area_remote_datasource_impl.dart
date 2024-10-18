// ignore_for_file: unused_field

import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:fast_immutable_collections/fast_immutable_collections.dart';
import 'package:talker_flutter/talker_flutter.dart';
import 'package:upmind_front_client/core/network/fixtures/fixture_reader.dart';
import 'package:upmind_front_client/features/areas/data/datasources/remote/area_remote_datasource.dart';
import 'package:upmind_front_client/features/areas/data/models/area_model.dart';

class AreaRemoteDatasourceImpl implements AreaRemoteDatasource {
  AreaRemoteDatasourceImpl(
    this._dio,
    this._talker,
  );

  final Dio _dio;
  final Talker _talker;

  @override
  Future<IList<AreaModel>> getAreas() async {
    // Загружаем фиктивные данные из файла
    final response = await fixture('areas.json');

    // Парсим JSON
    final data = jsonDecode(response) as Map<String, dynamic>;

    // Извлекаем список программ пользователя
    final areasRaw = data['areas'] as List<dynamic>;

    // Преобразуем данные в модель AreaModel
    final areas = areasRaw
        .map((json) => AreaModel.fromJson(json as Map<String, dynamic>))
        .toIList();

    // Возвращаем данные в виде IList
    return areas;
  }
}
