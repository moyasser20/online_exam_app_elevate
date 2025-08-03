import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:online_exam_app_elevate/Features/exams/exam_subject/presentation/viewmodel/states/exam_detail_states.dart';
import 'package:online_exam_app_elevate/core/Assets/app_assets.dart';
import 'package:online_exam_app_elevate/core/extensions/extensions.dart';
import '../../../../../../core/Widgets/Custom_Elevated_Button.dart';
import '../../../../../../core/di/di.dart';
import '../../../../../../core/l10n/translation/app_localizations.dart';
import '../../../../../../core/routes/app_routes.dart';
import '../../../../../../core/theme/app_colors.dart';
import '../../viewmodel/exam_detail_viewmodel.dart';



class ExamDetailsScreen extends StatelessWidget {
  final String examId;
  const ExamDetailsScreen({super.key, required this.examId});

  @override
  Widget build(BuildContext context) {
    var local = AppLocalizations.of(context)!;
    return BlocProvider(
      create: (context) => getIt<ExamDetailViewmodel>()..getExams(examId),
      child: Scaffold(
        body: SafeArea(
          child: BlocBuilder<ExamDetailViewmodel, ExamDetailStates>(
            builder: (context, state) {
              if (state is ExamsDetailLoadingState) {
                return const Center(child: CircularProgressIndicator());
              } else if (state is ExamsDetailSuccessState) {
                final exam = state.examDetail;
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    IconButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      icon: const Icon(Icons.arrow_back_ios),
                    ),
                    const SizedBox(height: 20),
                    Row(
                      children: [
                        Image.asset(AppAssets.examImage, height: 45),
                        const SizedBox(width: 10),
                        Text(
                          exam.title,
                          style: TextStyle(
                            color: AppColors.black,
                            fontWeight: FontWeight.w600,
                            fontSize: 24,
                          ),
                        ),
                        const Spacer(),
                        Text(
                          "${exam.duration} Minutes",
                          style: TextStyle(
                            color: AppColors.blue,
                            fontWeight: FontWeight.w400,
                            fontSize: 15,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 15),
                    Row(
                      children: [
                        Text(
                          local.examLevel,
                          style: TextStyle(
                            color: AppColors.black,
                            fontWeight: FontWeight.w500,
                            fontSize: 20,
                          ),
                        ),
                        const SizedBox(width: 10),
                        Container(width: 2, height: 23, color: AppColors.blue[30]),
                        const SizedBox(width: 10),
                         Text(
                          "${exam.numberOfQuestions} Question",
                          style: const TextStyle(
                            color: AppColors.grey,
                            fontWeight: FontWeight.w400,
                            fontSize: 18,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 45),
                    Text(
                      local.examInstructions,
                      style: TextStyle(
                        color: AppColors.black,
                        fontWeight: FontWeight.w500,
                        fontSize: 20,
                      ),
                    ),
                    const SizedBox(height: 15),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        for (var item in [
                          "Lorem ipsum dolor sit amet consectetur.",
                          "Second Instruction",
                          "Third Instruction",
                        ])
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text("•", style: TextStyle(fontSize: 18)),
                              const SizedBox(width: 6),
                              Expanded(
                                child: Text(
                                  item,
                                  style: const TextStyle(
                                    color: AppColors.grey,
                                    fontWeight: FontWeight.w500,
                                    fontSize: 16,
                                  ),
                                ),
                              ),
                            ],
                          ),
                      ],
                    ),
                    const SizedBox(height: 45),
                    CustomElevatedButton(text: local.startExamButton, onPressed: (){
                      Navigator.of(context).pushNamed(AppRoutes.questionsScreen);
                    }),
                  ],
                ).setHorizontalAndVerticalPadding(context, 0.04, 0.012);
              } else if (state is ExamsDetailErrorState) {
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
