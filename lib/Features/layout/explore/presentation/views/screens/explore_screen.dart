import 'package:flutter/material.dart';
import 'package:online_exam_app_elevate/core/extensions/extensions.dart';


import '../../../../../../core/routes/app_routes.dart';
import '../../../../../../core/theme/app_colors.dart';

class ExploreScreen extends StatelessWidget {
  const ExploreScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Survey",
              style: TextStyle(
                color: AppColors.blue,
                fontWeight: FontWeight.w500,
                fontSize: 24,
              ),
            ),
            const SizedBox(height: 16),
            TextFormField(
              onChanged: (value) {},
              decoration: InputDecoration(
                hintText: 'Search',
                prefixIcon: Icon(Icons.search, color: AppColors.black[30]),
                contentPadding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 0,
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(
                    32,
                  ), // fully rounded edges
                  borderSide: const BorderSide(color: AppColors.grey),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(32),
                  borderSide: const BorderSide(color: AppColors.grey),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(32),
                  borderSide: BorderSide(color: AppColors.blue),
                ),
              ),
            ),
            const SizedBox(height: 32),
            Text(
              "Browse by subject",
              style: TextStyle(
                color: AppColors.black,
                fontWeight: FontWeight.w500,
                fontSize: 20,
              ),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: 4,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: (){
                      Navigator.pushNamed(context, AppRoutes.exams);
                    },
                    child: Container(
                      height: 90,
                      width: double.infinity,
                      margin: const EdgeInsets.symmetric(vertical: 12),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.05),
                            blurRadius: 8,
                            offset: const Offset(0, 4), // horizontal, vertical
                          ),
                        ],
                      ),
                      child: Container(
                        width: double.infinity,
                        padding: const EdgeInsets.symmetric(vertical: 16,horizontal: 24),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10),
                      ),
                        child: Row(
                          children: [
                            Image.asset("assets/icons/Language.png",height: 48,),
                            const SizedBox(width: 10,),
                            const Text("Language"),
                          ],
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ).setHorizontalAndVerticalPadding(context, 0.04, 0.012),
      ),
    );
  }
}
