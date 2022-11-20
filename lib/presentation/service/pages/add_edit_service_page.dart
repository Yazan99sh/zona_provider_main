import 'dart:io';

import 'package:auto_route/auto_route.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:zona_provider_main/domain/service/entities/category.dart';
import 'package:zona_provider_main/domain/service/entities/provider.dart';
import 'package:zona_provider_main/domain/service/entities/service.dart';
import 'package:zona_provider_main/injection.dart';
import 'package:zona_provider_main/presentation/core/blocs/core/base_state.dart';
import 'package:zona_provider_main/presentation/core/widgets/back_leading_icon.dart';
import 'package:zona_provider_main/presentation/core/widgets/category_control.dart';
import 'package:zona_provider_main/presentation/core/widgets/custom_app_bar.dart';
import 'package:zona_provider_main/presentation/core/widgets/provider_control.dart';
import 'package:zona_provider_main/presentation/core/widgets/screen_loader.dart';
import 'package:zona_provider_main/presentation/core/widgets/screen_utils.dart';
import 'package:zona_provider_main/presentation/service/blocs/add_service_bloc/add_service_bloc.dart';
import 'package:zona_provider_main/presentation/service/blocs/update_service_bloc/update_service_bloc.dart';

class AddEditServicePage extends StatefulWidget {
  final Service? service;

  const AddEditServicePage({
    Key? key,
    this.service,
  }) : super(key: key);

  @override
  State<AddEditServicePage> createState() => _AddEditServicePageState();
}

