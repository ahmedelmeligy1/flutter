import 'package:flutter/material.dart';

void main() {
  runApp(const WorkYApp());
}

class WorkYApp extends StatelessWidget {
  const WorkYApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'WorkY',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: 'SF Pro Display',
        scaffoldBackgroundColor: const Color(0xFFF4F5F7),
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFF4F46E5),
        ),
      ),
      home: const JobDetailsScreen(),
    );
  }
}

class JobDetailsScreen extends StatefulWidget {
  const JobDetailsScreen({super.key});

  @override
  State<JobDetailsScreen> createState() => _JobDetailsScreenState();
}

class _JobDetailsScreenState extends State<JobDetailsScreen> {
  int _selectedTab = 0;

  final List<String> _tabs = ['About', 'Company', 'Review'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF4F5F7),
      body: Column(
        children: [
          Expanded(
            child: CustomScrollView(
              slivers: [
                // App Bar
                SliverAppBar(
                  backgroundColor: const Color(0xFFF4F5F7),
                  elevation: 0,
                  pinned: true,
                  leading: Container(
                    margin: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: IconButton(
                      icon: const Icon(
                        Icons.arrow_back_ios_new,
                        size: 16,
                        color: Color(0xFF1A1A2E),
                      ),
                      onPressed: () => Navigator.of(context).maybePop(),
                    ),
                  ),
                  title: const Text(
                    'WorkY',
                    style: TextStyle(
                      color: Color(0xFF4F46E5),
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  centerTitle: false,
                  actions: [
                    Container(
                      margin: const EdgeInsets.symmetric(vertical: 8),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: IconButton(
                        icon: const Icon(
                          Icons.share_outlined,
                          size: 18,
                          color: Color(0xFF1A1A2E),
                        ),
                        onPressed: () {},
                      ),
                    ),
                    const SizedBox(width: 4),
                    Container(
                      margin: const EdgeInsets.only(
                          top: 8, bottom: 8, right: 16),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: IconButton(
                        icon: const Icon(
                          Icons.bookmark_border,
                          size: 18,
                          color: Color(0xFF1A1A2E),
                        ),
                        onPressed: () {},
                      ),
                    ),
                  ],
                ),

                SliverToBoxAdapter(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Column(
                      children: [
                        const SizedBox(height: 16),

                        // Company Logo
                        Container(
                          width: 80,
                          height: 80,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(22),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withOpacity(0.08),
                                blurRadius: 20,
                                offset: const Offset(0, 4),
                              ),
                            ],
                          ),
                          child: const Center(
                            child: Text(
                              '✦',
                              style: TextStyle(
                                fontSize: 36,
                                color: Color(0xFF4F46E5),
                              ),
                            ),
                          ),
                        ),

                        const SizedBox(height: 20),

                        // Job Title
                        const Text(
                          'Senior Product Designer',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.w800,
                            color: Color(0xFF0F0F1A),
                            letterSpacing: -0.5,
                          ),
                        ),

                        const SizedBox(height: 8),

                        // Company & Location
                        RichText(
                          textAlign: TextAlign.center,
                          text: const TextSpan(
                            children: [
                              TextSpan(
                                text: 'Stripe',
                                style: TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.w700,
                                  color: Color(0xFF4F46E5),
                                ),
                              ),
                              TextSpan(
                                text: ' • HQ',
                                style: TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.w700,
                                  color: Color(0xFF4F46E5),
                                ),
                              ),
                            ],
                          ),
                        ),

                        const SizedBox(height: 4),

                        const Text(
                          'SAN FRANCISCO, CA',
                          style: TextStyle(
                            fontSize: 12,
                            color: Color(0xFF9CA3AF),
                            letterSpacing: 1.2,
                            fontWeight: FontWeight.w500,
                          ),
                        ),

                        const SizedBox(height: 24),

                        // Info Cards Grid
                        Row(
                          children: [
                            Expanded(
                              child: _InfoCard(
                                icon: Icons.wallet_outlined,
                                label: 'SALARY',
                                value: '\$160k - \$210k',
                              ),
                            ),
                            const SizedBox(width: 12),
                            Expanded(
                              child: _InfoCard(
                                icon: Icons.access_time_rounded,
                                label: 'JOB TYPE',
                                value: 'Full-time',
                              ),
                            ),
                          ],
                        ),

                        const SizedBox(height: 12),

                        Row(
                          children: [
                            Expanded(
                              child: _InfoCard(
                                icon: Icons.location_on_outlined,
                                label: 'MODEL',
                                value: 'Hybrid',
                              ),
                            ),
                            const SizedBox(width: 12),
                            Expanded(
                              child: _InfoCard(
                                icon: Icons.trending_up_rounded,
                                label: 'LEVEL',
                                value: 'Senior (L5)',
                              ),
                            ),
                          ],
                        ),

                        const SizedBox(height: 28),

                        // Tabs
                        Container(
                          padding: const EdgeInsets.all(4),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(16),
                          ),
                          child: Row(
                            children: List.generate(
                              _tabs.length,
                              (index) => Expanded(
                                child: GestureDetector(
                                  onTap: () =>
                                      setState(() => _selectedTab = index),
                                  child: AnimatedContainer(
                                    duration: const Duration(milliseconds: 200),
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 10),
                                    decoration: BoxDecoration(
                                      color: _selectedTab == index
                                          ? Colors.white
                                          : Colors.transparent,
                                      borderRadius: BorderRadius.circular(12),
                                      boxShadow: _selectedTab == index
                                          ? [
                                              BoxShadow(
                                                color: Colors.black
                                                    .withOpacity(0.08),
                                                blurRadius: 8,
                                                offset: const Offset(0, 2),
                                              ),
                                            ]
                                          : null,
                                    ),
                                    child: Text(
                                      _tabs[index],
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                        fontSize: 14,
                                        fontWeight: _selectedTab == index
                                            ? FontWeight.w700
                                            : FontWeight.w500,
                                        color: _selectedTab == index
                                            ? const Color(0xFF4F46E5)
                                            : const Color(0xFF9CA3AF),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),

                        const SizedBox(height: 28),

                        // Job Description
                        _SectionTitle(title: 'Job Description'),
                        const SizedBox(height: 12),
                        const Text(
                          'We are looking for a Senior Product Designer to join our Core Dashboard team. You will be responsible for defining the user experience for millions of businesses worldwide, focusing on clarity, efficiency, and aesthetics.',
                          style: TextStyle(
                            fontSize: 14,
                            color: Color(0xFF4B5563),
                            height: 1.7,
                          ),
                        ),
                        const SizedBox(height: 12),
                        const Text(
                          "You'll collaborate closely with engineering and product management to ship high-impact features that define the future of global commerce.",
                          style: TextStyle(
                            fontSize: 14,
                            color: Color(0xFF4B5563),
                            height: 1.7,
                          ),
                        ),

                        const SizedBox(height: 28),

                        // Requirements
                        _SectionTitle(title: 'Requirements'),
                        const SizedBox(height: 16),

                        _RequirementItem(
                          text:
                              '5+ years of experience in product design at high-growth tech companies.',
                        ),
                        _RequirementItem(
                          text:
                              'Expert proficiency in Figma and prototyping tools (Protopie, Framer).',
                        ),
                        _RequirementItem(
                          text:
                              'Strong visual design craft and systems thinking capabilities.',
                        ),
                        _RequirementItem(
                          text:
                              'Ability to work autonomously in a fast-paced environment.',
                        ),

                        const SizedBox(height: 28),

                        // Core Skills
                        const Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            'Core Skills',
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w800,
                              color: Color(0xFF0F0F1A),
                            ),
                          ),
                        ),
                        const SizedBox(height: 14),

                        Wrap(
                          spacing: 10,
                          runSpacing: 10,
                          children: [
                            _SkillChip(label: 'Product Strategy'),
                            _SkillChip(label: 'Interaction Design'),
                            _SkillChip(label: 'Design Systems'),
                            _SkillChip(
                                label: 'Figma Expert', isHighlighted: true),
                          ],
                        ),

                        const SizedBox(height: 100),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),

          // Bottom Bar
          Container(
            padding: const EdgeInsets.fromLTRB(20, 12, 20, 28),
            decoration: BoxDecoration(
              color: const Color(0xFFF4F5F7),
              border: Border(
                top: BorderSide(
                  color: Colors.black.withOpacity(0.06),
                  width: 1,
                ),
              ),
            ),
            child: Row(
              children: [
                // Email Button
                Container(
                  width: 52,
                  height: 52,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(14),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.06),
                        blurRadius: 10,
                        offset: const Offset(0, 2),
                      ),
                    ],
                  ),
                  child: const Icon(
                    Icons.mail_outline_rounded,
                    color: Color(0xFF4B5563),
                    size: 22,
                  ),
                ),

                const SizedBox(width: 12),

                // Apply Button
                Expanded(
                  child: SizedBox(
                    height: 52,
                    child: ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFF4F46E5),
                        foregroundColor: Colors.white,
                        elevation: 0,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(16),
                        ),
                      ),
                      child: const Text(
                        'Apply for Job',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w700,
                          letterSpacing: 0.2,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

// ─── Reusable Widgets ───────────────────────────────────────────────────────

class _InfoCard extends StatelessWidget {
  final IconData icon;
  final String label;
  final String value;

  const _InfoCard({
    required this.icon,
    required this.label,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 14),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(18),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 12,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(icon, color: const Color(0xFF4F46E5), size: 22),
          const SizedBox(height: 10),
          Text(
            label,
            style: const TextStyle(
              fontSize: 10,
              color: Color(0xFF9CA3AF),
              letterSpacing: 0.8,
              fontWeight: FontWeight.w600,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            value,
            style: const TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.w700,
              color: Color(0xFF0F0F1A),
            ),
          ),
        ],
      ),
    );
  }
}

class _SectionTitle extends StatelessWidget {
  final String title;

