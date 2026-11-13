class PettPet {
  final String name; final String type; final int age; final double weight;
  PettPet({required this.name, required this.type, required this.age, required this.weight});
}
class PettData {
  static List<PettPet> pets = [
    PettPet(name: 'มังคุค', type: 'cat', age: 2, weight: 4.2),
  ];
  static List<String> feedingTimes = ['08:00 - 100g', '18:00 - 100g'];
  static String lineToken = ''; // ไม่เก็บ Token ใน Flutter
  static String lineTargetId = '';
  static String memberId = '';
  static String backendUrl = 'https://pett-api.5access.site'; // ใส่ URL backend pett v2 เช่น https://xxx
  static String customerId = 'PP-9061752';
  static String lang = 'th';
}
