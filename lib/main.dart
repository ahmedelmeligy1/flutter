import 'package:flutter/material.dart';
import 'Setting.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'WorkY Profile',
      theme: ThemeData(
        scaffoldBackgroundColor: const Color(0xFFF7F8FC),
        primaryColor: const Color(0xFF5E60CE),
        textTheme: const TextTheme(
          displayLarge: TextStyle(fontWeight: FontWeight.bold, fontSize: 24, color: Colors.black),
          titleLarge: TextStyle(fontWeight: FontWeight.w600, fontSize: 18, color: Colors.black),
          titleMedium: TextStyle(fontWeight: FontWeight.w600, fontSize: 16, color: Colors.black),
          bodyMedium: TextStyle(fontSize: 14, color: Colors.black87),
          bodySmall: TextStyle(fontSize: 12, color: Colors.grey),
        ),
      ),
      home: const ProfilePage(),
    );
  }
}

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF7F8FC),
      bottomNavigationBar: const BottomNavBarWidget(),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                const HeaderWidget(),
                const SizedBox(height: 16),
                const CardWidget(child: HeroSection()),
                const SizedBox(height: 16),
                const CardWidget(title: "About", child: AboutSection()),
                const SizedBox(height: 16),
                const CardWidget(
                  title: "Selected Portfolio",
                  rightWidget: Text(
                    "View All",
                    style: TextStyle(
                        color: Color(0xFF5E60CE),
                        fontWeight: FontWeight.bold,
                        fontSize: 12),
                  ),
                  child: PortfolioSection(),
                ),
                const SizedBox(height: 16),
                const CardWidget(title: "Experience", child: ExperienceSection()),
                const SizedBox(height: 16),
                const TopRatedBanner(),
                const SizedBox(height: 16),
                const CardWidget(title: "Skills", child: SkillsSection()),
                const SizedBox(height: 16),
                const CardWidget(title: "Education", child: EducationSection()),
                const SizedBox(height: 16),
                const CardWidget(title: "Quick Info", child: QuickInfoSection()),
                const SizedBox(height: 20),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

// ─── Header ───────────────────────────────────────────────────────────────────
class HeaderWidget extends StatelessWidget {
  const HeaderWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const Text(
          "WorkY",
          style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Color(0xFF5E60CE)),
        ),
        Row(
          children: [
            IconButton(
              icon: const Icon(Icons.notifications_none),
              onPressed: () {},
            ),
            IconButton(
              icon: const Icon(Icons.settings, color: Color(0xFF5E60CE)),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const SettingsPage()),
                );
              },
            ),
          ],
        ),
      ],
    );
  }
}

// ─── Card Wrapper ─────────────────────────────────────────────────────────────
class CardWidget extends StatelessWidget {
  final String? title;
  final Widget? rightWidget;
  final Widget child;

  const CardWidget(
      {super.key, this.title, this.rightWidget, required this.child});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (title != null) ...[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(title!,
                    style: const TextStyle(
                        fontWeight: FontWeight.bold, fontSize: 16)),
                if (rightWidget != null) rightWidget!,
              ],
            ),
            const SizedBox(height: 12),
          ],
          child,
        ],
      ),
    );
  }
}

// ─── Hero Section ─────────────────────────────────────────────────────────────
class HeroSection extends StatelessWidget {
  const HeroSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Cover + Avatar في Stack
        Stack(
          clipBehavior: Clip.none,
          children: [
            // صورة الغلاف
            ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: Container(
                height: 120,
                width: double.infinity,
                color: const Color(0xFF001A3F),
              ),
            ),
            // الأفاتار في اليمين أسفل الغلاف
            Positioned(
              bottom: -35,
              right: 12,
              child: Container(
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(color: Colors.white, width: 3),
                ),
                child: const CircleAvatar(
                  radius: 40,
                  backgroundColor: Colors.grey,
                  backgroundImage: AssetImage('assets/images/1.jpeg'),
                ),
              ),
            ),
          ],
        ),

        const SizedBox(height: 45), // مساحة للأفاتار

        // الاسم والتايتل على اليسار
        const Text(
          "Ahmed El-Meligy",
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 4),
        const Text(
          "Full-Stack Developer ",
          style: TextStyle(
              color: Color(0xFF5E60CE),
              fontWeight: FontWeight.w600,
              fontSize: 13),
        ),
        const SizedBox(height: 10),

        // Location & Date
        const Row(
          children: [
            Icon(Icons.location_on_outlined, size: 14, color: Colors.grey),
            Text(" Mansoura, Egypt",
                style: TextStyle(color: Colors.grey, fontSize: 12)),
            SizedBox(width: 15),
            Icon(Icons.calendar_today_outlined, size: 14, color: Colors.grey),
            Text(" Joined March 2022",
                style: TextStyle(color: Colors.grey, fontSize: 12)),
          ],
        ),
        const SizedBox(height: 20),

        // Buttons
        Row(
          children: [
            Expanded(
              child: OutlinedButton(
                onPressed: () {},
                style: OutlinedButton.styleFrom(
                  shape: const StadiumBorder(),
                  side: const BorderSide(color: Color(0xFF5E60CE)),
                ),
                child: const Text("Message",
                    style: TextStyle(color: Color(0xFF5E60CE))),
              ),
            ),
            const SizedBox(width: 10),
            Expanded(
              child: ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF5E60CE),
                  shape: const StadiumBorder(),
                ),
                child: const Text("Hire Marcus",
                    style: TextStyle(color: Colors.white)),
              ),
            ),
          ],
        ),
      ],
    );
  }
}

