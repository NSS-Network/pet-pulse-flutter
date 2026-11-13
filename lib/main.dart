import 'package:flutter/material.dart';
import 'screens/home.dart';
import 'screens/pet_select.dart';
import 'screens/feeder.dart';
import 'screens/history.dart';
import 'screens/profile.dart';
void main() => runApp(PetPulseApp());
class PetPulseApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(title: 'Pet Pulse', debugShowCheckedModeBanner: false, theme: ThemeData(primaryColor: Color(0xFFF97316), scaffoldBackgroundColor: Color(0xFFFFFFFF)), home: PhoneFrame(child: MainNav()));
  }
}
// กรอบมือถือสำหรับทดสอบบน Web - เปิดในคอมกว้าง 430 เท่ามือถือจริง / เปิดในมือถือเต็มจอ
class PhoneFrame extends StatelessWidget {
  final Widget child;
  const PhoneFrame({required this.child});
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, c) {
      if (c.maxWidth <= 500) return child;
      return Container(color: Color(0xFFE5E7EB), child: Center(child: Container(width: 430, height: 932, clipBehavior: Clip.antiAlias, decoration: BoxDecoration(color: Color(0xFFFFFFFF), borderRadius: BorderRadius.circular(28), boxShadow: [BoxShadow(color: Color(0x40000000), blurRadius: 30, offset: Offset(0, 10))]), child: child)));
    });
  }
}
class MainNav extends StatefulWidget {
  @override
  _MainNavState createState() => _MainNavState();
}
class _MainNavState extends State<MainNav> {
  int _index = 0;
  final _pages = [HomeScreen(), PetSelectScreen(onSelect: (pet) {}), FeederScreen(), HistoryScreen(), ProfileScreen()];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_index],
      floatingActionButton: FloatingActionButton(backgroundColor: Color(0xFFF97316), child: Icon(Icons.add, size: 32, color: Color(0xFFFFFFFF)), onPressed: () => setState(() => _index = 2)),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomAppBar(shape: CircularNotchedRectangle(), notchMargin: 8, child: Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [_item(Icons.home, 'หน้าแรก', 0), _item(Icons.pets, 'น้องแมว', 1), SizedBox(width: 48), _item(Icons.chat_bubble, 'ความคิดเห็น', 3), _item(Icons.person, 'โปรไฟล์', 4)])),
    );
  }
  Widget _item(IconData icon, String label, int i) {
    final active = _index == i;
    return InkWell(onTap: () => setState(() => _index = i), child: Padding(padding: EdgeInsets.symmetric(vertical: 6, horizontal: 8), child: Column(mainAxisSize: MainAxisSize.min, children: [Icon(icon, color: active ? Color(0xFFF97316) : Color(0xFF9E9E9E)), Text(label, style: TextStyle(fontSize: 13, color: active ? Color(0xFFF97316) : Color(0xFF9E9E9E), fontWeight: active ? FontWeight.bold : FontWeight.normal))])));
  }
}
