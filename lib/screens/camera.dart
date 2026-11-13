import 'package:flutter/material.dart';
class CameraScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView(padding: EdgeInsets.all(16), children: [
      Text('กล้องดูน้อง - มังคุค', style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold)),
      SizedBox(height: 12),
      Container(height: 260, decoration: BoxDecoration(color: Color(0xFF212121), borderRadius: BorderRadius.circular(16)), child: Center(child: Column(mainAxisSize: MainAxisSize.min, children: [Icon(Icons.videocam_off, size: 60, color: Color(0xFFFFFFFF)), Text('ยังไม่มีกล้องเชื่อมต่อ', style: TextStyle(color: Color(0xFFFFFFFF), fontSize: 18)), Text('ใส่ RTSP / IP Camera ในตั้งค่าได้เลย', style: TextStyle(color: Color(0xFFBDBDBD), fontSize: 14))]))),
      SizedBox(height: 12),
      ElevatedButton(style: ElevatedButton.styleFrom(backgroundColor: Color(0xFFF97316), padding: EdgeInsets.all(16)), onPressed: () { ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('ยังไม่มีกล้อง - ใส่กล้องในตั้งค่าก่อนนะ'))); }, child: Text('🎤 พูดกับน้อง', style: TextStyle(fontSize: 20, color: Color(0xFFFFFFFF)))),
      SizedBox(height: 12),
      Card(child: ListTile(leading: Icon(Icons.settings), title: Text('ตั้งค่ากล้อง - ใส่ RTSP / IP'))),
    ]);
  }
}
