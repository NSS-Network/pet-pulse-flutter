class PettPet {
  final String name; final String type; final int age; final double weight;
  PettPet({required this.name, required this.type, required this.age, required this.weight});
}
class PettData {
  static List<PettPet> pets = [
    PettPet(name: 'มิมิ', type: 'cat', age: 2, weight: 3.5),
    PettPet(name: 'บัดดี้', type: 'dog', age: 1, weight: 8.0),
  ];
  static List<String> feedingTimes = ['08:00 - 100g', '18:00 - 100g'];
  static String lineToken = '';
  static String memberId = 'admin';
  static String lang = 'th';
}
