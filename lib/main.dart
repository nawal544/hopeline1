import 'package:flutter/material.dart';
import 'login.dart'; // ✅ أضف هذا السطر

void main() {
  runApp(const HopeLineApp());
}

class HopeLineApp extends StatelessWidget {
  const HopeLineApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'HopeLine',
      theme: ThemeData(
        fontFamily: 'NotoSansArabic',
        scaffoldBackgroundColor: const Color(0xFFF9F9F9),
      ),
      home: const OnboardingScreen(),
    );
  }
}

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final PageController _controller = PageController();
  int _currentIndex = 0;

  final List<Map<String, String>> _pages = [
    {
      'title': 'HopeLine',
      'text':
      'جلسات مجدولة\nجلسة نفسية مرئية خلال 60 دقيقة مع الأخصائي\nوالراحة النفسية تبدأ بخطوة.',
      'image': 'assets/images/1.jpg',
    },
    {
      'title': 'HopeLine',
      'text':
      'افضل المتخصصين المرخصين\nالشبكة الاشمل من المختصين\nوالمعالجين المعتمدين\nذوي الكفاءة المهنية العالية.',
      'image': 'assets/images/2.jpg',
    },
    {
      'title': 'HopeLine',
      'text':
      'خصوصية كاملة\nجميع المحادثات والبيانات مشفّرة بالكامل\nعن طريق(E2E encryption).',
      'image': 'assets/images/3.jpg',
    },
    {
      'title': '', // ✅ إخفاء العنوان في الصفحة الأخيرة
      'text': 'مرحبًا..... 👋\nنؤمن أن رفاهيتك النفسية ممكنة،\n وأن الامل يبدأ بخطوة',
      'image': 'assets/images/logo.png',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFFFFFF),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: PageView.builder(
                controller: _controller,
                onPageChanged: (index) {
                  setState(() => _currentIndex = index);
                },
                itemCount: _pages.length,
                itemBuilder: (context, index) {
                  final page = _pages[index];
                  return Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 24.0, vertical: 32.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const SizedBox(height: 20),

                        // ✅ إخفاء العنوان فقط في الصفحة الأخيرة
                        if (index != _pages.length - 1)
                          Text(
                            page['title']!,
                            style: const TextStyle(
                              fontSize: 26,
                              fontWeight: FontWeight.bold,
                              color: Color(0xFF356859),
                            ),
                          ),

                        // ✅ تكبير الشعار في الصفحة الأخيرة
                        Image.asset(
                          page['image']!,
                          height: index == _pages.length - 2 ? 300 : 300,
                        ),

                        Text(
                          page['text']!,
                          textAlign: TextAlign.center,
                          style: const TextStyle(
                            fontSize: 16,
                            color: Color(0xFF333333),
                            height: 1.2,
                          ),
                        ),

                        Column(
                          children: [
                            const SizedBox(height: 20),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: List.generate(
                                _pages.length,
                                    (dotIndex) => AnimatedContainer(
                                  duration:
                                  const Duration(milliseconds: 300),
                                  margin:
                                  const EdgeInsets.symmetric(horizontal: 3),
                                  width:
                                  _currentIndex == dotIndex ? 12 : 8,
                                  height:
                                  _currentIndex == dotIndex ? 12 : 8,
                                  decoration: BoxDecoration(
                                    color: _currentIndex == dotIndex
                                        ? const Color(0xFF3F8187) // ✅ اللون المطلوب
                                        : Colors.grey[400],
                                    shape: BoxShape.circle,
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(height: 30),
                            ElevatedButton(
                              onPressed: () {
                                if (_currentIndex == _pages.length - 1) {
                                  // ✅ هنا ننتقل إلى صفحة login.dart
                                  Navigator.pushReplacement(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) =>
                                      const LoginPage(),
                                    ),
                                  );
                                } else {
                                  _controller.nextPage(
                                    duration:
                                    const Duration(milliseconds: 400),
                                    curve: Curves.easeInOut,
                                  );
                                }
                              },
                              style: ElevatedButton.styleFrom(
                                backgroundColor: const Color(0xFF3F8187), // ✅ نفس اللون للأزرار
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(16),
                                ),
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 60, vertical: 16),
                                elevation: 4,
                              ),
                              child: Text(
                                _currentIndex == _pages.length - 1
                                    ? 'ابدأ'
                                    : 'التالي',
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
