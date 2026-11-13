import 'package:flutter/material.dart';
class CameraScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView(padding: EdgeInsets.all(16), children: [
      Text('กล้องดูน้อง', style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold)),
      SizedBox(height: 12),
      Container(height: 260, decoration: BoxDecoration(color: Colors.black87, borderRadius: BorderRadius.circular(16)), child: Center(child: Column(mainAxisSize: MainAxisSize.min, children: [Icon(Icons.videocam, size: 60, color: Colors.white), Text('กำลังเชื่อมต่อกล้อง...', style: TextStyle(color: Colors.white, fontSize: 18))]))),
      SizedBox(height: 12),
      ElevatedButton(style: ElevatedButton.styleFrom(backgroundColor: Color(0xFFF97316), padding: EdgeInsets.all(16)), onPressed: () {}, child: Text('🎤 พูดกับน้อง', style: TextStyle(fontSize: 20, color: Colors.white))),
    ]);
  }
}
