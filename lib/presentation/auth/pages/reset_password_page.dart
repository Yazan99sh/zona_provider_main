import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:zona_provider_main/injection.dart';
import 'package:zona_provider_main/presentation/auth/blocs/reset_password_bloc/reset_password_bloc.dart';
import 'package:zona_provider_main/presentation/core/blocs/core/base_state.dart';
import 'package:zona_provider_main/presentation/core/utils/generated_assets/assets.gen.dart';
import 'package:zona_provider_main/presentation/core/widgets/back_leading_icon.dart';
import 'package:zona_provider_main/presentation/core/widgets/custom_app_bar.dart';
import 'package:zona_provider_main/presentation/core/widgets/password_control.dart';
import 'package:zona_provider_main/presentation/core/widgets/screen_loader.dart';
import 'package:zona_provider_main/presentation/core/widgets/screen_utils.dart';

class ResetPasswordPage extends StatefulWidget {
   final String resetPasswordCode;
  const ResetPasswordPage({
    Key? key,
     required this.resetPasswordCode,
  }) : super(key: key);

  @override
  State<ResetPasswordPage> createState() => _ResetPasswordPageState();
}

class _ResetPasswordPageState extends State<ResetPasswordPage>
    with ScreenLoader<ResetPasswordPage>, ScreenUtils {
  final ResetPasswordBloc _resetPasswordBloc = getIt<ResetPasswordBloc>();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

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
  Widget screen(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        leading: const BackLeadingIcon(),
        title: const Text(
          'reset_password',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ).tr(),
        centerTitle: true,
      ),
      body: BlocListener<ResetPasswordBloc, BaseState>(
        bloc: _resetPasswordBloc,
        listener: (BuildContext context, state) {
          if (state.isInProgress) {
            startLoading();
          } else if (state.isFailure) {
            stopLoading();
            showError(failure: state.failure, isFloating: true);
          } else if (state.isSuccess) {
            AutoRouter.of(context).popUntil((route) => route.isFirst);
            stopLoading();
          }
        },
        child: Form(
          key: _formKey,
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(16),
            child: Column(
              children: [
                const SizedBox(
                  height: 60,
                ),
                Assets.images.logo.image(
                  width: 224,
                  height: 100,
                ),
                const SizedBox(height: 40),
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
      ),
      bottomNavigationBar: Container(
        padding: const EdgeInsets.all(16.0),
        width: double.infinity,
        child: ElevatedButton(
          onPressed: () {
            if (!_formKey.currentState!.validate()) return;
            _resetPasswordBloc.add(
              ResetPasswordRequested(
                resetPasswordCode: widget.resetPasswordCode,
                password: _newPasswordController.text,
                passwordConfirmation: _confirmNewPasswordController.text,
              ),
            );
          },
          child: const Text('save').tr(),
        ),
      ),
    );
  }
}
