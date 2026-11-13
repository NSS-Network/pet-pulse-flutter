import 'package:flutter/material.dart';
import '../services/line_service.dart';
class ProfileScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView(padding: EdgeInsets.all(16), children: [
      Row(children: [CircleAvatar(radius: 28, backgroundColor: Color(0xFFFFE0B2), child: Text('👤', style: TextStyle(fontSize: 28))), SizedBox(width: 12), Column(crossAxisAlignment: CrossAxisAlignment.start, children: [Text('เบอร์สมาชิก: admin', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Color(0xFFF97316))), Text('Pet Friendly - TH | EN')])]),
      SizedBox(height: 16),
      ElevatedButton(style: ElevatedButton.styleFrom(backgroundColor: Color(0xFFF97316), padding: EdgeInsets.all(16)), onPressed: () {}, child: Text('จ่ายเงิน / ต่ออายุ - Subscription', style: TextStyle(fontSize: 20, color: Color(0xFFFFFFFF)))),
      SizedBox(height: 12),
      ElevatedButton(style: ElevatedButton.styleFrom(backgroundColor: Color(0xFF2196F3), padding: EdgeInsets.all(16)), onPressed: () async { final ok = await LineService.sendVaccineAlert('มังคุค', '3'); ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(ok ? 'ส่งวัคซีนแล้ว ❤' : 'ส่งไม่สำเร็จ'))); }, child: Text('ทดสอบวัคซีน - อีก 3 วัน', style: TextStyle(fontSize: 20, color: Color(0xFFFFFFFF)))),
      SizedBox(height: 12),
      ElevatedButton(style: ElevatedButton.styleFrom(backgroundColor: Color(0xFF06C755), padding: EdgeInsets.all(16)), onPressed: () async { final ok = await LineService.sendFeedingAlert('มิมิ', '100g'); ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(ok ? 'ส่ง LINE แล้ว ❤' : 'ส่งไม่สำเร็จ - เช็ค Token'))); }, child: Text('ทดสอบส่ง LINE', style: TextStyle(fontSize: 20, color: Color(0xFFFFFFFF)))),
      SizedBox(height: 12),
      Text('SETTING ทั้งหมด', style: TextStyle(fontWeight: FontWeight.bold)),
      Card(child: ListTile(leading: Icon(Icons.settings), title: Text('ตั้งค่า - Setting'))),
      Card(child: ListTile(leading: Icon(Icons.language), title: Text('ภาษา - TH | EN'))),
      Card(child: ListTile(leading: Icon(Icons.pets), title: Text('ประเภทสัตว์ - หมา / แมว'))),
      Card(child: ListTile(leading: Icon(Icons.notifications), title: Text('แจ้งเตือน - LINE / เสียงเด็ก'))),
      Card(child: ListTile(leading: Icon(Icons.restaurant), title: Text('ตั้งค่าเครื่องให้อาหาร - Feeder'))),
      Card(child: ListTile(leading: Icon(Icons.camera_alt), title: Text('ตั้งค่ากล้อง'))),
      SizedBox(height: 12),
      Text('ABOUT', style: TextStyle(fontWeight: FontWeight.bold)),
      Card(child: ListTile(leading: Icon(Icons.info), title: Text('เกี่ยวกับแอป - About'))),
      Card(child: ListTile(leading: Icon(Icons.help), title: Text('ช่วยเหลือ / ติดต่อเรา'))),
      Card(child: ListTile(leading: Icon(Icons.privacy_tip), title: Text('นโยบายความเป็นส่วนตัว'))),
      Card(child: ListTile(leading: Icon(Icons.logout), title: Text('ออกจากระบบ'))),
      SizedBox(height: 12),
      Text('Pet Pulse by Nss98 Eng. - A brand of NSS-Network', textAlign: TextAlign.center, style: TextStyle(color: Color(0xFF9E9E9E))),
    ]);
  }
}
