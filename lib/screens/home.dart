// หน้าแรก Pet Pulse - เปลี่ยนตามหมา/แมวที่เลือก
import 'package:flutter/material.dart';
class HomeScreen extends StatelessWidget {
  final String petType;
  const HomeScreen({this.petType = 'dog'});
  @override
  Widget build(BuildContext context) {
    final isCat = petType == 'cat';
    final petName = isCat ? 'น้องแมว - มิมิ' : 'น้องหมา - บัดดี้';
    final petEmoji = isCat ? '🐱' : '🐶';
    final lastMeal = isCat ? 'กินล่าสุด 09:00 • เหลืออาหาร 80%' : 'กินล่าสุด 08:00 • เหลืออาหาร 75%';
    final dose = isCat ? '50g' : '100g';
    return ListView(padding: EdgeInsets.all(16), children: [
      Container(padding: EdgeInsets.all(20), decoration: BoxDecoration(color: Color(0xFFF97316), borderRadius: BorderRadius.circular(20)), child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Text('🐾 PET PULSE', style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold, color: Colors.white)),
        Text('เครื่องให้อาหารสัตว์อัจฉริยะ', style: TextStyle(fontSize: 18, color: Colors.white)),
      ])),
      SizedBox(height: 16),
      Card(child: ListTile(leading: Text(petEmoji, style: TextStyle(fontSize: 36)), title: Text(petName, style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)), subtitle: Text(lastMeal))),
      SizedBox(height: 12),
      ElevatedButton(style: ElevatedButton.styleFrom(backgroundColor: Color(0xFFF97316), padding: EdgeInsets.all(18)), onPressed: () {}, child: Text('🍽️ ให้อาหารตอนนี้ ($dose)', style: TextStyle(fontSize: 22, color: Colors.white))),
    ]);
  }
}
