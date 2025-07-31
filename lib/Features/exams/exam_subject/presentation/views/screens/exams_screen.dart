import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:online_exam_app_elevate/Features/exams/exam_subject/presentation/viewmodel/exam_by_subject_viewmodel.dart';
import 'package:online_exam_app_elevate/Features/exams/exam_subject/presentation/viewmodel/states/exam_by_subject_states.dart';
import 'package:online_exam_app_elevate/core/di/di.dart';
import 'package:online_exam_app_elevate/core/extensions/extensions.dart';

import '../../../../../../core/routes/app_routes.dart';
import '../../../../../../core/theme/app_colors.dart';

class ExamsScreen extends StatelessWidget {
  final String subjectId;
  const ExamsScreen({super.key, required this.subjectId});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<ExamBySubjectViewmodel>()..getExams("670039c3728c92b7fdf43506"),
      child: Scaffold(
        body: SafeArea(
          child: BlocBuilder<ExamBySubjectViewmodel, ExamBySubjectStates>(
            builder: (context, state) {
              if (state is ExamsBySubjectLoadingState) {
                return const Center(child: CircularProgressIndicator());
              } else if (state is ExamsBySubjectSuccessState) {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        IconButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          icon: const Icon(Icons.arrow_back_ios),
                        ),
                        Text(
                          "Languages",
                          style: TextStyle(
                            color: AppColors.black,
                            fontWeight: FontWeight.w500,
                            fontSize: 24,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 20),
                    Expanded(
                      child: ListView.builder(
                        itemCount: state.exams.length,
                        itemBuilder: (context, index) {
                          final exam = state.exams[index];
                          return Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                exam.title,
                                style: TextStyle(
                                  color: AppColors.black,
                                  fontWeight: FontWeight.w500,
                                  fontSize: 20,
                                ),
                              ),
                              ListView.builder(
                                itemCount: state.exams.length,
                                shrinkWrap: true,
                                physics: const NeverScrollableScrollPhysics(),
                                itemBuilder: (context, index) {
                                  return GestureDetector(
                                    onTap: () {
                                      Navigator.pushNamed(
                                        context,
                                        AppRoutes.examsDetails,
                                        arguments: exam.Id,
                                      );
                                    },
                                    child: Container(
                                      height: 110,
                                      width: double.infinity,
                                      margin: const EdgeInsets.symmetric(
                                        vertical: 12,
                                      ),
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(10),
                                        boxShadow: [
                                          BoxShadow(
                                            color: Colors.black.withOpacity(0.05),
                                            blurRadius: 8,
                                            offset: const Offset(
                                              0,
                                              4,
                                            ), // horizontal, vertical
                                          ),
                                        ],
                                      ),
                                      child: Container(
                                        width: double.infinity,
                                        padding: const EdgeInsets.symmetric(
                                          vertical: 16,
                                          horizontal: 24,
                                        ),
                                        decoration: BoxDecoration(
                                          color: Colors.white,
                                          borderRadius: BorderRadius.circular(10),
                                        ),
                                        child: Row(
                                          children: [
                                            Image.asset(
                                              "assets/icons/Profit.png",
                                              height: 70,
                                            ),
                                            const SizedBox(width: 10),
                                            Expanded(
                                              child: Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceBetween,
                                                    children: [
                                                      Text(
                                                        "High level",
                                                        style: TextStyle(
                                                          color: AppColors.black,
                                                          fontWeight:
                                                              FontWeight.w500,
                                                          fontSize: 16,
                                                        ),
                                                      ),
                                                      Text(
                                                        "${exam.duration} Minutes",
                                                        style: TextStyle(
                                                          color: AppColors.blue,
                                                          fontWeight:
                                                              FontWeight.w400,
                                                          fontSize: 13,
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                  Text(
                                                    "${exam.numberOfQuestions} Question",
                                                    style: const TextStyle(
                                                      color: AppColors.grey,
                                                      fontWeight: FontWeight.w400,
                                                      fontSize: 13,
                                                    ),
                                                  ),
                                                  const SizedBox(height: 10),
                                                  Row(
                                                    children: [
                                                      Text(
                                                        "From: 1.00",
                                                        style: TextStyle(
                                                          color: AppColors.black,
                                                          fontWeight:
                                                              FontWeight.w400,
                                                          fontSize: 13,
                                                        ),
                                                      ),
                                                      const SizedBox(width: 10),
                                                      Text(
                                                        "From: 6.00",
                                                        style: TextStyle(
                                                          color: AppColors.black,
                                                          fontWeight:
                                                              FontWeight.w400,
                                                          fontSize: 13,
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  );
                                },
                              ),
                              const SizedBox(height: 20),
                            ],
                          );
                        },
                      ),
                    ),
                  ],
                ).setHorizontalAndVerticalPadding(context, 0.04, 0.012);
              } else if (state is ExamsBySubjectErrorState) {
                return Center(child: Text("Error: ${state.message}"));
              } else {
                return const SizedBox.shrink();
              }
            },
          ),
        ),
      ),
    );
  }
}
