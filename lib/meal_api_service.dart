import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class MealApiService with ChangeNotifier {
  final String _categoriesUrl =
      'https://www.themealdb.com/api/json/v1/1/list.php?c=list';
  final String _areasUrl =
      'https://www.themealdb.com/api/json/v1/1/list.php?a=list';

  List<String> _categories = [];
  List<String> _areas = [];
  bool _isLoading = false;
  String? _errorMessage;

  List<String> get categories => _categories;
  List<String> get areas => _areas;
  bool get isLoading => _isLoading;
  String? get errorMessage => _errorMessage;

  Future<void> fetchMealCategories() async {
    _setLoading(true);
    try {
      final response = await http.get(Uri.parse(_categoriesUrl));
      if (response.statusCode == 200) {
        Map<String, dynamic> data = json.decode(response.body);
        List<dynamic> categories = data['meals'];
        _categories = categories
            .map((category) => category['strCategory'] as String)
            .toList();
      } else {
        _errorMessage =
            'Failed to load meal categories: ${response.reasonPhrase}';
      }
    } catch (e) {
      _errorMessage = 'An error occurred: $e';
    } finally {
      _setLoading(false);
    }
    notifyListeners();
  }

  Future<void> fetchMealAreas() async {
    _setLoading(true);
    try {
      final response = await http.get(Uri.parse(_areasUrl));
      if (response.statusCode == 200) {
        Map<String, dynamic> data = json.decode(response.body);
        List<dynamic> areas = data['meals'];
        _areas = areas.map((area) => area['strArea'] as String).toList();
      } else {
        _errorMessage = 'Failed to load meal areas: ${response.reasonPhrase}';
      }
    } catch (e) {
      _errorMessage = 'An error occurred: $e';
    } finally {
      _setLoading(false);
    }
    notifyListeners();
  }

  void _setLoading(bool isLoading) {
    _isLoading = isLoading;
    notifyListeners();
  }
}
