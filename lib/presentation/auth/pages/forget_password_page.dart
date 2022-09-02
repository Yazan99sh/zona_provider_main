import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:zona_provider_main/presentation/core/widget/back_leading_icon.dart';
import 'package:zona_provider_main/presentation/core/widget/custom_app_bar.dart';

class ForgetPasswordPage extends StatefulWidget {
  const ForgetPasswordPage({Key? key}) : super(key: key);

  @override
  State<ForgetPasswordPage> createState() => _ForgetPasswordPageState();
}

class _ForgetPasswordPageState extends State<ForgetPasswordPage>
     {
  final GlobalKey<FormFieldState> _emailFormFieldKey =
      GlobalKey<FormFieldState>();
  final TextEditingController _emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(leading: const BackLeadingIcon()),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          SizedBox(height: 37.h),
          Container(
            alignment: Alignment.centerLeft,
            padding: EdgeInsets.symmetric(horizontal: 16.w),
            child: Text(
              'forgot_your_password'.tr(),
              style: TextStyle(
                color: Theme.of(context).textTheme.headline1!.color!,
                fontWeight: FontWeight.bold,
                fontSize: 20.sp,
              ),
            ),
          ),
          SizedBox(height: 10.h),
          Container(
            alignment: Alignment.centerLeft,
            padding: EdgeInsets.symmetric(horizontal: 16.w),
            child: Text(
              'forget_password_explain'.tr(),
              style: TextStyle(
                fontWeight: FontWeight.normal,
                fontSize: 16.sp,
              ),
            ),
          ),
          SizedBox(height: 51.h),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 17),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  TextFormField(
                    key: _emailFormFieldKey,
                    decoration: InputDecoration(
                      hintText: 'email_address'.tr(),
                    ),
                    controller: _emailController,
                    keyboardType: TextInputType.emailAddress,
                    textInputAction: TextInputAction.done,
                    onChanged: (text) {
                      _emailFormFieldKey.currentState!.validate();
                    },
                    validator: (text) {
                      if (text == null || text.isEmpty) {
                        return 'field_required_message'.tr();
                      }

                      if (!EmailValidator(
                              errorText: 'invalid_email_error_message'.tr())
                          .isValid(text.toLowerCase().trim())) {
                        return 'invalid_email_error_message'.tr();
                      }

                      return null;
                    },
                  ),
                  SizedBox(height: 21.h),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                        child: Text('reset_my_password'.tr()),
                        onPressed: () {
                          if (!_emailFormFieldKey.currentState!.validate()) {
                            return;
                          }
                          // resetPasswordBloc.add(
                          //     ResetPasswordRequested(_emailController.text.trim()));
                        }),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(height: 21.h),
        ],
      ),
    );
  }
}
