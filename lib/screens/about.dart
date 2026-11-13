// Pet Pulse คืออะไร - อธิบาย concept ให้ไม่งง
import 'package:flutter/material.dart';
class AboutScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView(padding: EdgeInsets.all(16), children: [
      Text('🐾 Pet Pulse คืออะไร?', style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold)),
      SizedBox(height: 12),
      Card(child: ListTile(leading: Text('⏰', style: TextStyle(fontSize: 32)), title: Text('1. เตือนให้อาหาร หมา / แมว', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)), subtitle: Text('ตั้งเวลา + ส่ง LINE เตือน'))),
      Card(child: ListTile(leading: Text('📊', style: TextStyle(fontSize: 32)), title: Text('2. สรุปรายงานส่งหมอ', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)), subtitle: Text('กินกี่กรัม / น้ำหนัก / กินครบไหม'))),
      Card(child: ListTile(leading: Text('🤖', style: TextStyle(fontSize: 32)), title: Text('3. ต่อเครื่องให้อาหารได้ (ถ้ามี)', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)), subtitle: Text('ไม่มีเครื่องก็ใช้ได้ • มีเครื่องแล้วสั่งในแอพได้เลย'))),
      SizedBox(height: 12),
      SizedBox(height: 12),
      Text('© 2026 Nss98 Eng. All rights reserved.', textAlign: TextAlign.center, style: TextStyle(color: Colors.grey)),
      Text('Pet Pulse by Nss98 Eng. • A brand of NSS-Network', textAlign: TextAlign.center, style: TextStyle(color: Colors.grey)),
      SizedBox(height: 8),
      Container(padding: EdgeInsets.all(16), decoration: BoxDecoration(color: Colors.orange.shade50, borderRadius: BorderRadius.circular(16)), child: Text('ไม่มีเครื่องก็ใช้ได้ = เตือน + LINE + รายงานส่งหมอ\nมีเครื่องแล้ว = + สั่งเครื่องให้อาหารอัตโนมัติได้ด้วย', style: TextStyle(fontSize: 18))),
    ]);
  }
}
// ลิขสิทธิ์: © Nss98 Eng. - Pet Pulse
