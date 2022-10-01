import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:zona_provider_main/injection.dart';
import 'package:zona_provider_main/presentation/auth/blocs/check_reset_password_code_bloc/check_reset_password_code_bloc.dart';
import 'package:zona_provider_main/presentation/core/blocs/core/base_state.dart';
import 'package:zona_provider_main/presentation/core/routes/router.dart';
import 'package:zona_provider_main/presentation/core/utils/generated_assets/assets.gen.dart';
import 'package:zona_provider_main/presentation/core/widgets/back_leading_icon.dart';
import 'package:zona_provider_main/presentation/core/widgets/custom_app_bar.dart';
import 'package:zona_provider_main/presentation/core/widgets/screen_loader.dart';
import 'package:zona_provider_main/presentation/core/widgets/screen_utils.dart';

class CheckResetPasswordCodePage extends StatefulWidget {
  const CheckResetPasswordCodePage({Key? key}) : super(key: key);

  @override
  State<CheckResetPasswordCodePage> createState() =>
      _CheckResetPasswordCodePageState();
}

class _CheckResetPasswordCodePageState extends State<CheckResetPasswordCodePage>
    with ScreenLoader<CheckResetPasswordCodePage>, ScreenUtils {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final GlobalKey<FormFieldState> _codeResetFormFieldKey =
      GlobalKey<FormFieldState>();
  final TextEditingController _codeResetController = TextEditingController();

  final CheckResetPasswordCodeBloc _checkResetPasswordCodeBloc =
      getIt<CheckResetPasswordCodeBloc>();

  @override
  Widget screen(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        leading: const BackLeadingIcon(),
        title: const Text(
          'check_reset_password_code',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ).tr(),
        centerTitle: true,
      ),
      body: BlocListener<CheckResetPasswordCodeBloc, BaseState>(
        bloc: _checkResetPasswordCodeBloc,
        listener: (BuildContext context, state) {
          if (state.isInProgress) {
            startLoading();
          } else if (state.isFailure) {
            stopLoading();
            showError(failure: state.failure, isFloating: true);
          } else if (state.isSuccess) {
            AutoRouter.of(context).push(ResetPasswordPageRoute(
                resetPasswordCode: _codeResetController.text));
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
                TextFormField(
                  key: _codeResetFormFieldKey,
                  controller: _codeResetController,
                  decoration: InputDecoration(
                    hintText: 'code_reset'.tr(),
                    labelText: 'code_reset'.tr(),
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
                    _codeResetFormFieldKey.currentState!.validate();
                  },
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
            _checkResetPasswordCodeBloc.add(
              CheckResetPasswordCodeRequested(
                resetPasswordCode: _codeResetController.text,
              ),
            );
          },
          child: const Text('check').tr(),
        ),
      ),
    );
  }
}
