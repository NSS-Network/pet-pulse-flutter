// ประวัติการกิน + รายงานส่งหมอ
import 'package:flutter/material.dart';
import '../services/line_service.dart';
class HistoryScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView(padding: EdgeInsets.all(16), children: [
      Text('ประวัติ + รายงานส่งหมอ - มังคุค', style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold)),
      SizedBox(height: 12),
      Card(child: ListTile(title: Text('วันนี้ • กินครบ 2 มื้อ • 150g', style: TextStyle(fontSize: 20)), subtitle: Text('08:00 100g • 18:00 50g'))),
      Card(child: ListTile(title: Text('เมื่อวาน • กินครบ 2 มื้อ • 200g', style: TextStyle(fontSize: 20)), subtitle: Text('08:00 100g • 18:00 100g'))),
      SizedBox(height: 12),
      ElevatedButton(style: ElevatedButton.styleFrom(backgroundColor: Color(0xFF4CAF50), padding: EdgeInsets.all(16)), onPressed: () async { final ok = await LineService.sendVetReport('มังคุค', 'น้ำหนัก 4.2 kg ปกติ กินครบ 2 มื้อ'); ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(ok ? 'ส่งรายงานให้หมอแล้ว - LINE ส่งแล้ว' : 'ส่งไม่สำเร็จ'))); }, child: Text('📄 ส่งรายงานให้หมอ', style: TextStyle(fontSize: 20, color: Color(0xFFFFFFFF)))),
      SizedBox(height: 8),
      ElevatedButton(style: ElevatedButton.styleFrom(backgroundColor: Color(0xFFF97316), padding: EdgeInsets.all(16)), onPressed: () async { final ok = await LineService.sendFeedingAlert('มังคุค', '100g'); ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(ok ? 'ส่ง LINE เตือนแล้ว' : 'ส่งไม่สำเร็จ'))); }, child: Text('💬 ส่ง LINE เตือน', style: TextStyle(fontSize: 20, color: Color(0xFFFFFFFF)))),
    ]);
  }
}
