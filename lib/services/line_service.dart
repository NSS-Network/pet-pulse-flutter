import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/pett_data.dart';
class LineService {
  static Future<bool> sendMessage(String text, {String type = 'feeding'}) async {
    if (PettData.backendUrl.isEmpty) return false;
    try {
      final res = await http.post(Uri.parse('${PettData.backendUrl}/api/line/test'),
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode({'customer_id': PettData.customerId, 'message': text, 'type': type, 'cat_name': 'มังคุค'}));
      return res.statusCode == 200;
    } catch (e) { return false; }
  }
  static Future<bool> sendFeedingAlert(String petName, String food) async {
    return sendMessage('feeding', type: 'feeding');
  }
  static Future<bool> sendVaccineAlert(String petName, String days) async {
    return sendMessage('vaccine', type: 'vaccine');
  }
  static Future<bool> sendVetReport(String petName, String summary) async {
    return sendMessage('Pet Pulse - สรุปส่งหมอ: $petName\n$summary');
  }
}
