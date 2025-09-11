import 'dart:convert';

import 'package:injectable/injectable.dart';
import '../../domain/entities/exam_history_entity.dart';
import '../models/exam_history_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

abstract class ExamHistoryLocalDataSource {
  Future<void> save(ExamHistoryEntity history);
  Future<List<ExamHistoryEntity>> fetchAll();
  Future<void> clear();
}

@LazySingleton(as: ExamHistoryLocalDataSource)
class ExamHistoryLocalDataSourceImpl implements ExamHistoryLocalDataSource {
  static const String _key = 'exam_history_list';

  @override
  Future<void> save(ExamHistoryEntity history) async {
    final prefs = await SharedPreferences.getInstance();
    final listJsonString = prefs.getString(_key);
    final List<Map<String, dynamic>> list = listJsonString != null
        ? List<Map<String, dynamic>>.from(
            (json.decode(listJsonString) as List<dynamic>)
                .map((e) => Map<String, dynamic>.from(e as Map)))
        : <Map<String, dynamic>>[];

    list.add((history as ExamHistoryModel).toJson());
    await prefs.setString(_key, json.encode(list));
  }

  @override
  Future<List<ExamHistoryEntity>> fetchAll() async {
    final prefs = await SharedPreferences.getInstance();
    final listJsonString = prefs.getString(_key);
    if (listJsonString == null) return [];
    final List<dynamic> raw = json.decode(listJsonString) as List<dynamic>;
    return raw
        .map((e) => ExamHistoryModel.fromJson(Map<String, dynamic>.from(e)))
        .toList();
  }

  @override
  Future<void> clear() async {
    final prefs = await SharedPreferences.getInstance();
    // Write an empty list to be extra-safe across platforms/hot restarts
    await prefs.setString(_key, json.encode(<Map<String, dynamic>>[]));
  }
}


