import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:online_exam_app_elevate/Features/layout/profile/presentation/viewmodel/profile_states.dart';
import 'package:online_exam_app_elevate/Features/layout/profile/presentation/viewmodel/profile_viewmodel.dart';
import 'package:online_exam_app_elevate/core/constants/app_Strings.dart';
import 'package:online_exam_app_elevate/core/extensions/extensions.dart';

import '../../../../../../core/Widgets/Custom_Elevated_Button.dart';
import '../../../../../../core/Widgets/custom_text_field.dart';
import '../../../../../../core/routes/app_routes.dart';
import '../../../../../../core/theme/app_colors.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Text(
          AppStrings.profileTitle,
          style: TextStyle(fontSize: 26, fontWeight: FontWeight.w600),
        ),
      ),
      body: BlocBuilder<ProfileViewModel, ProfileStates>(
        builder: (context, state) {
          if (state is ProfileLoadingState) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is ProfileSuccessState) {
            final user = state.user;

            return Center(
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Stack(
                      children: [
                        const CircleAvatar(
                          radius: 50,
                          backgroundImage: AssetImage("assets/images/me.png"),
                        ),
                        Positioned(
                          bottom: 0,
                          right: 4,
                          child: Container(
                            width: 30,
                            height: 30,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(7),
                              color: AppColors.blue[50],
                            ),
                            padding: const EdgeInsets.all(4),
                            child: const Icon(
                              Icons.camera_alt_outlined,
                              color: Colors.white,
                              size: 20,
                            ),
                          ),
                        ),
                      ],
                    ),
                    CustomTextFormField(
                      label: AppStrings.usernameLabel,
                      enabled: false,
                      initialText: user.username ?? "",
                    ).setHorizontalAndVerticalPadding(context, 0.05, 0.04),
                    Row(
                      children: [
                        const SizedBox(width: 16),
                        Expanded(
                          child: CustomTextFormField(
                            label: AppStrings.firstNameLabel,
                            enabled: false,
                            initialText: user.firstName ?? "",
                          ),
                        ),
                        const SizedBox(width: 16),
                        Expanded(
                          child: CustomTextFormField(
                            label: AppStrings.lastNameLabel,
                            enabled: false,
                            initialText: user.lastName ?? "",
                          ),
                        ),
                        const SizedBox(width: 16),
                      ],
                    ).setHorizontalAndVerticalPadding(context, 0.005, 0.0050),
                    const SizedBox(height: 13),
                    CustomTextFormField(
                      label: AppStrings.emailLabel,
                      enabled: false,
                      initialText: user.email ?? "",
                    ).setHorizontalAndVerticalPadding(context, 0.05, 0.003),
                    const SizedBox(height: 13),
                    CustomTextFormField(
                      label: AppStrings.password,
                      readonly: true,
                      initialText: "******",
                      suffixText: AppStrings.passwordChangeText,
                      onPressed: () {
                        Navigator.of(context).pushNamed(AppRoutes.changePassword);
                      },
                    ).setHorizontalAndVerticalPadding(context, 0.05, 0.001),
                    const SizedBox(height: 13),
                    CustomTextFormField(
                      label: AppStrings.phoneNumberLabel,
                      enabled: false,
                      initialText: user.phone ?? "",
                    ).setHorizontalAndVerticalPadding(context, 0.05, 0.003),
                    const SizedBox(height: 50),
                    CustomElevatedButton(
                      text: AppStrings.updateButton,
                      onPressed: () {
                        Navigator.of(context).pushNamed(AppRoutes.questionsScreen);
                      },
                    )
                  ],
                ),
              ),
            );
          } else if (state is ProfileErrorState) {
            return Center(child: Text("${AppStrings.errorText}: ${state.message}"));
          } else {
            return const Center(child: Text(AppStrings.noProfileData));
          }
        },
      ),
    );
  }
}
