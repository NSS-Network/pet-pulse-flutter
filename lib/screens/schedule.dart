import 'package:flutter/material.dart';
import '../services/line_service.dart';
class ScheduleScreen extends StatefulWidget { @override State<ScheduleScreen> createState() => _ScheduleState(); }
class _ScheduleState extends State<ScheduleScreen> {
  List<Map<String, dynamic>> times = [{'time':'08:00','amount':'100g','on':true},{'time':'18:00','amount':'100g','on':true}];
  @override Widget build(BuildContext context) {
    return ListView(padding: EdgeInsets.all(16), children: [
      Text('ตั้งเวลาให้อาหาร - มังคุค', style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold)),
      SizedBox(height: 12),
      ...times.map((t) => Card(child: ListTile(title: Text('${t['time']} • ${t['amount']}', style: TextStyle(fontSize: 22)), subtitle: Text('ทุกวัน'), trailing: Switch(value: t['on'], activeColor: Color(0xFFF97316), onChanged: (v) => setState(() => t['on']=v))))),
      SizedBox(height: 12),
      ElevatedButton(style: ElevatedButton.styleFrom(backgroundColor: Color(0xFFF97316), padding: EdgeInsets.all(16)), onPressed: () async { final c = await showTimePicker(context: context, initialTime: TimeOfDay(hour: 12, minute: 0)); if (c != null) { setState(() => times.add({'time':'${c.hour.toString().padLeft(2,'0')}:${c.minute.toString().padLeft(2,'0')}','amount':'100g','on':true})); ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('เพิ่มเวลา ${c.format(context)} แล้ว')))); } }, child: Text('+ เพิ่มเวลาใหม่', style: TextStyle(fontSize: 20, color: Color(0xFFFFFFFF)))),
      SizedBox(height: 12),
      ElevatedButton(style: ElevatedButton.styleFrom(backgroundColor: Color(0xFF4CAF50), padding: EdgeInsets.all(16)), onPressed: () async { final ok = await LineService.sendFeedingAlert('มังคุค', '100g'); ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(ok ? 'ทดสอบส่ง LINE แล้ว' : 'ส่งไม่สำเร็จ'))); }, child: Text('ทดสอบส่ง LINE - ให้อาหาร', style: TextStyle(fontSize: 18, color: Color(0xFFFFFFFF)))),
    ]);
  }
}
