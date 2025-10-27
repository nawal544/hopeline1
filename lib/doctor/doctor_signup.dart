import 'package:flutter/material.dart';

class DoctorSignUpPage extends StatefulWidget {
  const DoctorSignUpPage({super.key});

  @override
  State<DoctorSignUpPage> createState() => _DoctorSignUpPageState();
}

class _DoctorSignUpPageState extends State<DoctorSignUpPage> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _specialtyController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black87),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Column(
            children: [
              const SizedBox(height: 10),
              Image.asset('assets/images/logo.png', height: 180),
              const Text(
                'Hopeline',
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
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
              const SizedBox(height: 30),
              const Text(
                'إنشاء حساب الطبيب',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.black87,
                ),
              ),
              const SizedBox(height: 30),
              Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    _buildLabel('الاسم الكامل'),
                    _buildInputField(_nameController, 'ادخل اسمك', Icons.person),
                    const SizedBox(height: 20),

                    _buildLabel('التخصص'),
                    _buildInputField(
                        _specialtyController, 'مثلاً: نفسي، اجتماعي...', Icons.medical_services),
                    const SizedBox(height: 20),

                    _buildLabel('البريد الإلكتروني'),
                    _buildInputField(
                        _emailController, 'ادخل البريد الإلكتروني', Icons.email),
                    const SizedBox(height: 20),

                    _buildLabel('كلمة المرور'),
                    _buildInputField(
                        _passwordController, 'ادخل كلمة المرور', Icons.lock,
                        obscure: true),
                    const SizedBox(height: 30),

                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: () {
                          if (_formKey.currentState!.validate()) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                  content: Text('جاري إنشاء حساب الطبيب...')),
                            );
                          }
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xFF3F8187),
                          padding: const EdgeInsets.symmetric(vertical: 14),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                        ),
                        child: const Text(
                          'إنشاء الحساب',
                          style: TextStyle(
                            fontSize: 18,
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildLabel(String text) => Padding(
    padding: const EdgeInsets.only(right: 8.0),
    child: Text(
      text,
      style: const TextStyle(
          fontSize: 16,
          color: Colors.black87,
          fontWeight: FontWeight.w500),
      textAlign: TextAlign.right,
    ),
  );

  Widget _buildInputField(TextEditingController c, String hint, IconData icon,
      {bool obscure = false}) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.grey[100],
        border: Border.all(color: Colors.grey[300]!),
        borderRadius: BorderRadius.circular(12),
      ),
      child: TextFormField(
        controller: c,
        obscureText: obscure,
        textAlign: TextAlign.right,
        decoration: InputDecoration(
          hintText: hint,
          prefixIcon: Icon(icon, color: const Color(0xFF3F8187)),
          border: InputBorder.none,
          contentPadding:
          const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
        ),
        validator: (v) => v == null || v.isEmpty ? 'يرجى تعبئة الحقل' : null,
      ),
    );
  }
}