  const _SectionTitle({required this.title});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          width: 4,
          height: 22,
          decoration: BoxDecoration(
            color: const Color(0xFF4F46E5),
            borderRadius: BorderRadius.circular(4),
          ),
        ),
        const SizedBox(width: 10),
        Text(
          title,
          style: const TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w800,
            color: Color(0xFF0F0F1A),
          ),
        ),
      ],
    );
  }
}

class _RequirementItem extends StatelessWidget {
  final String text;

  const _RequirementItem({required this.text});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 14),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            margin: const EdgeInsets.only(top: 2),
            width: 20,
            height: 20,
            decoration: BoxDecoration(
              color: const Color(0xFFEEF2FF),
              shape: BoxShape.circle,
            ),
            child: const Icon(
              Icons.check,
              size: 12,
              color: Color(0xFF4F46E5),
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Text(
              text,
              style: const TextStyle(
                fontSize: 14,
                color: Color(0xFF4B5563),
                height: 1.5,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _SkillChip extends StatelessWidget {
  final String label;
  final bool isHighlighted;

  const _SkillChip({required this.label, this.isHighlighted = false});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      decoration: BoxDecoration(
        color: isHighlighted
            ? const Color(0xFF4F46E5)
            : const Color(0xFFF3F4F6),
        borderRadius: BorderRadius.circular(30),
      ),
      child: Text(
        label,
        style: TextStyle(
          fontSize: 13,
          fontWeight: FontWeight.w600,
          color: isHighlighted ? Colors.white : const Color(0xFF374151),
        ),
      ),
    );
  }
}