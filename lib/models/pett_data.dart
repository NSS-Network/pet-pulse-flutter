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
  static String lineToken = 'APxk96tGyURD9N7gx3SoG+QVKmvXs12sSNRAcsV7Y8cPX4sVCRBOJK+NUSHSeW9qQblyWpSJ+HMoWOBTffyXbl5AknyfC+MG2m8mXdmJevOOSZQBmWA6/6CBmdyw31Dq3sy/3x6FSgZ9Y3sW5DGjPAdB04t89/1O/w1cDnyilFU=';
  static String lineTargetId = 'U5315fe376eab0d948a13009d0341e6c0';
  static String memberId = 'U5315fe376eab0d948a13009d0341e6c0';
  static String lang = 'th';
}
