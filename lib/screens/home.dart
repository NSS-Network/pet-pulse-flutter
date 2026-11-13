// หน้าแรก Pet Pulse - TH|EN + Login ค้าง + บังคับลงทะเบียนชื่อ User
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
  @override Widget build(BuildContext context) {
    if (loading) return Center(child: CircularProgressIndicator(color: Color(0xFFF97316)));
    if (userName == null) return _authScreen();
    return ListView(padding: EdgeInsets.all(20), children: [
      SizedBox(height: 8),
      Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
        Text('Pet Pulse - Pet Friendly❤️', style: TextStyle(fontSize: 16, color: Colors.grey)),
        Row(children: [
          GestureDetector(onTap: () => setState(() => lang = 'th'), child: Container(padding: EdgeInsets.symmetric(horizontal: 10, vertical: 6), decoration: BoxDecoration(color: lang == 'th' ? Color(0xFFF97316) : Color(0xFFEEEEEE), borderRadius: BorderRadius.circular(20)), child: Text('TH', style: TextStyle(fontWeight: FontWeight.bold, color: lang == 'th' ? Color(0xFFFFFFFF) : Color(0xFF757575))))),
          SizedBox(width: 6),
          GestureDetector(onTap: () => setState(() => lang = 'en'), child: Container(padding: EdgeInsets.symmetric(horizontal: 10, vertical: 6), decoration: BoxDecoration(color: lang == 'en' ? Color(0xFFF97316) : Color(0xFFEEEEEE), borderRadius: BorderRadius.circular(20)), child: Text('EN', style: TextStyle(fontWeight: FontWeight.bold, color: lang == 'en' ? Color(0xFFFFFFFF) : Color(0xFF757575))))),
          SizedBox(width: 8),
          GestureDetector(onTap: () async { final c = await showDialog<bool>(context: context, builder: (_) => AlertDialog(title: Text(t('ออกจากระบบ?', 'Logout?')), content: Text('$userName'), actions: [TextButton(onPressed: () => Navigator.pop(context, false), child: Text(t('ยกเลิก', 'Cancel'))), ElevatedButton(onPressed: () => Navigator.pop(context, true), child: Text(t('ออกจากระบบ', 'Logout')))])); if (c == true) _logout(); }, child: Row(children: [CircleAvatar(radius: 18, backgroundColor: Color(0xFFFFE0B2), child: Text('👤', style: TextStyle(fontSize: 18))), SizedBox(width: 6), Text(userName!, style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold))])),
        ]),
      ]),
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
  Widget _authScreen() {
    final userC = TextEditingController(); final passC = TextEditingController();
    return ListView(padding: EdgeInsets.all(20), children: [
      Row(mainAxisAlignment: MainAxisAlignment.end, children: [GestureDetector(onTap: () => setState(() => lang = 'th'), child: Container(padding: EdgeInsets.symmetric(horizontal: 10, vertical: 6), decoration: BoxDecoration(color: lang == 'th' ? Color(0xFFF97316) : Color(0xFFEEEEEE), borderRadius: BorderRadius.circular(20)), child: Text('TH', style: TextStyle(fontWeight: FontWeight.bold)))), SizedBox(width: 6), GestureDetector(onTap: () => setState(() => lang = 'en'), child: Container(padding: EdgeInsets.symmetric(horizontal: 10, vertical: 6), decoration: BoxDecoration(color: lang == 'en' ? Color(0xFFF97316) : Color(0xFFEEEEEE), borderRadius: BorderRadius.circular(20)), child: Text('EN', style: TextStyle(fontWeight: FontWeight.bold))))]),
      SizedBox(height: 20),
      Text('Pet Pulse - Pet Friendly❤️', textAlign: TextAlign.center, style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
      SizedBox(height: 12),
      Text(isRegister ? t('ลงทะเบียน - สมัครสมาชิก', 'Register - Sign Up') : t('เข้าสู่ระบบ - Login', 'Login'), textAlign: TextAlign.center, style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold)),
      SizedBox(height: 8),
      Text(t('ต้องลงทะเบียน / Login ก่อนใช้แอป', 'You must Register / Login before using the app'), textAlign: TextAlign.center, style: TextStyle(color: Colors.grey)),
      SizedBox(height: 20),
      TextField(controller: userC, decoration: InputDecoration(labelText: t('ชื่อ User * บังคับ', 'Username * Required'), hintText: t('ตั้งชื่อ User เช่น nss98', 'Set username e.g. nss98'), border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)))),
      SizedBox(height: 12),
      TextField(controller: passC, obscureText: true, decoration: InputDecoration(labelText: t('รหัสผ่าน * บังคับ', 'Password * Required'), border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)))),
      SizedBox(height: 16),
      ElevatedButton(style: ElevatedButton.styleFrom(backgroundColor: Color(0xFFF97316), padding: EdgeInsets.all(16)), onPressed: () async { if (userC.text.trim().isEmpty) { ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(t('ต้องตั้งชื่อ User ก่อนนะ', 'Username is required')))); return; } if (passC.text.trim().isEmpty) { ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(t('ต้องใส่รหัสผ่านก่อนนะ', 'Password is required')))); return; } if (isRegister) { final p = await SharedPreferences.getInstance(); await p.setString('petpulse_pass_${userC.text.trim()}', passC.text.trim()); } else { final p = await SharedPreferences.getInstance(); final saved = p.getString('petpulse_pass_${userC.text.trim()}'); if (saved != null && saved != passC.text.trim()) { ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(t('รหัสผ่านไม่ถูกต้อง', 'Wrong password')))); return; } if (saved == null && userC.text.trim() != 'admin') { ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(t('ยังไม่ลงทะเบียน - กดลงทะเบียนก่อน', 'Not registered - please Register first')))); return; } } await _saveUser(userC.text.trim()); }, child: Text(isRegister ? t('ลงทะเบียน', 'Register') : t('Login', 'Login'), style: TextStyle(fontSize: 20, color: Color(0xFFFFFFFF)))),
      SizedBox(height: 12),
      TextButton(onPressed: () => setState(() => isRegister = !isRegister), child: Text(isRegister ? t('มีบัญชีแล้ว? กด Login', 'Already have account? Login') : t('ยังไม่มีบัญชี? กดลงทะเบียน', 'No account? Register'), style: TextStyle(color: Color(0xFFF97316), fontSize: 16))),
    ]);
  }
}
