import 'package:flutter/material.dart';
import 'package:smart_app/features/home/home_screen.dart';

class SmartWelcomeScreen extends StatelessWidget {
  // الألوان الرئيسية
  final Color mainBlue = const Color(0xFF3264F8);
  final Color lightBlue = const Color(0xFFF3F7FF);

  const SmartWelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl, // فرض الاتجاه من اليمين لليسار
      child: Scaffold(
        backgroundColor: lightBlue,
        body: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // شعار التطبيق
                Container(
                  margin: const EdgeInsets.only(bottom: 16),
                  width: 90,
                  height: 90,
                  child: Image.asset(
                    'assets/images/smart_app_icon_clear.png', // شعار التطبيق
                    fit: BoxFit.contain,
                  ),
                ),

                const SizedBox(height: 12),

                // جملة ترحيبية
                const Text(
                  'مرحباً بك في تطبيق Smart',
                  style: TextStyle(fontSize: 18, color: Colors.black54),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 32),

                // البطاقة الأولى
                _buildFeatureCard(
                  icon: Icons.chat_bubble_outline,
                  title: 'توليد الرسائل',
                  description: 'أنشئ رسائل احترافية بالذكاء الاصطناعي',
                ),
                const SizedBox(height: 16),

                // بطاقة واتساب بصورة
                _buildFeatureCard(
                  imageAsset: 'assets/icons/Whatsapp-removebg-preview.png',
                  title: 'إرسال مباشر',
                  description: 'إرسال رسائل متعددة عبر واتساب بسرعة وسهولة',
                ),
                const SizedBox(height: 16),

                // البطاقة الثالثة
                _buildFeatureCard(
                  icon: Icons.bolt,
                  title: 'سريع وذكي',
                  description: 'احصل على نتائج فورية ومخصصة',
                ),

                const SizedBox(height: 36),

                // زر البدء
                SizedBox(
                  width: 260,
                  height: 50,
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const HomeScreen(),
                        ),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: mainBlue,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(14),
                      ),
                      elevation: 2,
                    ),
                    child: const Text(
                      'ابدأ الآن',
                      style: TextStyle(fontSize: 20, color: Colors.white),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  // دالة البطاقة الموحدة (صورة أو أيقونة) مع دعم RTL
  static Widget _buildFeatureCard({
    IconData? icon,
    String? imageAsset,
    required String title,
    required String description,
  }) {
    return Container(
      width: 330,
      padding: const EdgeInsets.symmetric(vertical: 18, horizontal: 18),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(18),
        boxShadow: const [
          BoxShadow(color: Colors.black12, blurRadius: 7, offset: Offset(0, 4)),
        ],
      ),
      child: Row(
        textDirection: TextDirection.rtl, // اتجاه العناصر من اليمين لليسار
        children: [
          // النص أولاً (في اليمين)
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16.5,
                    color: Colors.black,
                  ),
                  textAlign: TextAlign.right, // محاذاة النص لليمين
                ),
                const SizedBox(height: 4),
                Text(
                  description,
                  style: const TextStyle(fontSize: 14.5, color: Colors.black54),
                  textAlign: TextAlign.right, // محاذاة النص لليمين
                ),
              ],
            ),
          ),
          const SizedBox(width: 18),
          // الأيقونة/الصورة ثانياً (في اليسار)
          Container(
            width: 44,
            height: 44,
            decoration: BoxDecoration(
              color: const Color(0xFFF3F7FF),
              borderRadius: BorderRadius.circular(12),
            ),
            child:
                imageAsset != null
                    ? Padding(
                      padding: const EdgeInsets.all(7.0),
                      child: Image.asset(imageAsset, fit: BoxFit.contain),
                    )
                    : Icon(icon, color: const Color(0xFF3264F8), size: 26),
          ),
        ],
      ),
    );
  }
}
