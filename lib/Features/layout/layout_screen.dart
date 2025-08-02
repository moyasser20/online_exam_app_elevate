import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:online_exam_app_elevate/Features/layout/explore/presentation/viewmodel/get_all_subject_viewmodel.dart';
import 'package:online_exam_app_elevate/Features/layout/profile/presentation/viewmodel/profile_viewmodel.dart';
import 'package:online_exam_app_elevate/Features/layout/profile/presentation/views/screens/profile_Screen.dart';
import 'package:online_exam_app_elevate/Features/layout/result/presentation/views/screens/result_screen.dart';
import 'package:online_exam_app_elevate/core/di/di.dart';

import '../../core/Assets/app_assets.dart';
import '../../core/theme/app_colors.dart';
import 'explore/presentation/views/screens/explore_screen.dart';

class LayoutScreen extends StatefulWidget {
  const LayoutScreen({super.key});

  @override
  State<LayoutScreen> createState() => _LayoutScreenState();
}

class _LayoutScreenState extends State<LayoutScreen> {
  int _selectedIndex = 0;
  List<Widget> tabs = [
    BlocProvider(
      create: (_) => getIt<GetAllSubjectViewModel>()..getAllSubject(),
      child: ExploreScreen(),
    ),
    ResultScreen(),
    BlocProvider(
      create: (_) => getIt<ProfileViewModel>()..getProfile(),
        child: ProfileScreen()),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        onTap: _onNavbarSelectedIndex,
        currentIndex: _selectedIndex,
        type: BottomNavigationBarType.fixed,
        backgroundColor: AppColors.lightBlue,
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home_outlined, color: AppColors.blue),
            label: "Explore",
          ),
          BottomNavigationBarItem(
            icon: Image.asset(AppAssets.secondnavbar, color: AppColors.blue),
            label: "Result",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person_2_outlined, color: AppColors.blue),
            label: "Profile",
          ),
        ],
      ),
      body: tabs[_selectedIndex],
    );
  }

  _onNavbarSelectedIndex(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }
}
