// เลือกภาษา Pet Pulse - EN / TH - ขายทั่วโลก
import 'package:flutter/material.dart';
class LanguageScreen extends StatelessWidget {
  final Function(String) onSelect;
  const LanguageScreen({required this.onSelect});
  @override
  Widget build(BuildContext context) {
    return ListView(padding: EdgeInsets.all(20), children: [
      SizedBox(height: 20),
      Text('🌍 Language / ภาษา', textAlign: TextAlign.center, style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold)),
      SizedBox(height: 20),
      GestureDetector(onTap: () => onSelect('th'), child: Container(padding: EdgeInsets.all(20), decoration: BoxDecoration(color: Colors.orange.shade50, borderRadius: BorderRadius.circular(16)), child: Column(children: [Text('🇹🇭', style: TextStyle(fontSize: 48)), Text('ภาษาไทย', style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold)), Text('สำหรับคนไทย')]))),
      SizedBox(height: 12),
      GestureDetector(onTap: () => onSelect('en'), child: Container(padding: EdgeInsets.all(20), decoration: BoxDecoration(color: Colors.blue.shade50, borderRadius: BorderRadius.circular(16)), child: Column(children: [Text('🇺🇸', style: TextStyle(fontSize: 48)), Text('English', style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold)), Text('For global customers')]))),
    ]);
  }
}
