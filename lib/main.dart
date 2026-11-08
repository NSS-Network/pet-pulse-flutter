import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

void main() => runApp(const PetPulseApp());

class PetPulseApp extends StatelessWidget {
  const PetPulseApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Pet Pulse',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xFFF97316)), useMaterial3: true),
      home: const PetPulseWeb(),
    );
  }
}

class PetPulseWeb extends StatefulWidget {
  const PetPulseWeb({super.key});
  @override
  State<PetPulseWeb> createState() => _PetPulseWebState();
}

class _PetPulseWebState extends State<PetPulseWeb> {
  late final WebViewController _c;
  bool _loading = true;
  @override
  void initState() {
    super.initState();
    _c = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..setNavigationDelegate(NavigationDelegate(
        onPageFinished: (_) => setState(() => _loading = false),
      ))
      ..loadRequest(Uri.parse('https://pet.5access.site/'));
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(children: [
          WebViewWidget(controller: _c),
          if (_loading) const Center(child: Column(mainAxisSize: MainAxisSize.min, children: [
            CircularProgressIndicator(color: Color(0xFFF97316)),
            SizedBox(height: 12),
            Text('🐾 Pet Pulse กำลังโหลด...', style: TextStyle(fontWeight: FontWeight.bold)),
          ])),
        ]),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: const Color(0xFFF97316),
        onPressed: () => _c.loadRequest(Uri.parse('https://pet.5access.site/')),
        child: const Icon(Icons.refresh, color: Colors.white),
      ),
    );
  }
}
