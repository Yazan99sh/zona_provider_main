import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:zona_provider_main/presentation/core/widget/back_leading_icon.dart';
import 'package:zona_provider_main/presentation/core/widget/custom_app_bar.dart';
import 'package:zona_provider_main/presentation/core/widget/password_control.dart';
import 'package:zona_provider_main/presentation/core/widget/phone_number_control.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({Key? key}) : super(key: key);

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage>
     {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final GlobalKey<FormFieldState> _firstNameFormFieldKey =
      GlobalKey<FormFieldState>();
  final GlobalKey<FormFieldState> _lastNameFormFieldKey =
      GlobalKey<FormFieldState>();
  final GlobalKey<FormFieldState> _emailFormFieldKey =
      GlobalKey<FormFieldState>();
  final GlobalKey<FormFieldState> _companyFormFieldKey =
      GlobalKey<FormFieldState>();

  late MultiValidator _passwordValidator;

  final TextEditingController _firstNameController = TextEditingController();
  final TextEditingController _lastNameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _companyController = TextEditingController();
  final TextEditingController countryController = TextEditingController();
  final TextEditingController cityController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();





  @override
  void initState() {
    _passwordValidator = MultiValidator([
      RequiredValidator(errorText: 'field_required_message'.tr()),
      MinLengthValidator(8, errorText: 'password_length_error_message'.tr()),
    ]);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).cardColor,
      appBar: CustomAppBar(
        leading: const BackLeadingIcon(),
        title: Text(
          'sign_up'.tr(),
          style: const TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w700,
          ),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 24.h,
                    ),
                    TextFormField(
                      key: _companyFormFieldKey,
                      controller: _companyController,
                      decoration: InputDecoration(
                        hintText: 'company_name'.tr(),
                        labelText: 'company_name'.tr(),
                      ),
                      textInputAction: TextInputAction.next,
                      keyboardType: TextInputType.text,
                      validator: (text) {
                        if (text == null || text.isEmpty) {
                          return 'field_required_message'.tr();
                        }

                        return null;
                      },
                      onChanged: (text) {
                        _firstNameFormFieldKey.currentState!.validate();
                      },
                    ),
                    SizedBox(
                      height: 24.h,
                    ),
                    TextFormField(
                      key: _firstNameFormFieldKey,
                      controller: _firstNameController,
                      decoration: InputDecoration(
                        hintText: 'first_name'.tr(),
                        labelText: 'first_name'.tr(),
                      ),
                      textInputAction: TextInputAction.next,
                      keyboardType: TextInputType.text,
                      validator: (text) {
                        if (text == null || text.isEmpty) {
                          return 'field_required_message'.tr();
                        }

                        return null;
                      },
                      onChanged: (text) {
                        _firstNameFormFieldKey.currentState!.validate();
                      },
                    ),
                    SizedBox(height: 24.h),
                    TextFormField(
                      key: _lastNameFormFieldKey,
                      controller: _lastNameController,
                      decoration: InputDecoration(
                        hintText: 'last_name'.tr(),
                        labelText: 'last_name'.tr(),
                      ),
                      keyboardType: TextInputType.text,
                      textInputAction: TextInputAction.next,
                      validator: (text) {
                        if (text == null || text.isEmpty) {
                          return 'field_required_message'.tr();
                        }

                        return null;
                      },
                      onChanged: (text) {
                        _lastNameFormFieldKey.currentState!.validate();
                      },
                    ),
                    SizedBox(
                      height: 24.h,
                    ),
                    TextFormField(
                      key: _emailFormFieldKey,
                      controller: _emailController,
                      decoration: const InputDecoration(
                        hintText: 'example@email.com',
                        labelText: 'email',
                      ),
                      keyboardType: TextInputType.emailAddress,
                      textInputAction: TextInputAction.next,
                      onChanged: (text) {
                        _emailFormFieldKey.currentState!.validate();
                      },
                      validator: (text) {
                        if (text == null || text.isEmpty) {
                          return 'field_required_message'.tr();
                        }
                        if (!EmailValidator(
                                errorText:
                                    'invalid_email_error_message'.tr())
                            .isValid(text.toLowerCase().trim())) {
                          return 'invalid_email_error_message'.tr();
                        }

                        return null;
                      },
                    ),
                    SizedBox(
                      height: 24.h,
                    ),
                    PasswordControl(
                      labelText: 'password'.tr(),
                      controller: _passwordController,
                      validator: _passwordValidator,
                    ),
                    SizedBox(
                      height: 24.h,
                    ),
                    PasswordControl(
                      labelText: 'confirm_password'.tr(),
                      controller: _confirmPasswordController,
                      validator: (text) {
                        if (text == null || text.isEmpty) {
                          return 'field_required_message'.tr();
                        }
                        if (!MinLengthValidator(8,
                                errorText:
                                    'password_length_error_message'
                                        .tr())
                            .isValid(text.toLowerCase())) {
                          return 'password_length_error_message'.tr();
                        }

                        if (!RequiredValidator(
                                errorText:
                                    'field_required_message'.tr())
                            .isValid(text.toLowerCase())) {
                          return 'field_required_message'.tr();
                        }
                        if (_passwordController.text !=
                            _confirmPasswordController.text) {
                          return 'passwords_did_not_match'.tr();
                        }
                        return null;
                      },
                    ),
                    SizedBox(
                      height: 24.h,
                    ),
                    Text(
                      'phone_number'.tr(),
                      style: const TextStyle(fontSize: 15.0),
                    ),
                    SizedBox(
                      height: 12.h,
                    ),
                    PhoneNumberControl(
                      phoneController: _phoneController,
                    ),
                  ],
                ),
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


          },
          child: const Text('sign_up').tr(),
        ),
      ),
    );
  }
}
