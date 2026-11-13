// เลือกสัตว์เลี้ยง Pet Pulse - หมา / แมว
import 'package:flutter/material.dart';
class PetSelectScreen extends StatelessWidget {
  final Function(String) onSelect;
  const PetSelectScreen({required this.onSelect});
  @override
  Widget build(BuildContext context) {
    return ListView(padding: EdgeInsets.all(20), children: [
      SizedBox(height: 20),
      Text('🐾 PET PULSE', textAlign: TextAlign.center, style: TextStyle(fontSize: 36, fontWeight: FontWeight.bold, color: Color(0xFFF97316))),
      Text('เลี้ยงน้องอะไรอยู่?', textAlign: TextAlign.center, style: TextStyle(fontSize: 24)),
      SizedBox(height: 24),
      GestureDetector(onTap: () => onSelect('dog'), child: Container(padding: EdgeInsets.all(24), decoration: BoxDecoration(color: Colors.orange.shade50, borderRadius: BorderRadius.circular(20), border: Border.all(color: Color(0xFFF97316), width: 2)), child: Column(children: [Text('🐶', style: TextStyle(fontSize: 64)), Text('น้องหมา', style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold)), Text('เช่น บัดดี้ • ปริมาณ 100g/มื้อ')]))),
      SizedBox(height: 16),
      GestureDetector(onTap: () => onSelect('cat'), child: Container(padding: EdgeInsets.all(24), decoration: BoxDecoration(color: Colors.purple.shade50, borderRadius: BorderRadius.circular(20), border: Border.all(color: Colors.purple, width: 2)), child: Column(children: [Text('🐱', style: TextStyle(fontSize: 64)), Text('น้องแมว', style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold)), Text('เช่น มิมิ • ปริมาณ 50g/มื้อ')]))),
      SizedBox(height: 16),
      Text('เลือกได้ทั้ง 2 อย่าง เลี้ยงทั้งหมาและแมวก็ได้', textAlign: TextAlign.center, style: TextStyle(color: Colors.grey)),
    ]);
  }
}
