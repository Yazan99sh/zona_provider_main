import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:image_picker/image_picker.dart';
import 'package:zona_provider_main/domain/user/entities/enums/gender.dart';
import 'package:zona_provider_main/domain/user/entities/my_Profile.dart';
import 'package:zona_provider_main/domain/user/entities/user_info.dart';
import 'package:zona_provider_main/injection.dart';
import 'package:zona_provider_main/presentation/auth/blocs/update_profile_up_bloc/update_profile_bloc.dart';
import 'package:zona_provider_main/presentation/core/auth/auth_bloc.dart';
import 'package:zona_provider_main/presentation/core/blocs/core/base_state.dart';
import 'package:zona_provider_main/presentation/core/widgets/back_leading_icon.dart';
import 'package:zona_provider_main/presentation/core/widgets/custom_app_bar.dart';
import 'package:zona_provider_main/presentation/core/widgets/custom_drop_down_widget.dart';
import 'package:zona_provider_main/presentation/core/widgets/phone_number_control.dart';
import 'package:zona_provider_main/presentation/core/widgets/present_date_picker.dart';
import 'package:zona_provider_main/presentation/core/widgets/screen_loader.dart';
import 'package:zona_provider_main/presentation/core/widgets/screen_utils.dart';

class EditMuProfilePage extends StatefulWidget {
  const EditMuProfilePage({Key? key}) : super(key: key);

  @override
  State<EditMuProfilePage> createState() => _EditMuProfilePageState();
}

class _EditMuProfilePageState extends State<EditMuProfilePage>
    with ScreenLoader<EditMuProfilePage>, ScreenUtils {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final GlobalKey<FormFieldState> _firstNameFormFieldKey =
      GlobalKey<FormFieldState>();
  final GlobalKey<FormFieldState> _lastNameFormFieldKey =
      GlobalKey<FormFieldState>();
  final GlobalKey<FormFieldState> _emailFormFieldKey =
      GlobalKey<FormFieldState>();

  final TextEditingController _firstNameController = TextEditingController();
  final TextEditingController _lastNameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _dateOfBirthController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  DateTime? dateOfBirth;
  Gender _gender = Gender.male;
  String? _genderTypeAsString;
  File? _updatedImage;
  final ImagePicker _picker = ImagePicker();

  UserInfo? userInfo;
  final UpdateProfileBloc _updateProfileBloc = getIt<UpdateProfileBloc>();
  @override
  void initState() {
    if (BlocProvider.of<AuthBloc>(context).state is Authenticated) {
      userInfo =
          (BlocProvider.of<AuthBloc>(context).state as Authenticated).user;

      _firstNameController.text = userInfo?.firstName ?? '';
      _lastNameController.text = userInfo?.lastName ?? '';
      _emailController.text = userInfo?.email ?? '';
      _phoneController.text = userInfo?.phone ?? '';
      if (userInfo!.dateOfBirth != null) {
        _dateOfBirthController.text =
            DateFormat('yyyy-MM-dd').format(userInfo!.dateOfBirth!);
      }
      if (userInfo!.gender != null) {
        _gender = userInfo!.gender!;
        _genderTypeAsString = fromGenderTypeToString(userInfo!.gender!);
      }
    }
    super.initState();
  }

  @override
  Widget screen(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        leading: const BackLeadingIcon(),
        title: const Text(
          'edit',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ).tr(),
        centerTitle: true,
      ),
      body: BlocListener<UpdateProfileBloc, BaseState<MyProfile>>(
        bloc: _updateProfileBloc,
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
        child: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Center(
                        child: GestureDetector(
                          onTap: () async {
                            final image = await _picker.pickImage(
                                source: ImageSource.gallery);

                            setState(() {
                              _updatedImage =
                                  image == null ? null : File(image.path);
                            });
                          },
                          child: Container(
                            width: 70,
                            height: 70,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: Theme.of(context).cardColor),
                            child: Builder(
                              builder: (context) {
                                if (_updatedImage != null) {
                                  return ClipRRect(
                                      borderRadius: BorderRadius.circular(10),
                                      child: Image.file(
                                        _updatedImage!,
                                        fit: BoxFit.cover,
                                      ));
                                } else {
                                  if (userInfo?.profileImage != null) {
                                    return ClipRRect(
                                      borderRadius: BorderRadius.circular(10),
                                      child: CachedNetworkImage(
                                        imageUrl: '${userInfo!.profileImage}',
                                        fit: BoxFit.cover,
                                      ),
                                    );
                                  } else {
                                    return const Icon(Icons.camera);
                                  }
                                }
                              },
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 20,
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
                      Padding(
                        padding: const EdgeInsets.only(
                          bottom: 20,
                          top: 20,
                        ),
                        child: TextFormField(
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
                                  errorText: 'invalid_email_error_message'.tr())
                              .isValid(text.toLowerCase().trim())) {
                            return 'invalid_email_error_message'.tr();
                          }

                          return null;
                        },
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                          bottom: 20,
                          top: 20,
                        ),
                        child: CustomDropDownWidget<String>(
                          label: 'gender'.tr(),
                          onChange: (val) {
                            setState(() {
                              _genderTypeAsString = val;
                              _gender = _gender
                                  .fromStringToGenderType(_genderTypeAsString!);
                            });
                          },
                          onRetry: () {},
                          options: Gender.values
                              .map((e) => e.toShortString())
                              .toList(),
                          disabled: false,
                          selectedOption: _genderTypeAsString?.split('.').last,
                          hint: 'gender'.tr(),
                        ),
                      ),
                      TextFormField(
                        readOnly: true,
                        controller: _dateOfBirthController,
                        decoration: InputDecoration(
                          hintText: 'date_of_birth'.tr(),
                          suffixIcon: Icon(
                            Icons.calendar_month_rounded,
                            color: Theme.of(context).primaryColor,
                          ),
                        ),
                        onTap: () async {
                          DateTime? date =
                              await presentDatePicker(context, DateTime.now());
                          if (date != null) {
                            setState(() {
                              dateOfBirth = date;
                              _dateOfBirthController.text =
                                  DateFormat('yyyy-MM-dd').format(date);
                            });
                          }
                        },
                      ),const SizedBox(height: 20,),
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
      ),
      bottomNavigationBar: Container(
        padding: const EdgeInsets.all(16.0),
        width: double.infinity,
        child: ElevatedButton(
          onPressed: () {
            if (!_formKey.currentState!.validate()) return;

            _updateProfileBloc.add(UpdateProfileRequested(
              email: _emailController.text,
              firstName: _firstNameController.text,
              lastName: _lastNameController.text,
              phone: _phoneController.text,
              gender: _gender,
              dateOfBirth: dateOfBirth,
              profileImage: _updatedImage,
            ));
          },
          child: const Text('edit').tr(),
        ),
      ),
    );
  }
}
