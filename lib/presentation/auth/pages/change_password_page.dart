import 'package:zona_provider_main/presentation/core/widget/back_leading_icon.dart';
import 'package:zona_provider_main/presentation/core/widget/custom_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:zona_provider_main/presentation/core/widget/password_control.dart';

class ChangePasswordPage extends StatefulWidget {
  const ChangePasswordPage({
    Key? key,
  }) : super(key: key);

  @override
  State<ChangePasswordPage> createState() => _ChangePasswordPageState();
}

class _ChangePasswordPageState extends State<ChangePasswordPage> {


  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  final TextEditingController _oldPasswordController = TextEditingController();
  final TextEditingController _newPasswordController = TextEditingController();
  final TextEditingController _confirmNewPasswordController =
      TextEditingController();

  late MultiValidator _passwordValidator;

  @override
  void initState() {
    _passwordValidator = MultiValidator(
      [
        RequiredValidator(errorText: 'field_required_message'.tr()),
        MinLengthValidator(8, errorText: 'password_length_error_message'.tr()),
        PatternValidator(
          r'^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[@$!#%*?&])[A-Za-z\d@$!#%*?&]{8,}$',
          errorText: 'password_validate_message'.tr(),
        ),
      ],
    );

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        leading: const BackLeadingIcon(),
        title: const Text(
          'change_password',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ).tr(),
        centerTitle: true,
      ),
      body: Form(
        key: _formKey,
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              const SizedBox(height: 40),
              PasswordControl(
                controller: _oldPasswordController,
                labelText: 'old_password'.tr(),
                validator: (val) {
                  if (!RequiredValidator(
                    errorText: 'field_required_message',
                  ).isValid(val)) {
                    return RequiredValidator(
                      errorText: 'field_required_message'.tr(),
                    ).call(val);
                  }
                  return null;
                },
              ),
              const SizedBox(height: 8),
              GestureDetector(
                onTap: () {},
                child: Align(
                  alignment: AlignmentDirectional.centerEnd,
                  child: const Text(
                    'forgot_password',
                    style: TextStyle(fontSize: 14),
                  ).tr(),
                ),
              ),
              const SizedBox(height: 21),
              PasswordControl(
                controller: _newPasswordController,
                labelText: 'new_password'.tr(),
                validator: _passwordValidator,
              ),
              const SizedBox(height: 16),
              PasswordControl(
                controller: _confirmNewPasswordController,
                labelText: 'confirm_new_password'.tr(),
                validator: (val) => MatchValidator(
                  errorText: 'passwords_did_not_match'.tr(),
                ).validateMatch(val!, _newPasswordController.text),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Container(
        padding: const EdgeInsets.all(16.0),
        width: double.infinity,
        child: ElevatedButton(
          onPressed: () {
            if (!_formKey.currentState!.validate()) return;

            // _bloc.add(
            //   ChangePasswordRequested(
            //     oldPassword: _oldPasswordController.text,
            //     newPassword: _newPasswordController.text,
            //   ),
            // );
          },
          child: const Text('save').tr(),
        ),
      ),
    );
  }
}
