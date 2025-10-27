import 'package:flutter/material.dart';
import 'doctor/doctor_login.dart';
import 'doctor/doctor_signup.dart';
import 'patient/patient_login.dart';
import 'patient/patient_signup.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  String _selectedRole = '';

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Column(
            children: [
              const SizedBox(height: 30),

              // 🔹 الشعار الكبير
              Image.asset(
                'assets/images/logo.png',
                height: 200,
              ),
              const SizedBox(height: 10),
              const Text(
                'Hopeline',
                style: TextStyle(
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'Roboto-Regular',
                ),
              ),
              const Text(
                'Psychotherapy',
                style: TextStyle(
                  fontSize: 18,
                  color: Color(0xFF3F8187),
                  fontFamily: 'Roboto-Regular',
                ),
              ),
              const SizedBox(height: 40),

              // 🔹 تبويبات تسجيل الدخول / إنشاء حساب
              Container(
                decoration: BoxDecoration(
                  color: Colors.grey[200],
                  borderRadius: BorderRadius.circular(12),
                ),
                child: TabBar(
                  controller: _tabController,
                  indicator: BoxDecoration(
                    color: const Color(0xFF3F8187),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  labelColor: Colors.white,
                  unselectedLabelColor: Colors.black87,
                  labelStyle: const TextStyle(
                    fontFamily: 'NotoSansArabic-Regular',
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                  ),
                  tabs: const [
                    Tab(text: 'تسجيل الدخول'),
                    Tab(text: 'إنشاء حساب'),
                  ],
                ),
              ),

              const SizedBox(height: 50),

              // 🔹 العنوان الصغير في المنتصف
              const Text(
                'من أنت؟',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'NotoSansArabic-Regular',
                ),
              ),
              const SizedBox(height: 25),

              // 🔹 أزرار اختيار الطبيب أو المريض
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  _buildRoleButton('أنا مريض', Icons.favorite, 'patient'),
                  const SizedBox(width: 25),
                  _buildRoleButton('أنا طبيب', Icons.medical_services, 'doctor'),
                ],
              ),
              const SizedBox(height: 50),

              // 🔹 زر المتابعة
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: _selectedRole.isEmpty
                      ? null
                      : () {
                    // 🔹 التحقق من التبويب والانتقال حسب الاختيار
                    if (_tabController.index == 0) {
                      // تسجيل الدخول
                      if (_selectedRole == 'patient') {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>
                            const PatientLoginPage(),
                          ),
                        );
                      } else if (_selectedRole == 'doctor') {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>
                            const DoctorLoginPage(),
                          ),
                        );
                      }
                    } else {
                      // إنشاء حساب
                      if (_selectedRole == 'patient') {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>
                            const PatientSignUpPage(),
                          ),
                        );
                      } else if (_selectedRole == 'doctor') {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>
                            const DoctorSignUpPage(),
                          ),
                        );
                      }
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF3F8187),
                    padding: const EdgeInsets.symmetric(vertical: 14),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    elevation: 3,
                  ),
                  child: const Text(
                    'التالي',
                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'NotoSansArabic-Regular',
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 25),
            ],
          ),
        ),
      ),
    );
  }

  // 🔹 زر اختيار الدور (مريض / طبيب)
  Widget _buildRoleButton(String text, IconData icon, String role) {
    final bool isSelected = _selectedRole == role;

    return GestureDetector(
      onTap: () {
        setState(() {
          _selectedRole = role;
        });
      },
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 250),
        padding: const EdgeInsets.symmetric(vertical: 18, horizontal: 22),
        decoration: BoxDecoration(
          color: isSelected ? const Color(0xFF3F8187) : Colors.white,
          border: Border.all(
            color: const Color(0xFF3F8187),
            width: 1.3,
          ),
          borderRadius: BorderRadius.circular(14),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.15),
              blurRadius: 6,
              offset: const Offset(0, 3),
            )
          ],
        ),
        child: Column(
          children: [
            Icon(
              icon,
              size: 42,
              color: isSelected ? Colors.white : const Color(0xFF3F8187),
            ),
            const SizedBox(height: 8),
            Text(
              text,
              style: TextStyle(
                fontSize: 16,
                fontFamily: 'NotoSansArabic-Regular',
                color: isSelected ? Colors.white : Colors.black87,
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