// ─── About ────────────────────────────────────────────────────────────────────
class AboutSection extends StatelessWidget {
  const AboutSection({super.key});

  @override
  Widget build(BuildContext context) {
    return const Text(
      "I bridge the gap between complex engineering and human-centric design. "
      "With over 8 years of experience building scalable web applications, "
      "I specialize in React, Node.js, and the craft of pixel-perfect interfaces. "
      "My goal is to build digital products that aren't just functional, "
      "but an absolute joy to use.",
      style: TextStyle(height: 1.6, color: Colors.black87, fontSize: 14),
    );
  }
}

// ─── Portfolio ────────────────────────────────────────────────────────────────
// ✅ تم إصلاح الـ error: شيلنا الـ Container الزيادة وخلينا Image.asset بس
class PortfolioSection extends StatelessWidget {
  const PortfolioSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // الصورة الكبيرة
        ClipRRect(
          borderRadius: BorderRadius.circular(12),
          child: Image.asset(
            'assets/images/2.png',
            height: 150,
            width: double.infinity,
            fit: BoxFit.cover,
          ),
        ),
        const SizedBox(height: 10),
        Row(
          children: [
            // الصورة الصغيرة الأولى
            Expanded(
              child: ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: Image.asset(
                  'assets/images/3.png',
                  height: 80,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            const SizedBox(width: 10),
            // الصورة الصغيرة الثانية
            Expanded(
              child: ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: Image.asset(
                  'assets/images/4.png',
                  height: 80,
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}

// ─── Experience ───────────────────────────────────────────────────────────────
class ExperienceSection extends StatelessWidget {
  const ExperienceSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _buildExpItem(
          icon: Icons.business_center_outlined,
          iconBg: const Color(0xFFEEF2FF),
          iconColor: const Color(0xFF5E60CE),
          title: "Lead Product Engineer",
          company: "Stripe (Contract)",
          period: "Jan 2021 - Present",
          description:
              "Modernizing the internal dashboard architecture using Next.js "
              "and Tailwind CSS. Orchestrated the migration of legacy data "
              "tables to a high-performance virtualized grid system.",
        ),
        const Divider(height: 30),
        _buildExpItem(
          icon: Icons.cloud_outlined,
          iconBg: const Color(0xFFE0F2FE),
          iconColor: const Color(0xFF0EA5E9),
          title: "Senior UI Developer",
          company: "Dropbox",
          period: "Jun 2018 - Dec 2020",
          description:
              "Collaborated with the design team to build and maintain the "
              "\"Nimbus\" design system. Reduced frontend bundle size by 30% "
              "through modular component refactoring.",
        ),
      ],
    );
  }

  Widget _buildExpItem({
    required IconData icon,
    required Color iconBg,
    required Color iconColor,
    required String title,
    required String company,
    required String period,
    required String description,
  }) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            color: iconBg,
            borderRadius: BorderRadius.circular(8),
          ),
          child: Icon(icon, color: iconColor, size: 20),
        ),
        const SizedBox(width: 12),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(title,
                  style: const TextStyle(fontWeight: FontWeight.bold)),
              Text(
                "$company  •  $period",
                style: const TextStyle(
                    color: Color(0xFF5E60CE),
                    fontSize: 12,
                    fontWeight: FontWeight.w600),
              ),
              const SizedBox(height: 5),
              Text(
                description,
                style: const TextStyle(
                    color: Colors.black54, fontSize: 13, height: 1.5),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

// ─── Top Rated Banner ─────────────────────────────────────────────────────────
class TopRatedBanner extends StatelessWidget {
  const TopRatedBanner({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: const Color(0xFF7B7DF1),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "PROVIDER LEVEL",
            style: TextStyle(
                color: Colors.white70,
                fontSize: 11,
                letterSpacing: 1.2,
                fontWeight: FontWeight.w500),
          ),
          const SizedBox(height: 6),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                "Top Rated",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 26,
                    fontWeight: FontWeight.bold),
              ),
              Container(
                padding: const EdgeInsets.all(6),
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.2),
                  shape: BoxShape.circle,
                ),
                child: const Icon(Icons.verified_outlined,
                    color: Colors.white, size: 22),
              ),
            ],
          ),
          const SizedBox(height: 15),
          ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: const LinearProgressIndicator(
              value: 0.98,
              backgroundColor: Color(0xFF9E9FF5),
              color: Colors.white,
              minHeight: 6,
            ),
          ),
          const SizedBox(height: 8),
          const Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("Success Rate",
                  style: TextStyle(color: Colors.white70, fontSize: 13)),
              Text("98%",
                  style: TextStyle(
                      color: Colors.white, fontWeight: FontWeight.bold)),
            ],
          ),
        ],
      ),
    );
  }
}

