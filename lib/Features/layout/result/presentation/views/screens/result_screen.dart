import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:online_exam_app_elevate/core/extensions/extensions.dart';
import '../../../../../../core/routes/app_routes.dart';
import '../../../../../../core/routes/routes.dart';
import '../../../../../../core/theme/app_colors.dart';
import '../../../presentation/viewmodel/result_viewmodel.dart';
import '../../../presentation/viewmodel/result_states.dart';
import '../../../../../../core/di/di.dart';

class ResultScreen extends StatelessWidget {
  const ResultScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<ResultViewModel>(
      create: (_) => getIt<ResultViewModel>()..loadHistory(),
      child: Builder(
        builder:
            (context) => Scaffold(
              body: SafeArea(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Results",
                          style: TextStyle(
                            color: AppColors.black,
                            fontWeight: FontWeight.w500,
                            fontSize: 24,
                          ),
                        ),
                        TextButton(
                          onPressed:
                              () => context.read<ResultViewModel>().clearAll(),
                          child: const Text('Clear'),
                        ),
                      ],
                    ),
                    const SizedBox(height: 16),
                    Expanded(
                      child: BlocBuilder<ResultViewModel, ResultState>(
                        builder: (context, state) {
                          if (state is ResultLoading) {
                            return const Center(
                              child: CircularProgressIndicator(),
                            );
                          }
                          if (state is ResultError) {
                            return Center(child: Text(state.message));
                          }
                          final items =
                              state is ResultLoaded ? state.history : [];
                          if (items.isEmpty) {
                            return const Center(child: Text('No history yet'));
                          }
                          return ListView.builder(
                            itemCount: items.length,
                            itemBuilder: (context, index) {
                              final h = items[index];
                              return GestureDetector(
                                onTap: () {
                                  Navigator.pushNamed(
                                    context,
                                    AppRoutes.answersScreen,
                                    arguments: AnswersHistoryArgs(
                                      examId: h.examId,
                                      selectedAnswers: h.selectedAnswers,
                                    ),
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
                                        offset: const Offset(0, 4),
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
                                                    h.examTitle,
                                                    style: TextStyle(
                                                      color: AppColors.black,
                                                      fontWeight:
                                                          FontWeight.w500,
                                                      fontSize: 16,
                                                    ),
                                                  ),
                                                  Text(
                                                    "${h.examDurationMinutes} Minutes",
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
                                                "${h.examTotalQuestions} Question",
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
                                                    "${h.correctAnswersCount} corrected answers in ${h.timeTakenMinutes} min",
                                                    style: TextStyle(
                                                      color: AppColors.blue[60],
                                                      fontWeight:
                                                          FontWeight.w700,
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
                          );
                        },
                      ),
                    ),
                  ],
                ).setHorizontalAndVerticalPadding(context, 0.04, 0.012),
              ),
            ),
      ),
    );
  }
}
