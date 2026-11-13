import 'package:flutter/material.dart';
import 'screens/home.dart';
import 'screens/pet_select.dart';
import 'screens/about.dart';
import 'screens/history.dart';
import 'screens/feeder.dart';
import 'screens/camera.dart';
import 'screens/schedule.dart';
void main() => runApp(const PetPulseApp());
class PetPulseApp extends StatelessWidget {
  const PetPulseApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(title: 'Pet Pulse', debugShowCheckedModeBanner: false, theme: ThemeData(colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xFFF97316)), useMaterial3: true), home: const PetPulseHome());
  }
}
class PetPulseHome extends StatefulWidget {
  const PetPulseHome({super.key});
  @override
  State<PetPulseHome> createState() => _PetPulseHomeState();
}
class _PetPulseHomeState extends State<PetPulseHome> {
  int _idx = 0;
  String? _petType;
  List<Widget> get _pages => [HomeScreen(petType: _petType ?? 'dog'), FeederScreen(), CameraScreen(), ScheduleScreen(), HistoryScreen(), AboutScreen()];
  @override
  Widget build(BuildContext context) {
    if (_petType == null) return Scaffold(body: SafeArea(child: PetSelectScreen(onSelect: (v) => setState(() => _petType = v))));
    return Scaffold(body: SafeArea(child: _pages[_idx]), bottomNavigationBar: BottomNavigationBar(currentIndex: _idx, selectedItemColor: Color(0xFFF97316), unselectedItemColor: Colors.grey, type: BottomNavigationBarType.fixed, onTap: (i) => setState(() => _idx = i), items: [
      BottomNavigationBarItem(icon: Icon(Icons.home), label: 'หน้าแรก'),
      BottomNavigationBarItem(icon: Icon(Icons.restaurant), label: 'ให้อาหาร'),
      BottomNavigationBarItem(icon: Icon(Icons.videocam), label: 'กล้อง'),
      BottomNavigationBarItem(icon: Icon(Icons.schedule), label: 'ตั้งเวลา'),
      BottomNavigationBarItem(icon: Icon(Icons.history), label: 'ประวัติ'),
      BottomNavigationBarItem(icon: Icon(Icons.info), label: 'คืออะไร'),
    ]));
  }
}
