import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:online_exam_app_elevate/core/extensions/extensions.dart';

import '../../../../../../core/Widgets/Custom_Elevated_Button.dart';
import '../../../../../../core/Widgets/custom_text_field.dart';
import '../../../../../../core/routes/app_routes.dart';
import '../../../../../../core/theme/app_colors.dart';
import 'package:online_exam_app_elevate/core/storage/token_storage.dart';
import 'package:online_exam_app_elevate/core/storage/remember_me_storage.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Row(
          children: [
            Text(
              "Profile",
              style: TextStyle(fontSize: 26, fontWeight: FontWeight.w600),
            ),
            Spacer(),
            GestureDetector(
              child: SvgPicture.asset(
                "assets/icons/logout_icon.svg",
                width: 34,
                height: 34,
              ),
              onTap: () async {
                final tokenStorage = TokenStorage();
                final rememberMeStorage = RememberMeStorage();
                await tokenStorage.clearToken();
                await rememberMeStorage.saveRememberMe(false, '', '');
                Navigator.pushNamedAndRemoveUntil(context, AppRoutes.login, (route) => false);
              }
            ),
          ],
        ),
      ),

      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Stack(
              children: [
                CircleAvatar(
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
                    padding: EdgeInsets.all(4),
                    child: Icon(
                      Icons.camera_alt_outlined,
                      color: Colors.white,
                      size: 20,
                    ),
                  ),
                ),
              ],
            ),
            CustomTextFormField(
              label: "User name",
              hint: "Mohamed Yasser",
            ).setHorizontalAndVerticalPadding(context, 0.05, 0.04),
            Row(
              children: [
                SizedBox(width: 16),
                Expanded(
                  child: CustomTextFormField(
                    label: 'Fisrt name',
                    hint: "Mohamed",
                  ),
                ),
                SizedBox(width: 16),
                Expanded(
                  child: CustomTextFormField(
                    label: 'Last Name',
                    hint: "Yasser",
                  ),
                ),
                SizedBox(width: 16),
              ],
            ).setHorizontalAndVerticalPadding(context, 0.005, 0.0050),
            const SizedBox(height: 13),
            CustomTextFormField(
              label: "Email",
              hint: "moyasser20@gmail.com",
            ).setHorizontalAndVerticalPadding(context, 0.05, 0.003),
            const SizedBox(height: 13),
            CustomTextFormField(
              label: "Password",
              hint: "Mohamed Yasser",
              suffixText: "Change",
            ).setHorizontalAndVerticalPadding(context, 0.05, 0.001),
            const SizedBox(height: 13),
            CustomTextFormField(
              label: "Phone Number",
              hint: "13212312",
            ).setHorizontalAndVerticalPadding(context, 0.05, 0.003),
            const SizedBox(height: 50),
            CustomElevatedButton(
              text: "Update",
              onPressed: () {
                Navigator.of(context).pushNamed(AppRoutes.questionsScreen);
              },
            ),
          ],
        ),
      ),
    );
  }
}
