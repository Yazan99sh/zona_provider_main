import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:zona_provider_main/injection.dart';
import 'package:zona_provider_main/presentation/auth/blocs/request_reset_password_bloc/request_reset_password_bloc.dart';
import 'package:zona_provider_main/presentation/core/blocs/core/base_state.dart';
import 'package:zona_provider_main/presentation/core/widgets/back_leading_icon.dart';
import 'package:zona_provider_main/presentation/core/widgets/custom_app_bar.dart';
import 'package:zona_provider_main/presentation/core/widgets/screen_loader.dart';
import 'package:zona_provider_main/presentation/core/widgets/screen_utils.dart';

class ForgetPasswordPage extends StatefulWidget {
  const ForgetPasswordPage({Key? key}) : super(key: key);

  @override
  State<ForgetPasswordPage> createState() => _ForgetPasswordPageState();
}

class _ForgetPasswordPageState extends State<ForgetPasswordPage>
    with ScreenLoader<ForgetPasswordPage>, ScreenUtils {
  final GlobalKey<FormFieldState> _emailFormFieldKey =
      GlobalKey<FormFieldState>();
  final TextEditingController _emailController = TextEditingController();
  final RequestResetPasswordBloc _requestResetPasswordBloc =
      getIt<RequestResetPasswordBloc>();

  @override
  Widget screen(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(leading: const BackLeadingIcon()),
      body: BlocListener<RequestResetPasswordBloc, BaseState>(
        bloc: _requestResetPasswordBloc,
        listener: (BuildContext context, state) {
          if (state.isInProgress) {
            startLoading();
          } else if (state.isFailure) {
            stopLoading();
            showError(failure: state.failure, isFloating: true);
          } else if (state.isSuccess) {
            stopLoading();
          }
        },
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const SizedBox(height: 37),
            Container(
              alignment: Alignment.centerLeft,
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Text(
                'forgot_your_password'.tr(),
                style: TextStyle(
                  color: Theme.of(context).textTheme.headline1!.color!,
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
              ),
            ),
            const SizedBox(height: 10),
            Container(
              alignment: Alignment.centerLeft,
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Text(
                'forget_password_explain'.tr(),
                style: const TextStyle(
                  fontWeight: FontWeight.normal,
                  fontSize: 16,
                ),
              ),
            ),
            const SizedBox(height: 51),
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
                    const SizedBox(height: 21),
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                          child: Text('reset_my_password'.tr()),
                          onPressed: () {
                            if (!_emailFormFieldKey.currentState!.validate()) {
                              return;
                            }
                            _requestResetPasswordBloc.add(
                                RequestResetPasswordRequested(
                                    email: _emailController.text.trim()));
                          }),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 21),
          ],
        ),
      ),
    );
  }
}
