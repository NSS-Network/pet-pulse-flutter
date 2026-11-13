import 'package:flutter/material.dart';
class ScheduleScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView(padding: EdgeInsets.all(16), children: [
      Text('ตั้งเวลาให้อาหาร', style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold)),
      SizedBox(height: 12),
      Card(child: ListTile(title: Text('08:00 • 100g', style: TextStyle(fontSize: 22)), subtitle: Text('ทุกวัน'), trailing: Switch(value: true, onChanged: (_) {}))),
      Card(child: ListTile(title: Text('18:00 • 100g', style: TextStyle(fontSize: 22)), subtitle: Text('ทุกวัน'), trailing: Switch(value: true, onChanged: (_) {}))),
      SizedBox(height: 12),
      ElevatedButton(style: ElevatedButton.styleFrom(backgroundColor: Color(0xFFF97316), padding: EdgeInsets.all(16)), onPressed: () {}, child: Text('+ เพิ่มเวลาใหม่', style: TextStyle(fontSize: 20, color: Colors.white))),
    ]);
  }
}
