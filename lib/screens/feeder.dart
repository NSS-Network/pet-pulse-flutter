import 'package:flutter/material.dart';
import '../models/pett_data.dart';
import '../services/line_service.dart';
class FeederScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView(padding: EdgeInsets.all(16), children: [
      Text('เครื่องให้อาหาร - มังคุค', style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold)),
      SizedBox(height: 12),
      Card(child: Padding(padding: EdgeInsets.all(16), child: Column(children: [Text('ปริมาณอาหารในถัง', style: TextStyle(fontSize: 20)), Text('75%', style: TextStyle(fontSize: 48, fontWeight: FontWeight.bold, color: Color(0xFFF97316))), LinearProgressIndicator(value: 0.75, color: Color(0xFFF97316))]))) ,
      SizedBox(height: 12),
      Text('ตารางให้อาหาร', style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
      ...PettData.feedingTimes.map((t) => Card(child: ListTile(leading: Icon(Icons.schedule, color: Color(0xFFF97316)), title: Text(t, style: TextStyle(fontSize: 20)), trailing: Icon(Icons.check_circle, color: Color(0xFF4CAF50))))),
      SizedBox(height: 12),
      Row(children: [Expanded(child: ElevatedButton(style: ElevatedButton.styleFrom(backgroundColor: Color(0xFFF97316), padding: EdgeInsets.all(16)), onPressed: () async { final ok = await LineService.sendFeedingAlert('มังคุค', '50g'); ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(ok ? 'ให้อาหาร 50g แล้ว - LINE ส่งแล้ว' : 'ส่งไม่สำเร็จ'))); }, child: Text('ให้ 50g', style: TextStyle(fontSize: 20, color: Color(0xFFFFFFFF))))), SizedBox(width: 8), Expanded(child: ElevatedButton(style: ElevatedButton.styleFrom(backgroundColor: Color(0xFFF97316), padding: EdgeInsets.all(16)), onPressed: () async { final ok = await LineService.sendFeedingAlert('มังคุค', '100g'); ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(ok ? 'ให้อาหาร 100g แล้ว - LINE ส่งแล้ว' : 'ส่งไม่สำเร็จ'))); }, child: Text('ให้ 100g', style: TextStyle(fontSize: 20, color: Color(0xFFFFFFFF)))))]),
    ]);
  }
}
