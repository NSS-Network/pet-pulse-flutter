import 'package:flutter/material.dart';
import '../services/line_service.dart';
class ProfileScreen extends StatefulWidget { @override State<ProfileScreen> createState() => _ProfileState(); }
class _ProfileState extends State<ProfileScreen> {
  String lang = 'th';
  String t(String th, String en) => lang == 'th' ? th : en;
  @override Widget build(BuildContext context) {
    return ListView(padding: EdgeInsets.all(16), children: [
      Row(children: [CircleAvatar(radius: 28, backgroundColor: Color(0xFFFFE0B2), child: Text('👤', style: TextStyle(fontSize: 28))), SizedBox(width: 12), Column(crossAxisAlignment: CrossAxisAlignment.start, children: [Text(t('เบอร์สมาชิก: PP-9061752', 'Member: PP-9061752'), style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Color(0xFFF97316))), Text('Pet Friendly - TH | EN')])]),
      SizedBox(height: 16),
      ElevatedButton(style: ElevatedButton.styleFrom(backgroundColor: Color(0xFFF97316), padding: EdgeInsets.all(16)), onPressed: () { showDialog(context: context, builder: (_) => AlertDialog(title: Text(t('Subscription - มังคุค', 'Subscription - Mangkuk')), content: Text(t('รายเดือน 99 บาท / รายปี 990 บาท\nกดยืนยันเพื่อต่ออายุ', 'Monthly 99 THB / Yearly 990 THB\nTap Confirm to renew')), actions: [TextButton(onPressed: () => Navigator.pop(context), child: Text(t('ปิด', 'Close'))), ElevatedButton(onPressed: () { Navigator.pop(context); ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(t('ต่ออายุแล้ว - ขอบคุณที่รัก ❤️', 'Renewed - Thank you ❤️')))); }, child: Text(t('ยืนยันต่ออายุ', 'Confirm Renew')))])); }, child: Text(t('จ่ายเงิน / ต่ออายุ - Subscription', 'Pay / Renew - Subscription'), style: TextStyle(fontSize: 20, color: Color(0xFFFFFFFF)))),
      SizedBox(height: 12),
      ElevatedButton(style: ElevatedButton.styleFrom(backgroundColor: Color(0xFF9C27B0), padding: EdgeInsets.all(16)), onPressed: () async { final ok = await LineService.sendMessage('vet', type: 'vet'); ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(ok ? 'ส่งสรุปให้หมอแล้ว - มังคุค 4.2 kg ปกติ' : 'ส่งไม่สำเร็จ'))); }, child: Text('สรุปส่งหมอ - มังคุค', style: TextStyle(fontSize: 20, color: Color(0xFFFFFFFF)))),
      SizedBox(height: 12),
      ElevatedButton(style: ElevatedButton.styleFrom(backgroundColor: Color(0xFF2196F3), padding: EdgeInsets.all(16)), onPressed: () async { final ok = await LineService.sendVaccineAlert('มังคุค', '3'); ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(ok ? 'ส่งวัคซีนแล้ว ❤' : 'ส่งไม่สำเร็จ'))); }, child: Text('ทดสอบวัคซีน - อีก 3 วัน', style: TextStyle(fontSize: 20, color: Color(0xFFFFFFFF)))),
      SizedBox(height: 12),
      ElevatedButton(style: ElevatedButton.styleFrom(backgroundColor: Color(0xFF06C755), padding: EdgeInsets.all(16)), onPressed: () async { final ok = await LineService.sendFeedingAlert('มังคุค', '100g'); ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(ok ? 'ส่ง LINE แล้ว ❤' : 'ส่งไม่สำเร็จ - เช็ค Token'))); }, child: Text('ทดสอบส่ง LINE', style: TextStyle(fontSize: 20, color: Color(0xFFFFFFFF)))),
      SizedBox(height: 12),
      Text(t('SETTING ทั้งหมด', 'ALL SETTINGS'), style: TextStyle(fontWeight: FontWeight.bold)),
      Card(child: ListTile(leading: Icon(Icons.settings), title: Text(t('ตั้งค่า - Setting', 'Setting')))),
      Card(child: ListTile(leading: Icon(Icons.language), title: Text(t('ภาษา - TH | EN (ตอนนี้: ${lang == 'th' ? 'ไทย' : 'English'})', 'Language - TH | EN (Now: ${lang == 'th' ? 'Thai' : 'English'})')), trailing: Switch(value: lang == 'en', onChanged: (v) => setState(() => lang = v ? 'en' : 'th')))),
      Card(child: ListTile(leading: Icon(Icons.pets), title: Text(t('ประเภทสัตว์ - หมา / แมว (ตอนนี้: แมว)', 'Pet Type - Dog / Cat (Now: Cat)')))),
      Card(child: ListTile(leading: Icon(Icons.notifications), title: Text(t('แจ้งเตือน - LINE / เสียงเด็ก', 'Notifications - LINE / Sound')))),
      Card(child: ListTile(leading: Icon(Icons.restaurant), title: Text(t('ตั้งค่าเครื่องให้อาหาร - Feeder', 'Feeder Setting')))),
      Card(child: ListTile(leading: Icon(Icons.camera_alt), title: Text(t('ตั้งค่ากล้อง', 'Camera Setting')))),
      SizedBox(height: 12),
      Text('ABOUT', style: TextStyle(fontWeight: FontWeight.bold)),
      Card(child: ListTile(leading: Icon(Icons.info), title: Text(t('เกี่ยวกับแอป - About', 'About App')))),
      Card(child: ListTile(leading: Icon(Icons.help), title: Text(t('ช่วยเหลือ / ติดต่อเรา', 'Help / Contact')))),
      Card(child: ListTile(leading: Icon(Icons.privacy_tip), title: Text(t('นโยบายความเป็นส่วนตัว', 'Privacy Policy')))),
      Card(child: ListTile(leading: Icon(Icons.logout), title: Text(t('ออกจากระบบ', 'Logout')))),
      SizedBox(height: 12),
      Text('Pet Pulse by Nss98 Eng. - A brand of NSS-Network', textAlign: TextAlign.center, style: TextStyle(color: Color(0xFF9E9E9E))),
    ]);
  }
}
