import 'package:flutter/material.dart';
class FeederScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView(padding: EdgeInsets.all(16), children: [
      Text('เครื่องให้อาหาร', style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold)),
      SizedBox(height: 12),
      Card(child: Padding(padding: EdgeInsets.all(16), child: Column(children: [Text('ปริมาณอาหารในถัง', style: TextStyle(fontSize: 20)), Text('75%', style: TextStyle(fontSize: 48, fontWeight: FontWeight.bold, color: Color(0xFFF97316))), LinearProgressIndicator(value: 0.75, color: Color(0xFFF97316))]))) ,
      SizedBox(height: 12),
      Row(children: [Expanded(child: ElevatedButton(onPressed: () {}, child: Text('ให้ 50g'))), SizedBox(width: 8), Expanded(child: ElevatedButton(onPressed: () {}, child: Text('ให้ 100g')))]),
    ]);
  }
}
