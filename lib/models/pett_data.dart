class PettPet {
  final String name; final String type; final int age; final double weight;
  PettPet({required this.name, required this.type, required this.age, required this.weight});
}
class PettData {
  static List<PettPet> pets = [
    PettPet(name: 'น้องแมว', type: 'cat', age: 2, weight: 4.2),
  ];
  static List<String> feedingTimes = ['08:00 - 100g', '18:00 - 100g'];
  static String lineToken = ''; // ไม่เก็บ Token ใน Flutter
  static String lineTargetId = '';
  static String memberId = '';
  static String backendUrl = ''; // ใช้ Backend v2 บน 5access-iot (7001) ผ่าน home.dart // ใส่ URL backend pett v2 เช่น https://xxx
  static String customerId = ''; // ดึงจาก User ที่ Login จริง ไม่ Hardcode แล้ว
  static String lang = 'th';
}
