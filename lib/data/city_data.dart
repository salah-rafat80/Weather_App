class CityData {
  static const List<String> allCities = [
    'Cairo', 'Alexandria', 'Giza', 'Luxor', 'Aswan', 'Sharm El Sheikh',
    'Dubai', 'Abu Dhabi', 'Riyadh', 'Jeddah', 'Doha', 'Kuwait City',
    'London', 'Paris', 'Berlin', 'Rome', 'Madrid', 'Amsterdam',
    'New York', 'Los Angeles', 'Chicago', 'Miami', 'Boston', 'Seattle',
    'Tokyo', 'Osaka', 'Seoul', 'Beijing', 'Shanghai', 'Bangkok',
    'Sydney', 'Melbourne', 'Toronto', 'Vancouver', 'Montreal'
  ];

  static const List<String> quickCities = [
    'Cairo', 'Dubai', 'London', 'New York', 'Tokyo', 'Paris'
  ];

  static List<String> filterCities(String query) {
    if (query.isEmpty) {
      return quickCities;
    }
    return allCities
        .where((city) => city.toLowerCase().contains(query.toLowerCase()))
        .take(6)
        .toList();
  }
}