// ─── Skills ───────────────────────────────────────────────────────────────────
class SkillsSection extends StatelessWidget {
  const SkillsSection({super.key});

  @override
  Widget build(BuildContext context) {
    final skills = [
      "React / Next.js",
      "TypeScript",
      "Node.js",
      "Tailwind CSS",
      "AWS Cloud",
      "GraphQL",
      "Figma",
      "Docker",
    ];
    return Wrap(
      spacing: 8,
      runSpacing: 8,
      children: skills
          .map((s) => Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                decoration: BoxDecoration(
                  color: Colors.grey[100],
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(color: const Color(0xFFE5E7EB)),
                ),
                child: Text(s, style: const TextStyle(fontSize: 12)),
              ))
          .toList(),
    );
  }
}

// ─── Education ────────────────────────────────────────────────────────────────
class EducationSection extends StatelessWidget {
  const EducationSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            color: const Color(0xFFEFF6FF),
            borderRadius: BorderRadius.circular(8),
          ),
          child: const Icon(Icons.school_outlined,
              color: Color(0xFF3B82F6), size: 22),
        ),
        const SizedBox(width: 12),
        const Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("B.S. Computer Science",
                style: TextStyle(fontWeight: FontWeight.bold)),
            Text("Mansours University",
                style: TextStyle(color: Colors.grey, fontSize: 13)),
            Text("2023 – 2027",
                style: TextStyle(color: Colors.grey, fontSize: 12)),
          ],
        ),
      ],
    );
  }
}

// ─── Quick Info ───────────────────────────────────────────────────────────────
class QuickInfoSection extends StatelessWidget {
  const QuickInfoSection({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text("Hourly Rate",
                style: TextStyle(color: Colors.black54, fontSize: 14)),
            Text("\$120/hr",
                style: TextStyle(
                    color: Color(0xFF5E60CE), fontWeight: FontWeight.bold)),
          ],
        ),
        Divider(height: 20),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text("Response Time",
                style: TextStyle(color: Colors.black54, fontSize: 14)),
            Text("< 2 hours",
                style: TextStyle(
                    color: Color(0xFF5E60CE), fontWeight: FontWeight.bold)),
          ],
        ),
        Divider(height: 20),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text("Availability",
                style: TextStyle(color: Colors.black54, fontSize: 14)),
            Text("Available",
                style: TextStyle(
                    color: Colors.green, fontWeight: FontWeight.bold)),
          ],
        ),
      ],
    );
  }
}

// ─── Bottom Nav Bar ───────────────────────────────────────────────────────────
class BottomNavBarWidget extends StatelessWidget {
  const BottomNavBarWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: 4,
      selectedItemColor: const Color(0xFF5E60CE),
      unselectedItemColor: Colors.grey,
      type: BottomNavigationBarType.fixed,
      items: const [
        BottomNavigationBarItem(
            icon: Icon(Icons.home_outlined), label: "HOME"),
        BottomNavigationBarItem(icon: Icon(Icons.search), label: "SEARCH"),
        BottomNavigationBarItem(
            icon: Icon(Icons.add_circle, size: 35), label: ""),
        BottomNavigationBarItem(
            icon: Icon(Icons.chat_bubble_outline), label: "CHAT"),
        BottomNavigationBarItem(icon: Icon(Icons.person), label: "PROFILE"),
      ],
    );
  }
}