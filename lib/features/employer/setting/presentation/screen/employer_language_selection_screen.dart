import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../core/component/appbar/common_app_bar.dart';
import '../../../../../core/constants/app_string.dart';
import '../../../../../core/component/text/common_text.dart';

class LanguageSelectionScreen extends StatefulWidget {
  const LanguageSelectionScreen({super.key});

  @override
  State<LanguageSelectionScreen> createState() =>
      _LanguageSelectionScreenState();
}

class _LanguageSelectionScreenState extends State<LanguageSelectionScreen> {
  String selectedLanguage = 'English';

  final List<Map<String, String>> languages = [
    {'name': 'English', 'code': 'en', 'flag': '🇺🇸'},
    {'name': 'German', 'code': 'de', 'flag': '🇩🇪'},
    {'name': 'Dutch(Holland)', 'code': 'nl', 'flag': '🇳🇱'},
    {'name': 'French', 'code': 'fr', 'flag': '🇫🇷'},
    {'name': 'Spanish', 'code': 'es', 'flag': '🇪🇸'},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CommonAppBar(title: AppString.language),
      body: SafeArea(
        child: Container(
          color: const Color(0xFFF5F5F5),
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: ListView.builder(
                    itemCount: languages.length,
                    itemBuilder: (context, index) {
                      final language = languages[index];
                      final isSelected = selectedLanguage == language['name'];
                      return Container(
                        margin: EdgeInsets.only(bottom: 12.h),
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            begin: Alignment.centerLeft,
                            end: Alignment.centerRight,
                            colors: [
                              Color(0xFF083E4B),
                              Color(0xFF074E5E),
                              Color(0xFF0288A6),
                            ],
                            stops: [0.0, 0.5, 1.0],
                          ),
                          borderRadius: BorderRadius.circular(6),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.1),
                              blurRadius: 10,
                              offset: Offset(0, 4),
                            ),
                          ],
                        ),
                        child: ListTile(
                          contentPadding: EdgeInsets.symmetric(
                            horizontal: 16.w,
                            vertical: 8.h,
                          ),
                          leading: SizedBox(
                            width: 32.w,
                            height: 32.h,
                            child: Center(
                              child: Text(
                                language['flag']!,
                                style: TextStyle(fontSize: 24.sp),
                              ),
                            ),
                          ),
                          title: CommonText(
                            text: language['name']!,
                            fontSize: 16.sp,
                            fontWeight: FontWeight.w500,
                            color: Colors.white,
                          ),
                          trailing: Container(
                            width: 24.w,
                            height: 24.h,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: isSelected
                                  ? Colors.white
                                  : Colors.transparent,
                              border: Border.all(color: Colors.white, width: 2),
                            ),
                            child: isSelected
                                ? Icon(
                                    Icons.check,
                                    color: const Color(0xFF2E5A6B),
                                    size: 16.sp,
                                  )
                                : null,
                          ),
                          onTap: () {
                            setState(() {
                              selectedLanguage = language['name']!;
                            });
                          },
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
