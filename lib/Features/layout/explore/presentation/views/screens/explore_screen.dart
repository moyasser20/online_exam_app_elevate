import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:online_exam_app_elevate/core/routes/app_routes.dart';
import 'package:online_exam_app_elevate/core/theme/app_colors.dart';
import 'package:online_exam_app_elevate/core/extensions/extensions.dart';

import '../../../domain/entity/subjects_entity.dart';
import '../../viewmodel/get_all_subject_states.dart';
import '../../viewmodel/get_all_subject_viewmodel.dart';

class ExploreScreen extends StatelessWidget {
  const ExploreScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: BlocBuilder<GetAllSubjectViewModel, GetAllSubjectStates>(
          builder: (context, state) {
            if (state is GetAllSubjectLoadingState) {
              return const Center(child: CircularProgressIndicator());
            } else if (state is GetAllSubjectSuccessState) {
              return _buildBody(context, state.subjects);
            } else if (state is GetAllSubjectErrorState) {
              return Center(child: Text("Error: ${state.message}"));
            } else {
              return const SizedBox.shrink();
            }
          },
        ).setHorizontalAndVerticalPadding(context, 0.04, 0.012),
      ),
    );
  }

  Widget _buildBody(BuildContext context, List<SubjectEntity> subjects) {
    return Column(
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
            contentPadding: const EdgeInsets.symmetric(horizontal: 16),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(32),
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
        const SizedBox(height: 16),
        Expanded(
          child: ListView.builder(
            itemCount: subjects.length,
            itemBuilder: (context, index) {
              final subject = subjects[index];
              return GestureDetector(
                onTap: () {
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
                        offset: const Offset(0, 4),
                      ),
                    ],
                  ),
                  child: Container(
                    width: double.infinity,
                    padding: const EdgeInsets.symmetric(
                        vertical: 16, horizontal: 24),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Row(
                      children: [
                        Image.network(subject.icon, height: 48),
                        const SizedBox(width: 10),
                        Text(subject.name),
                      ],
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
