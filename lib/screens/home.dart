// หน้าแรก Pet Pulse - แอพจริง ไม่ใช่ WebView
import 'package:flutter/material.dart';
class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView(padding: EdgeInsets.all(16), children: [
      Container(padding: EdgeInsets.all(20), decoration: BoxDecoration(color: Color(0xFFF97316), borderRadius: BorderRadius.circular(20)), child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Text('🐾 PET PULSE', style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold, color: Colors.white)),
        Text('เครื่องให้อาหารสัตว์อัจฉริยะ', style: TextStyle(fontSize: 18, color: Colors.white)),
      ])),
      SizedBox(height: 16),
      Card(child: ListTile(leading: Icon(Icons.pets, size: 40, color: Color(0xFFF97316)), title: Text('น้องหมา - บัดดี้', style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)), subtitle: Text('กินล่าสุด 08:00 • เหลืออาหาร 75%'))),
      SizedBox(height: 12),
      ElevatedButton(style: ElevatedButton.styleFrom(backgroundColor: Color(0xFFF97316), padding: EdgeInsets.all(18)), onPressed: () {}, child: Text('🍽️ ให้อาหารตอนนี้', style: TextStyle(fontSize: 22, color: Colors.white))),
    ]);
  }
}
