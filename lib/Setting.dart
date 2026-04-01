import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(fontFamily: 'Roboto'),
      home: const SettingsPage(),
    );
  }
}

class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key});

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  // حالات مفاتيح التنبيهات
  bool _newMatches = true;
  bool _directMessages = true;
  bool _productUpdates = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF8F9FB),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Color(0xFF3F51B5)),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text(
          'Settings',
          style: TextStyle(color: Color(0xFF3F51B5), fontWeight: FontWeight.bold),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.more_vert, color: Colors.grey),
            onPressed: () {},
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 24.0),
        child: Column(
          children: [
            const SizedBox(height: 20),
            // قسم الصورة الشخصية
            Center(
              child: Stack(
                children: [
                  const CircleAvatar(
                    radius: 60,
                    backgroundImage: AssetImage('assets/images/1.jpeg'),
                  ),
                  Positioned(
                    bottom: 0,
                    right: 4,
                    child: CircleAvatar(
                      radius: 18,
                      backgroundColor: const Color(0xFF3F51B5),
                      child: IconButton(
                        icon: const Icon(Icons.edit, size: 18, color: Colors.white),
                        onPressed: () {},
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 16),
            const Text(
              'Ahmed El-Meligy',
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: Color(0xFF333333)),
            ),
            const Text(
              'Senior Product Designer',
              style: TextStyle(fontSize: 14, color: Colors.grey),
            ),
            const SizedBox(height: 24),
            // أزرار التحكم بالصورة
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFFE8EAF6),
                    foregroundColor: const Color(0xFF3F51B5),
                    elevation: 0,
                    padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 12),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                  ),
                  child: const Text('Upload New'),
                ),
                const SizedBox(width: 20),
                TextButton(
                  onPressed: () {},
                  child: const Text('Remove', style: TextStyle(color: Colors.redAccent)),
                ),
              ],
            ),
            const SizedBox(height: 32),
            // قسم البيانات الشخصية
            const Align(
              alignment: Alignment.centerLeft,
              child: Text('PERSONAL DETAILS', style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold, color: Colors.grey)),
            ),
            const SizedBox(height: 12),
            _buildTextField('Full Name', 'Alexandra Sterling'),
            _buildTextField('Email Address', 'alexandra.s@design.co'),
            _buildTextField('Location', 'San Francisco, CA'),
            _buildTextField('Industry', 'Product Design'),
            const SizedBox(height: 32),
            // قسم التنبيهات
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: const Color(0xFFF1F3F6),
                borderRadius: BorderRadius.circular(24),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text('EMAIL NOTIFICATIONS', style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold, color: Colors.grey)),
                  const SizedBox(height: 12),
                  _buildNotificationTile(Icons.shopping_bag_outlined, 'New oob Matches', _newMatches, (val) => setState(() => _newMatches = val)),
                  _buildNotificationTile(Icons.chat_bubble_outline, 'Direct Messages', _directMessages, (val) => setState(() => _directMessages = val)),
                  _buildNotificationTile(Icons.verified_outlined, 'Product Updates', _productUpdates, (val) => setState(() => _productUpdates = val)),
                ],
              ),
            ),
            const SizedBox(height: 40),
            // أزرار الحفظ
            SizedBox(
              width: double.infinity,
              height: 55,
              child: ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF3F51B5),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
                ),
                child: const Text('Save Profile', style: TextStyle(fontSize: 18, color: Colors.white)),
              ),
            ),
            TextButton(
              onPressed: () {},
              child: const Text('Discard Changes', style: TextStyle(color: Colors.grey)),
            ),
            const SizedBox(height: 100), // مساحة إضافية للتحريك
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: 3,
        selectedItemColor: const Color(0xFF3F51B5),
        unselectedItemColor: Colors.grey,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.work_outline), label: 'PROoECTS'),
          BottomNavigationBarItem(icon: Icon(Icons.payments_outlined), label: 'EARNINGS'),
          BottomNavigationBarItem(icon: Icon(Icons.message_outlined), label: 'MESSAGES'),
          BottomNavigationBarItem(icon: Icon(Icons.settings), label: 'SETTINGS'),
        ],
      ),
    );
  }

  Widget _buildTextField(String label, String value) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(label, style: const TextStyle(fontSize: 13, color: Colors.black87)),
          const SizedBox(height: 8),
          TextField(
            decoration: InputDecoration(
              filled: true,
              fillColor: const Color(0xFFE8EAF6).withOpacity(0.5),
              hintText: value,
              contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
              border: OutlineInputBorder(borderRadius: BorderRadius.circular(8), borderSide: BorderSide.none),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildNotificationTile(IconData icon, String title, bool value, ValueChanged<bool> onChanged) {
    return Container(
      margin: const EdgeInsets.only(bottom: 10),
      decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(16)),
      child: SwitchListTile(
        secondary: CircleAvatar(
          backgroundColor: const Color(0xFFE8EAF6),
          child: Icon(icon, color: const Color(0xFF3F51B5), size: 20),
        ),
        title: Text(title, style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w500)),
        value: value,
        activeColor: const Color(0xFF3F51B5),
        onChanged: onChanged,
      ),
    );
  }
}