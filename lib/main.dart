import 'package:flutter/material.dart';
import 'navigation/main_nav.dart';

// main.dart - main ตัวจริงอยู่ตรงนี้ มีแค่ runApp + ตั้งชื่อแอพ + กรอบมือถือ
// MainNav ย้ายไปอยู่ navigation/main_nav.dart แล้ว อนาคตเพิ่มแท็บแก้แค่ตรงนั้น ไม่ต้องแตะ main
void main() => runApp(PetPulseApp());
class PetPulseApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(title: 'Pet Pulse', debugShowCheckedModeBanner: false, theme: ThemeData(primaryColor: Color(0xFFF97316), scaffoldBackgroundColor: Color(0xFFFFFFFF)), home: PhoneFrame(child: MainNav()));
  }
}
// กรอบมือถือสำหรับทดสอบบน Web - เปิดในคอมกว้าง 430 เท่ามือถือจริง / เปิดในมือถือเต็มจอ
class PhoneFrame extends StatelessWidget {
  final Widget child;
  const PhoneFrame({required this.child});
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, c) {
      if (c.maxWidth <= 500) return child;
      return Container(color: Color(0xFFE5E7EB), child: Center(child: Container(width: 430, height: 932, clipBehavior: Clip.antiAlias, decoration: BoxDecoration(color: Color(0xFFFFFFFF), borderRadius: BorderRadius.circular(28), boxShadow: [BoxShadow(color: Color(0x40000000), blurRadius: 30, offset: Offset(0, 10))]), child: child)));
    });
  }
}
