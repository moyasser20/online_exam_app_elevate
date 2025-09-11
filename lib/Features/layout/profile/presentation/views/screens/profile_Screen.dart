import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:online_exam_app_elevate/Features/layout/profile/domain/usecases/update_data_usecase.dart';
import 'package:online_exam_app_elevate/Features/layout/profile/presentation/viewmodel/edit_profile_states.dart';
import 'package:online_exam_app_elevate/Features/layout/profile/presentation/viewmodel/edit_profile_view_model.dart';
import 'package:online_exam_app_elevate/Features/layout/profile/presentation/viewmodel/profile_states.dart';
import 'package:online_exam_app_elevate/Features/layout/profile/presentation/viewmodel/profile_viewmodel.dart';
import 'package:flutter_svg/svg.dart';
import 'package:online_exam_app_elevate/core/extensions/extensions.dart';

import '../../../../../../core/Widgets/Custom_Elevated_Button.dart';
import '../../../../../../core/Widgets/custom_text_field.dart';
import '../../../../../../core/di/di.dart';
import '../../../../../../core/l10n/translation/app_localizations.dart';
import '../../../../../../core/routes/app_routes.dart';
import '../../../../../../core/theme/app_colors.dart';
import 'package:online_exam_app_elevate/core/storage/token_storage.dart';
import 'package:online_exam_app_elevate/core/storage/remember_me_storage.dart';


class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var local = AppLocalizations.of(context)!;
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text(
          local.profileTitle,
          style: const TextStyle(fontSize: 26, fontWeight: FontWeight.w600),
        ),
      ),
      body: BlocBuilder<ProfileViewModel, ProfileStates>(
        builder: (context, state) {
          if (state is ProfileLoadingState) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is ProfileSuccessState) {
            final user = state.user;

            return BlocProvider(
              create: (_) {
                final cubit = EditProfileViewModel(
                  getIt<EditProfileDataUseCase>(),
                );
                cubit.setInitialData(user);
                return cubit;
              },
              child: BlocConsumer<EditProfileViewModel, EditProfileStates>(
                builder: (context, state) {
                  final editCubitController = context.read<EditProfileViewModel>();

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
                            label: local.usernameLabel,
                            controller: editCubitController.usernameController,
                          ).setHorizontalAndVerticalPadding(context, 0.05, 0.04),
                          Row(
                            children: [
                              const SizedBox(width: 16),
                              Expanded(
                                child: CustomTextFormField(
                                  label: local.firstNameLabel,
                                  controller: editCubitController.firstnameController,
                                ),
                              ),
                              const SizedBox(width: 16),
                              Expanded(
                                child: CustomTextFormField(
                                  label: local.lastNameLabel,
                                  controller: editCubitController.lastnameController,
                                ),
                              ),
                              const SizedBox(width: 16),
                            ],
                          ).setHorizontalAndVerticalPadding(context, 0.005, 0.0050),
                          const SizedBox(height: 13),
                          CustomTextFormField(
                            label: local.emailLabel,
                            controller: editCubitController.emailController,
                          ).setHorizontalAndVerticalPadding(context, 0.05, 0.003),
                          const SizedBox(height: 13),
                          CustomTextFormField(
                            label: local.password,
                            readonly: true,
                            initialText: "******",
                            suffixText: local.passwordChangeText,
                            onPressed: () {
                              Navigator.of(context).pushNamed(AppRoutes.changePassword);
                            },
                          ).setHorizontalAndVerticalPadding(context, 0.05, 0.001),
                          const SizedBox(height: 13),
                          CustomTextFormField(
                            label: local.phoneNumberLabel,
                            controller: editCubitController.phoneController,
                          ).setHorizontalAndVerticalPadding(context, 0.05, 0.003),
                          const SizedBox(height: 50),
                          CustomElevatedButton(
                            text: local.updateButton,
                            isLoading: state is EditProfileLoadingState,
                            onPressed: () {
                              editCubitController.submitProfileUpdate();
                            },
                          )
                        ],
                      ),
                    ),
                  );
                },
                listener: (context, state) {
                  if (state is EditProfileSuccessState) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text(local.profileUpdatedSuccessMsg)),
                    );
                  } else if (state is EditProfileErrorState) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text('${local.errorText}: ${state.message}')),
                    );
                  }
                },
              ),
            );
          } else if (state is ProfileErrorState) {
            return Center(child: Text("${local.errorText}: ${state.message}"));
          } else {
            return Center(child: Text(local.noProfileData));
          }
        },
      ),
    );
  }
}
