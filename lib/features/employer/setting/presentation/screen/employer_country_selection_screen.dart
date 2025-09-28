import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../core/component/appbar/common_app_bar.dart';
import '../../../../../core/constants/app_string.dart';
import '../../../../../core/component/text/common_text.dart';

class CountrySelectionScreen extends StatefulWidget {
  const CountrySelectionScreen({super.key});

  @override
  State<CountrySelectionScreen> createState() => _CountrySelectionScreenState();
}

class _CountrySelectionScreenState extends State<CountrySelectionScreen> {
  String selectedCountry = 'English';
  String searchQuery = '';

  final List<Map<String, String>> countries = [
    {'name': 'English', 'code': 'EN', 'flag': '🇺🇸'},
    {'name': 'German', 'code': 'DE', 'flag': '🇩🇪'},
    {'name': 'Dutch(Holland)', 'code': 'NL', 'flag': '🇳🇱'},
    {'name': 'French', 'code': 'FR', 'flag': '🇫🇷'},
    {'name': 'Spanish', 'code': 'ES', 'flag': '🇪🇸'},
  ];

  List<Map<String, String>> get filteredCountries {
    if (searchQuery.isEmpty) {
      return countries;
    }
    return countries
        .where(
          (country) => country['name']!.toLowerCase().contains(
            searchQuery.toLowerCase(),
          ),
        )
        .toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CommonAppBar(title: AppString.country),
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
                    itemCount: filteredCountries.length,
                    itemBuilder: (context, index) {
                      final country = filteredCountries[index];
                      final isSelected = selectedCountry == country['name'];

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
                                country['flag']!,
                                style: TextStyle(fontSize: 24.sp),
                              ),
                            ),
                          ),
                          title: CommonText(
                            text: country['name']!,
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
                              selectedCountry = country['name']!;
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
