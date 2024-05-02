// activity_model.dart
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class ActivityModel extends ChangeNotifier {
  String url = "https://www.boredapi.com/api/activity";

  String aktivitas;
  String jenis;

  ActivityModel({required this.aktivitas, required this.jenis});

  void setFromJson(Map<String, dynamic> json) {
    aktivitas = json['activity'];
    jenis = json['type'];
    notifyListeners();
  }

  Future<void> fetchData() async {
    final response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      setFromJson(jsonDecode(response.body));
    } else {
      throw Exception('Gagal load');
    }
  }
}
