import 'package:flutter/material.dart';
import 'meal_api_service.dart'; // Meal API servisini içe aktarma

void main() {
  runApp(const MealApp());
}

// Uygulamanın ana widget'ı
class MealApp extends StatelessWidget {
  const MealApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Meal App', // Uygulama başlığı
      theme: ThemeData(
        primarySwatch: Colors.blue, // Tema rengi
      ),
      home: MealCategoriesScreen(), // Ana ekran
    );
  }
}

// Yemek kategorilerini görüntüleyen ekran
class MealCategoriesScreen extends StatelessWidget {
  final MealApiService apiService = MealApiService(); // API servisi örneği

  MealCategoriesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Meal Categories'), // Uygulama çubuğu başlığı
      ),
      body: FutureBuilder<List<String>>(
        future: apiService.fetchMealCategories(), // Yemek kategorilerini al
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
                child: CircularProgressIndicator()); // Yükleniyor göstergesi
          } else if (snapshot.hasError) {
            return Center(
                child: Text('Error: ${snapshot.error}')); // Hata mesajı
          } else {
            final categories = snapshot.data!; // Kategorileri al
            return ListView.builder(
              itemCount: categories.length,
              itemBuilder: (context, index) {
                final category = categories[index];
                return ListTile(
                  title: Text(category), // Kategori adı
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => MealListScreen(
                            category:
                                category), // Kategoriye göre yemek listesi ekranı
                      ),
                    );
                  },
                );
              },
            );
          }
        },
      ),
    );
  }
}

// Belirli bir kategoriye ait yemekleri görüntüleyen ekran
class MealListScreen extends StatelessWidget {
  final String category;
  final MealApiService apiService = MealApiService(); // API servisi örneği

  MealListScreen({Key? key, required this.category}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('$category Meals'), // Uygulama çubuğu başlığı
      ),
      body: FutureBuilder<List<Map<String, String>>>(
        future: apiService
            .fetchMealsByCategory(category), // Kategoriye göre yemekleri al
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
                child: CircularProgressIndicator()); // Yükleniyor göstergesi
          } else if (snapshot.hasError) {
            return Center(
                child: Text('Error: ${snapshot.error}')); // Hata mesajı
          } else {
            final meals = snapshot.data!; // Yemekleri al
            return ListView.builder(
              itemCount: meals.length,
              itemBuilder: (context, index) {
                final meal = meals[index];
                return ListTile(
                  leading: Hero(
                    tag: meal['id']!,
                    child: Image.network(meal['thumbnail']!), // Yemek resmi
                  ),
                  title: Text(meal['name']!), // Yemek adı
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => MealDetailsScreen(
                            mealId: meal['id']!), // Yemek detay ekranı
                      ),
                    );
                  },
                );
              },
            );
          }
        },
      ),
    );
  }
}

// Belirli bir yemeğin detaylarını görüntüleyen ekran
class MealDetailsScreen extends StatelessWidget {
  final String mealId;
  final MealApiService apiService = MealApiService(); // API servisi örneği

  MealDetailsScreen({Key? key, required this.mealId}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Meal Details'), // Uygulama çubuğu başlığı
      ),
      body: FutureBuilder<Map<String, dynamic>>(
        future: apiService.fetchMealDetails(mealId), // Yemek detaylarını al
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
                child: CircularProgressIndicator()); // Yükleniyor göstergesi
          } else if (snapshot.hasError) {
            return Center(
                child: Text('Error: ${snapshot.error}')); // Hata mesajı
          } else {
            final meal = snapshot.data!; // Yemek detaylarını al
            return SingleChildScrollView(
              child: Column(
                children: [
                  Hero(
                    tag: mealId,
                    child: Image.network(meal['strMealThumb']), // Yemek resmi
                  ),
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Text(
                      meal['strMeal'],
                      style: const TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold), // Yemek adı
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Text(meal['strInstructions']), // Yemek tarifi
                  ),
                ],
              ),
            );
          }
        },
      ),
    );
  }
}
