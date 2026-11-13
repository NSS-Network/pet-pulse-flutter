// หน้าแรก Pet Pulse - ก๊อปจาก pett.5access.site เป๊ะๆ ไม่คิดใหม่
import 'package:flutter/material.dart';
class HomeScreen extends StatelessWidget {
  final String petType;
  const HomeScreen({this.petType = 'dog'});
  @override
  Widget build(BuildContext context) {
    return ListView(padding: EdgeInsets.all(20), children: [
      SizedBox(height: 8),
      Text('🐾 Pet Pulse — PetPulse IoT | Pet Care', style: TextStyle(fontSize: 16, color: Colors.grey)),
      SizedBox(height: 16),
      Text('รู้สถานะน้องแมว', style: TextStyle(fontSize: 36, fontWeight: FontWeight.bold)),
      Text('❤ทันที❤', style: TextStyle(fontSize: 36, fontWeight: FontWeight.bold, color: Colors.red)),
      SizedBox(height: 12),
      Text('แจ้งเตือนเข้ามือถือทันที เมื่อน้องต้องการอาหาร วัคซีน หรือตรวจสุขภาพ', style: TextStyle(fontSize: 20, color: Colors.black87)),
      SizedBox(height: 20),
      ElevatedButton(style: ElevatedButton.styleFrom(backgroundColor: Color(0xFFF97316), padding: EdgeInsets.all(18)), onPressed: () {}, child: Text('ทดลองใช้ฟรี', style: TextStyle(fontSize: 22, color: Colors.white))),
      SizedBox(height: 12),
      OutlinedButton(style: OutlinedButton.styleFrom(padding: EdgeInsets.all(18)), onPressed: () {}, child: Text('เพิ่มน้องของฉัน', style: TextStyle(fontSize: 22, color: Color(0xFFF97316)))),
      SizedBox(height: 8),
      Text('ไม่ต้องใช้บัตรเครดิต', textAlign: TextAlign.center, style: TextStyle(color: Colors.grey)),
      SizedBox(height: 20),
      Container(padding: EdgeInsets.all(16), decoration: BoxDecoration(color: Colors.orange.shade50, borderRadius: BorderRadius.circular(16)), child: Column(children: [Text('🐱🐈', style: TextStyle(fontSize: 48)), Text('น้องกำลังเต้นรอคุณอยู่...', style: TextStyle(fontSize: 18))])),
      SizedBox(height: 12),
      Text('📱 โหลดแอพ Pet Pulse v1.41 (Android)', textAlign: TextAlign.center, style: TextStyle(color: Colors.blue)),
    ]);
  }
}