class _AddEditServicePageState extends State<AddEditServicePage>
    with ScreenUtils<AddEditServicePage>, ScreenLoader {
  final AddServiceBloc _addServiceBloc = getIt<AddServiceBloc>();
  final UpdateServiceBloc _updateServiceBloc = getIt<UpdateServiceBloc>();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();
  final TextEditingController _addressController = TextEditingController();
  final TextEditingController _priceController = TextEditingController();
  final TextEditingController _categoryController = TextEditingController();
  final TextEditingController _providerController = TextEditingController();

  final GlobalKey<FormFieldState> _nameFieldKey = GlobalKey<FormFieldState>();
  final GlobalKey<FormFieldState> _descriptionFieldKey =
      GlobalKey<FormFieldState>();
  final GlobalKey<FormFieldState> _addressFieldKey =
      GlobalKey<FormFieldState>();
  final GlobalKey<FormFieldState> _priceFieldKey = GlobalKey<FormFieldState>();
  final ImagePicker _picker = ImagePicker();
  File? _updatedImage;
  Category? _category;
  Provider? _provider;

  @override
  void initState() {
    if (widget.service != null) {
      _nameController.text = widget.service?.name ?? '';
      _descriptionController.text = widget.service?.description ?? '';
      _addressController.text = widget.service?.address ?? '';
      _priceController.text = widget.service?.price?.toString() ?? '';
      if (widget.service!.idCategory != null) {
        _category = Category(id: int.parse(widget.service!.idCategory!));
      }
      if (widget.service!.idProvider != null) {
        _provider = Provider(id: int.parse(widget.service!.idProvider!));
      }
    }
    super.initState();
  }

  @override
  Widget screen(BuildContext context) {
    return Scaffold(
        appBar: CustomAppBar(
          leading: const BackLeadingIcon(),
          title: Text(widget.service == null ? 'add'.tr() : 'edit'.tr()),
        ),
        body: MultiBlocListener(
            listeners: [
              BlocListener<AddServiceBloc, BaseState<String>>(
                bloc: _addServiceBloc,
                listener: (context, state) {
                  if (state.isInProgress) {
                    startLoading();
                  } else if (state.isFailure) {
                    showError(failure: state.failure);
                    stopLoading();
                  } else if (state.isSuccess) {
                    stopLoading();

                    showSuccess();
                    AutoRouter.of(context).pop(true);
                  }
                },
              ),
              BlocListener<UpdateServiceBloc, BaseState<String>>(
                bloc: _updateServiceBloc,
                listener: (context, state) {
                  if (state.isInProgress) {
                    startLoading();
                  } else if (state.isFailure) {
                    showError(failure: state.failure);
                    stopLoading();
                  } else if (state.isSuccess) {
                    stopLoading();
                    showSuccess();
                    AutoRouter.of(context).pop(true);
                  }
                },
              )
            ],
            child: SingleChildScrollView(
              padding: const EdgeInsets.only(left: 17, right: 17, top: 25),
              child: Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      FormField<bool>(validator: (val) {
                        if (widget.service?.image == null) {
                          if (_updatedImage == null) {
                            return 'field_required_message'.tr();
                          }
                        }
                        return null;
                      }, builder: (fieldState) {
                        return Column(
                          children: [
                            GestureDetector(
                              onTap: () async {
                                final image = await _picker.pickImage(
                                    source: ImageSource.gallery);

                                setState(() {
                                  _updatedImage =
                                      image == null ? null : File(image.path);
                                });
                              },
                              child: Container(
                                width: 75,
                                height: 75,
                                margin: const EdgeInsets.only(
                                  bottom: 20,
                                ),
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    color: Theme.of(context).cardColor),
                                child: Builder(
                                  builder: (context) {
                                    if (_updatedImage != null) {
                                      return ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          child: Image.file(
                                            _updatedImage!,
                                            fit: BoxFit.cover,
                                          ));
                                    } else {
                                      if (widget.service?.image != null) {
                                        return ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          child: CachedNetworkImage(
                                            imageUrl:
                                                widget.service?.image ?? '',
                                            fit: BoxFit.cover,
                                          ),
                                        );
                                      } else {
                                        return const Icon(
                                            Icons.add_a_photo_outlined);
                                      }
                                    }
                                  },
                                ),
                              ),
                            ),
                            if (fieldState.hasError)
                              Text(
                                'field_required_message'.tr(),
                                style: TextStyle(
                                  color: Theme.of(context).errorColor,
                                  fontSize: 12,
                                ),
                              ),
                          ],
                        );
                      }),
                      TextFormField(
                        controller: _nameController,
                        key: _nameFieldKey,
                        decoration: InputDecoration(
                          labelText: 'name'.tr(),
                          hintText: 'name'.tr(),
                        ),
                        validator: (text) {
                          if (text == null || text.isEmpty) {
                            return 'field_required_message'.tr();
                          }

                          return null;
                        },
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                          top: 20,
                          bottom: 20,
                        ),
                        child: TextFormField(
                          controller: _descriptionController,
                          key: _descriptionFieldKey,
                          decoration: InputDecoration(
                            labelText: 'description'.tr(),
                            hintText: 'description'.tr(),
                          ),
                          validator: (text) {
                            if (text == null || text.isEmpty) {
                              return 'field_required_message'.tr();
                            }

                            return null;
                          },
                        ),
                      ),
                      TextFormField(
                        controller: _addressController,
                        key: _addressFieldKey,
                        decoration: InputDecoration(
                          labelText: 'address'.tr(),
                          hintText: 'address'.tr(),
                        ),
                        validator: (text) {
                          if (text == null || text.isEmpty) {
                            return 'field_required_message'.tr();
                          }

                          return null;
                        },
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                          top: 20,
                          bottom: 20,
                        ),
                        child: TextFormField(
                          controller: _priceController,
                          key: _priceFieldKey,
                          keyboardType: TextInputType.number,
                          decoration: InputDecoration(
                            labelText: 'price'.tr(),
                            hintText: 'price'.tr(),
                          ),
                          validator: (text) {
                            if (text == null || text.isEmpty) {
                              return 'field_required_message'.tr();
                            }

                            return null;
                          },
                        ),
                      ),
                      CategoryControl(
                          initialValue: _category,
                          categoryController: _categoryController,
                          onChanged: (category) {
                            setState(() {
                              _category = category;
                            });
                          }),
                      Padding(
                        padding: const EdgeInsets.only(
                          top: 20,
                          bottom: 20,
                        ),
                        child: ProviderControl(
                            initialValue: _provider,
                            providerController: _providerController,
                            onChanged: (provider) {
                              setState(() {
                                _provider = provider;
                              });
                            }),
                      )
                    ],
                  )),
            )),
        bottomNavigationBar: Container(
          padding: const EdgeInsets.only(
            left: 17,
            right: 17,
            bottom: 30,
          ),
          width: double.infinity,
          child: ElevatedButton(
            onPressed: () {
              FocusManager.instance.primaryFocus?.unfocus();
              if (!_formKey.currentState!.validate()) return;
              if (widget.service == null) {
                _addServiceBloc.add(AddServiceRequested(
                    name: _nameController.text,
                    description: _descriptionController.text,
                    address: _addressController.text,
                    price: double.tryParse(_priceController.text),
                    idCategory: _category!.id,
                    idProvider: _provider!.id,
                    image: _updatedImage,
                    status: 1));
              } else {
                _updateServiceBloc.add(
                  UpdateServiceRequested(
                      id: widget.service!.id,
                      name: _nameController.text,
                      description: _descriptionController.text,
                      address: _addressController.text,
                      price: double.tryParse(_priceController.text),
                      idCategory: _category!.id,
                      idProvider: _provider!.id,
                      image: _updatedImage,
                      status: 1),
                );
              }
            },
            child: Text(widget.service == null ? 'add'.tr() : 'edit'.tr()),
          ),
        ));
  }
}
