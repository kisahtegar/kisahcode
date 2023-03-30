import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:http/http.dart';

import '../models/myproject_model.dart';
import '../models/timeline_model.dart';

class NetworkRemoteDataSource {
  /// baseUrl API for emulator we can use "http://10.0.2.2:3000". `NetworkService()`.
  static const baseUrl =
      "https://kisahcode-default-rtdb.asia-southeast1.firebasedatabase.app/";

  /// This function will fetching/get Timelines then return json decode as `List`
  static Future<List<TimelineModel>> fetchTimelines() async {
    try {
      final response = await get(Uri.parse("$baseUrl/timelines.json"));
      if (response.statusCode == 200) {
        List jsonResponse = json.decode(response.body);
        return jsonResponse
            .map((data) => TimelineModel.fromJson(data))
            .toList();
      } else {
        throw Exception('Unexpected error occured!');
      }
    } catch (e) {
      debugPrint("fetchTimelines: $e");
      return [];
    }
  }

  /// This function will fetching/get MyProjects then return json decode as `List`
  static Future<List<MyProjectModel>> fetchMyProjects() async {
    try {
      final response = await get(Uri.parse("$baseUrl/myprojects.json"));
      if (response.statusCode == 200) {
        List jsonResponse = json.decode(response.body);
        return jsonResponse
            .map((data) => MyProjectModel.fromJson(data))
            .toList();
      } else {
        throw Exception('Unexpected error occured!');
      }
    } catch (e) {
      debugPrint("fetchMyProjects: $e");
      return [];
    }
  }
}
