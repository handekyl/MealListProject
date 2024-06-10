Here is the updated README with the specified details:

---

# Flutter Application: Meal Categories

## Overview

This Flutter application fetches and displays meal categories using TheMealDB API. The application is designed to showcase asynchronous programming, animated transitions, and effective API integration.

## Features

- Display meal categories from TheMealDB API.
- Asynchronous data fetching.
- Animated transitions between screens.

## Requirements

- Flutter SDK
- Dart programming language
- API key for TheMealDB API

## Setup

1. **Clone the repository:**
   ```bash
   git clone <repository_url>
   cd <repository_directory>
   ```

2. **Install dependencies:**
   ```bash
   flutter pub get
   ```

3. **Configure API key:**
   - Open `lib/api_keys.dart` (create the file if it doesn't exist).
   - Add your API key:
     ```dart
     const String mealApiKey = 'your_meal_api_key';
     ```

4. **Run the application:**
   ```bash
   flutter run
   ```

## File Structure

- `main.dart`: Entry point of the application.
- `meal_api_service.dart`: Service file for fetching meal categories from TheMealDB API.
- `lib/`: Contains all the Dart files for the application.
  - `models/`: Data models for the API.
  - `screens/`: UI screens for displaying meal categories.
  - `widgets/`: Reusable widgets.
  - `api_keys.dart`: File to store API keys.

## Usage

### Fetching Meal Categories

To fetch and display meal categories:
1. Ensure the `meal_api_service.dart` file contains the correct API endpoint and logic for fetching meal categories.
2. Use the service in the appropriate screen/widget to display the categories.

## Contributing

Contributions are welcome! Please create a pull request or open an issue to discuss your changes.

## License

This project is licensed under the MIT License. See the LICENSE file for more details.

## Contact

For any questions or issues, please contact Hande Kayalı.

## The University informations

- **University:** Erciyes University
- **Department:** Computer Engineering
- **Lesson:** Mobile Application Development
- **Lecturer:** Asst. Prof. Fehim Köylü
---

# Flutter Uygulaması: Yemek Kategorileri

## Genel Bakış

Bu Flutter uygulaması, TheMealDB API kullanarak yemek kategorilerini alır ve görüntüler. Uygulama, asenkron programlama, animasyonlu geçişler ve etkili API entegrasyonunu sergilemek için tasarlanmıştır.

## Özellikler

- TheMealDB API'den yemek kategorilerini görüntüleyin.
- Asenkron veri alma.
- Ekranlar arasında animasyonlu geçişler.

## Gereksinimler

- Flutter SDK
- Dart programlama dili
- TheMealDB API için API anahtarı

## Kurulum

1. **Depoyu klonlayın:**
   ```bash
   git clone <repository_url>
   cd <repository_directory>
   ```

2. **Bağımlılıkları yükleyin:**
   ```bash
   flutter pub get
   ```

3. **API anahtarını yapılandırın:**
   - `lib/api_keys.dart` dosyasını açın (yoksa oluşturun).
   - API anahtarınızı ekleyin:
     ```dart
     const String mealApiKey = 'your_meal_api_key';
     ```

4. **Uygulamayı çalıştırın:**
   ```bash
   flutter run
   ```

## Dosya Yapısı

- `main.dart`: Uygulamanın giriş noktası.
- `meal_api_service.dart`: TheMealDB API'den yemek kategorilerini almak için servis dosyası.
- `lib/`: Uygulamanın tüm Dart dosyalarını içerir.
  - `models/`: API için veri modelleri.
  - `screens/`: Yemek kategorilerini görüntülemek için kullanıcı arayüzü ekranları.
  - `widgets/`: Yeniden kullanılabilir bileşenler.
  - `api_keys.dart`: API anahtarlarını saklamak için dosya.

## Kullanım

### Yemek Kategorilerini Alma

Yemek kategorilerini almak ve görüntülemek için:
1. `meal_api_service.dart` dosyasının doğru API uç noktasını ve yemek kategorilerini alma mantığını içerdiğinden emin olun.
2. Kategorileri görüntülemek için uygun ekran/bileşende servisi kullanın.

## Katkıda Bulunma

Katkılar memnuniyetle karşılanır! Değişikliklerinizi tartışmak için lütfen bir pull request oluşturun veya bir issue açın.

## Lisans

Bu proje MIT Lisansı altında lisanslanmıştır. Daha fazla bilgi için LICENSE dosyasına bakın.

## İletişim

Herhangi bir soru veya sorun için lütfen Hande Kayalı ile iletişime geçin.

## Üniversite Bilgileri

- **Üniversite:** Erciyes Üniversitesi
- **Bölüm:** Bilgisayar Mühendisliği
- **Ders:** Mobile Application Development
- **Öğretim Elemanı:** Dr. Öğr. Üyesi Fehim Köylü

---

If you need any specific sections or further customization in the README, please let me know!