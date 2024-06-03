# MealListProject

MealListProject, TheMealDB API'sini kullanarak yemek kategorilerini listeleyen ve her bir kategorinin yemeklerini gösteren bir Flutter uygulamasıdır.

## Özellikler

- Yemek kategorilerini listeleme
- Her bir kategorinin içindeki yemekleri gösterme
- Asenkron veri çekme ve kullanıcı dostu animasyonlu geçişler

## Kurulum

1. **Depoyu Klonlayın**:
    ```sh
    git clone https://github.com/handekyl/MealListProject.git
    cd MealListProject
    ```

2. **Gerekli Paketleri Yükleyin**:
    ```sh
    flutter pub get
    ```

3. **Uygulamayı Çalıştırın**:
    ```sh
    flutter run
    ```

## Kullanılan Teknolojiler ve Paketler

- [Flutter](https://flutter.dev/): Google tarafından geliştirilmiş açık kaynaklı UI yazılım geliştirme kiti.
- [TheMealDB API](https://www.themealdb.com/api.php): Yemek tarifleri ve bilgilerini sağlayan API.
- [http](https://pub.dev/packages/http): HTTP istekleri yapmak için kullanılan Dart paketi.

## Proje Yapısı

- **main.dart**: Uygulamanın başlangıç dosyası.
- **meal_api_service.dart**: TheMealDB API ile iletişim kuran servis dosyası.
- **models/**: API'den alınan verileri temsil eden model sınıfları.
- **screens/**: Uygulamanın farklı ekranlarını içeren dosyalar.
- **widgets/**: Uygulamanın yeniden kullanılabilir widget'larını içeren dosyalar.

## API Kullanımı

### TheMealDB API

API'den yemek kategorilerini ve yemek listesini çekmek için `meal_api_service.dart` dosyasını kullanıyoruz. Örnek bir API çağrısı aşağıdaki gibidir:

```dart
import 'package:http/http.dart' as http;
import 'dart:convert';

class MealApiService {
  final String _baseUrl = 'https://www.themealdb.com/api/json/v1/1';

  Future<List<String>> fetchMealCategories() async {
    final response = await http.get(Uri.parse('$_baseUrl/categories.php'));
    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      return (data['categories'] as List).map((category) => category['strCategory'] as String).toList();
    } else {
      throw Exception('Failed to load meal categories');
    }
  }
}
