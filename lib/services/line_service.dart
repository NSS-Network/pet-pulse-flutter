import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/pett_data.dart';
class LineService {
  static Future<bool> sendMessage(String text) async {
    if (PettData.lineToken.isEmpty) return false;
    final res = await http.post(Uri.parse('https://api.line.me/v2/bot/message/push'),
      headers: {'Content-Type': 'application/json', 'Authorization': 'Bearer ${PettData.lineToken}'},
      body: jsonEncode({'to': PettData.lineTargetId, 'messages': [{'type': 'text', 'text': text}]}));
    return res.statusCode == 200;
  }
  static Future<bool> sendFeedingAlert(String petName, String food) async {
    return sendMessage('Pet Pulse: ถึงเวลาให้อาหาร $petName แล้วนะ ❤ อาหาร: $food');
  }
  static Future<bool> sendVetReport(String petName, String summary) async {
    return sendMessage('Pet Pulse - สรุปส่งหมอ: $petName\n$summary');
  }
}
