// หน้าแรก Pet Pulse - ซ้าย Pet Pulse / กลาง TH EN / ขวา Login-User
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
class HomeScreen extends StatefulWidget { final String petType; const HomeScreen({this.petType = 'dog'}); @override State<HomeScreen> createState() => _HomeState(); }
class _HomeState extends State<HomeScreen> {
  String lang = 'th';
  String? userName;
  bool loading = true;
  bool isRegister = false;
  String t(String th, String en) => lang == 'th' ? th : en;
  @override void initState() { super.initState(); _load(); }
  Future<void> _load() async { final p = await SharedPreferences.getInstance(); setState(() { userName = p.getString('petpulse_user'); loading = false; }); }
  Future<void> _saveUser(String name) async { final p = await SharedPreferences.getInstance(); await p.setString('petpulse_user', name); setState(() => userName = name); }
  Future<void> _logout() async { final p = await SharedPreferences.getInstance(); await p.remove('petpulse_user'); setState(() => userName = null); }
  Widget _topBar() {
    return Row(children: [
      Expanded(child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [Text('Pet Friendly❤️', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.black)), Text('Pet Pulse', style: TextStyle(fontSize: 14, color: Colors.grey))])),
      Row(children: [
        GestureDetector(onTap: () => setState(() => lang = 'th'), child: Container(padding: EdgeInsets.symmetric(horizontal: 12, vertical: 6), decoration: BoxDecoration(color: lang == 'th' ? Color(0xFFF97316) : Color(0xFFEEEEEE), borderRadius: BorderRadius.circular(20)), child: Text('TH', style: TextStyle(fontWeight: FontWeight.bold, color: lang == 'th' ? Color(0xFFFFFFFF) : Color(0xFF757575))))),
        Text(' / ', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.grey)),
        GestureDetector(onTap: () => setState(() => lang = 'en'), child: Container(padding: EdgeInsets.symmetric(horizontal: 12, vertical: 6), decoration: BoxDecoration(color: lang == 'en' ? Color(0xFFF97316) : Color(0xFFEEEEEE), borderRadius: BorderRadius.circular(20)), child: Text('EN', style: TextStyle(fontWeight: FontWeight.bold, color: lang == 'en' ? Color(0xFFFFFFFF) : Color(0xFF757575))))),
      ]),
      Expanded(child: Row(mainAxisAlignment: MainAxisAlignment.end, children: [ if (userName == null) GestureDetector(onTap: () => setState(() => isRegister = false), child: Container(padding: EdgeInsets.symmetric(horizontal: 12, vertical: 6), decoration: BoxDecoration(color: Color(0xFFF97316), borderRadius: BorderRadius.circular(20)), child: Text(t('เข้าสู่ระบบ', 'Login'), style: TextStyle(color: Color(0xFFFFFFFF), fontWeight: FontWeight.bold)))) else GestureDetector(onTap: () async { final c = await showDialog<bool>(context: context, builder: (_) => AlertDialog(title: Text(userName!), content: Text(t('ออกจากระบบ?', 'Logout?')), actions: [TextButton(onPressed: () => Navigator.pop(context, false), child: Text(t('ยกเลิก', 'Cancel'))), ElevatedButton(onPressed: () => Navigator.pop(context, true), child: Text(t('ออกจากระบบ', 'Logout')))])); if (c == true) _logout(); }, child: Row(children: [CircleAvatar(radius: 16, backgroundColor: Color(0xFFFFE0B2), child: Text('👤', style: TextStyle(fontSize: 16))), SizedBox(width: 6), Text(userName!, style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold))])) ])),
    ]);
  }
  @override Widget build(BuildContext context) {
    if (loading) return Center(child: CircularProgressIndicator(color: Color(0xFFF97316)));
    if (userName == null) {
      final userC = TextEditingController(); final passC = TextEditingController();
      return ListView(padding: EdgeInsets.all(20), children: [
        _topBar(),
        SizedBox(height: 24),
        Text(isRegister ? t('ลงทะเบียน', 'Register') : t('เข้าสู่ระบบ', 'Login'), textAlign: TextAlign.center, style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold)),
        SizedBox(height: 8),
        Text(t('ลงทะเบียน / เข้าสู่ระบบก่อนใช้งาน', 'Please register / login to continue'), textAlign: TextAlign.center, style: TextStyle(color: Colors.grey)),
        SizedBox(height: 20),
        TextField(controller: userC, decoration: InputDecoration(labelText: t('ชื่อผู้ใช้', 'Username'), hintText: t('เช่น nss98', 'e.g. nss98'), border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)))),
        SizedBox(height: 12),
        TextField(controller: passC, obscureText: true, decoration: InputDecoration(labelText: t('รหัสผ่าน', 'Password'), border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)))),
        SizedBox(height: 16),
        ElevatedButton(style: ElevatedButton.styleFrom(backgroundColor: Color(0xFFF97316), padding: EdgeInsets.all(16)), onPressed: () async { if (userC.text.trim().isEmpty) { ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(t('กรุณาใส่ชื่อผู้ใช้', 'Please enter username')))); return; } if (passC.text.trim().isEmpty) { ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(t('กรุณาใส่รหัสผ่าน', 'Please enter password')))); return; } if (isRegister) { final p = await SharedPreferences.getInstance(); await p.setString('petpulse_pass_${userC.text.trim()}', passC.text.trim()); } else { final p = await SharedPreferences.getInstance(); final saved = p.getString('petpulse_pass_${userC.text.trim()}'); if (saved != null && saved != passC.text.trim()) { ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(t('รหัสผ่านไม่ถูกต้อง', 'Wrong password')))); return; } if (saved == null && userC.text.trim() != 'admin') { ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(t('ยังไม่มีบัญชี กรุณาลงทะเบียน', 'No account yet, please register')))); return; } } await _saveUser(userC.text.trim()); }, child: Text(isRegister ? t('ลงทะเบียน', 'Register') : t('เข้าสู่ระบบ', 'Login'), style: TextStyle(fontSize: 20, color: Color(0xFFFFFFFF)))),
        SizedBox(height: 12),
        TextButton(onPressed: () => setState(() => isRegister = !isRegister), child: Text(isRegister ? t('มีบัญชีแล้ว? เข้าสู่ระบบ', 'Already have account? Login') : t('ยังไม่มีบัญชี? ลงทะเบียน', 'No account? Register'), style: TextStyle(color: Color(0xFFF97316), fontSize: 16))),
      ]);
    }
    return ListView(padding: EdgeInsets.all(20), children: [
      _topBar(),
      SizedBox(height: 16),
      RichText(text: TextSpan(style: TextStyle(fontSize: 36, fontWeight: FontWeight.bold, color: Colors.black), children: [TextSpan(text: t('รู้สถานะน้องแมว ', 'Know your cat status ')), TextSpan(text: '❤️${t('ทันที', 'Now')}❤️', style: TextStyle(color: Colors.red))])),
      SizedBox(height: 12),
      Text(t('แจ้งเตือนเข้ามือถือทันที เมื่อน้องต้องการอาหาร วัคซีน หรือตรวจสุขภาพ', 'Instant alerts to your phone when your pet needs food, vaccine or health check'), style: TextStyle(fontSize: 20, color: Colors.black87)),
      SizedBox(height: 20),
      ElevatedButton(style: ElevatedButton.styleFrom(backgroundColor: Color(0xFFF97316), padding: EdgeInsets.all(18)), onPressed: () {}, child: Text(t('ทดลองใช้ฟรี', 'Try Free'), style: TextStyle(fontSize: 22, color: Colors.white))),
      SizedBox(height: 12),
      OutlinedButton(style: OutlinedButton.styleFrom(padding: EdgeInsets.all(18)), onPressed: () {}, child: Text(t('เพิ่มน้องของฉัน', 'Add My Pet'), style: TextStyle(fontSize: 22, color: Color(0xFFF97316)))),
      SizedBox(height: 8),
      Text(t('ไม่ต้องใช้บัตรเครดิต', 'No credit card needed'), textAlign: TextAlign.center, style: TextStyle(color: Colors.grey)),
      SizedBox(height: 20),
      Container(padding: EdgeInsets.all(16), decoration: BoxDecoration(color: Colors.orange.shade50, borderRadius: BorderRadius.circular(16)), child: Column(children: [Text('🐱🐈', style: TextStyle(fontSize: 48)), Text(t('น้องกำลังเต้นรอคุณอยู่...', 'Your pet is dancing waiting for you...'), style: TextStyle(fontSize: 18))])),
    ]);
  }
}
