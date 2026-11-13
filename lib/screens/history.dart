// ประวัติการกิน + รายงานส่งหมอ
import 'package:flutter/material.dart';
class HistoryScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView(padding: EdgeInsets.all(16), children: [
      Text('ประวัติ + รายงานส่งหมอ', style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold)),
      SizedBox(height: 12),
      Card(child: ListTile(title: Text('วันนี้ • กินครบ 2 มื้อ • 150g', style: TextStyle(fontSize: 20)), subtitle: Text('08:00 100g • 18:00 50g'))),
      Card(child: ListTile(title: Text('เมื่อวาน • กินครบ 2 มื้อ • 200g', style: TextStyle(fontSize: 20)), subtitle: Text('08:00 100g • 18:00 100g'))),
      SizedBox(height: 12),
      ElevatedButton(style: ElevatedButton.styleFrom(backgroundColor: Colors.green, padding: EdgeInsets.all(16)), onPressed: () {}, child: Text('📄 ส่งรายงานให้หมอ', style: TextStyle(fontSize: 20, color: Colors.white))),
      SizedBox(height: 8),
      ElevatedButton(style: ElevatedButton.styleFrom(backgroundColor: Color(0xFFF97316), padding: EdgeInsets.all(16)), onPressed: () {}, child: Text('💬 ส่ง LINE เตือน', style: TextStyle(fontSize: 20, color: Colors.white))),
    ]);
  }
}
