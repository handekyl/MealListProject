import 'dart:convert'; // JSON verilerini çözümlemek için kullanılan kütüphane
import 'package:http/http.dart'
    as http; // HTTP isteklerini yapmak için kullanılan kütüphane

// TheMealDB API ile etkileşim için servis sınıfı
class MealApiService {
  // API'nin temel URL'si
  static const _baseUrl = 'https://www.themealdb.com/api/json/v1/1';

  // Yemek kategorilerini alma fonksiyonu
  Future<List<String>> fetchMealCategories() async {
    // Belirtilen URL'ye GET isteği gönderme
    final response = await http.get(Uri.parse('$_baseUrl/categories.php'));

    // İstek başarılı ise
    if (response.statusCode == 200) {
      // JSON yanıtını çözümleme
      final data = json.decode(response.body);
      // Kategorileri içeren bir liste döndürme
      return (data['categories'] as List)
          .map((category) => category['strCategory'] as String)
          .toList();
    } else {
      // İstek başarısız ise hata fırlatma
      throw Exception('Kategoriler yüklenemedi');
    }
  }

  // Belirli bir kategoriye ait yemekleri alma fonksiyonu
  Future<List<Map<String, String>>> fetchMealsByCategory(
      String category) async {
    // Belirtilen kategoriye ait yemekleri almak için GET isteği gönderme
    final response =
        await http.get(Uri.parse('$_baseUrl/filter.php?c=$category'));

    // İstek başarılı ise
    if (response.statusCode == 200) {
      // JSON yanıtını çözümleme
      final data = json.decode(response.body);
      // Yemekleri içeren bir liste döndürme
      return (data['meals'] as List)
          .map((meal) => {
                'id': meal['idMeal'] as String, // Yemeğin ID'si
                'name': meal['strMeal'] as String, // Yemeğin adı
                'thumbnail':
                    meal['strMealThumb'] as String, // Yemeğin küçük resmi
              })
          .toList();
    } else {
      // İstek başarısız ise hata fırlatma
      throw Exception('Yemekler yüklenemedi');
    }
  }

  // Belirli bir yemeğin detaylarını alma fonksiyonu
  Future<Map<String, dynamic>> fetchMealDetails(String id) async {
    // Belirtilen yemeğin detaylarını almak için GET isteği gönderme
    final response = await http.get(Uri.parse('$_baseUrl/lookup.php?i=$id'));

    // İstek başarılı ise
    if (response.statusCode == 200) {
      // JSON yanıtını çözümleme
      final data = json.decode(response.body);
      // Yemeğin detaylarını döndürme
      return data['meals'][0];
    } else {
      // İstek başarısız ise hata fırlatma
      throw Exception('Yemek detayları yüklenemedi');
    }
  }
}
