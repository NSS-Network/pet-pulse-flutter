import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/pett_data.dart';
class LineService {
  static Future<bool> sendMessage(String text) async {
    if (PettData.backendUrl.isEmpty) return false;
    try {
      final res = await http.post(Uri.parse('${PettData.backendUrl}/api/line/test'),
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode({'customer_id': PettData.customerId, 'message': text}));
      return res.statusCode == 200;
    } catch (e) { return false; }
  }
  static Future<bool> sendFeedingAlert(String petName, String food) async {
    return sendMessage('Pet Pulse แจ้งเตือนให้อาหาร น้อง$petName: ถึงเวลามื้อเย็นแล้วนะที่รัก น้ำหนัก 4.2 kg - $food');
  }
  static Future<bool> sendVaccineAlert(String petName, String days) async {
    return sendMessage('Pet Pulse แจ้งเตือนวัคซีน น้อง$petName: วัคซีนอีก $days วัน อย่าลืมพาไปหาหมอที่รัก ❤');
  }
  static Future<bool> sendVetReport(String petName, String summary) async {
    return sendMessage('Pet Pulse - สรุปส่งหมอ: $petName\n$summary');
  }
}
