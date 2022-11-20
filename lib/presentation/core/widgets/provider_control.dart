import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:zona_provider_main/domain/service/entities/provider.dart';
import 'package:zona_provider_main/presentation/core/blocs/core/base_state.dart';
import 'package:zona_provider_main/presentation/core/widgets/custom_bottom_sheet.dart';
import 'package:zona_provider_main/presentation/core/widgets/ios_arrow_down_icon.dart';
import 'package:zona_provider_main/presentation/service/blocs/category_list_bloc/category_list_bloc.dart';
import 'package:zona_provider_main/presentation/service/blocs/provider_list_bloc/provider_list_bloc.dart';

class ProviderControl extends StatefulWidget {
  const ProviderControl({
    Key? key,
    required TextEditingController providerController,
    required this.onChanged,
    this.initialValue,
  })  : _providerController = providerController,
        super(key: key);

  final TextEditingController _providerController;
  final void Function(Provider) onChanged;
  final Provider? initialValue;

  @override
  State<ProviderControl> createState() => _ProviderControlState();
}

class _ProviderControlState extends State<ProviderControl> {
  Provider? selectedProvider;
  final TextEditingController _search = TextEditingController();
  List<Provider> providerNames = [];

  @override
  void initState() {
    if (BlocProvider.of<ProviderListBloc>(context).state.status !=
        BaseStatus.success) {
      BlocProvider.of<ProviderListBloc>(context).add(ProviderListRequested());
    }

    if (widget.initialValue != null) {
      selectedProvider=  BlocProvider.of<ProviderListBloc>(context).state.item?.firstWhere((element) => element.id==widget.initialValue!.id);
      widget._providerController.text = selectedProvider?.firstName ?? '';
    }

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProviderListBloc, BaseState<List<Provider>>>(
      builder: (context, state) {
        return TextFormField(
          controller: widget._providerController,
          decoration: InputDecoration(
            // enabledBorder: OutlineInputBorder(
            //   borderRadius: BorderRadius.circular(8),
            // ),
            filled: true,
            label: Text('provider'.tr()),
            suffixIcon: Builder(builder: (context) {
              if (state.status == BaseStatus.success) {
                return const IOSArrowDownIcon();
              } else if (state.status == BaseStatus.inProgress) {
                return Transform.scale(
                  scale: 0.5,
                  child: const CircularProgressIndicator(),
                );
              } else {
                return Icon(
                  Icons.replay_outlined,
                  color: Theme.of(context)
                      .inputDecorationTheme
                      .enabledBorder!
                      .borderSide
                      .color,
                );
              }
            }),
          ),
          validator: (text) {
            if (text == null || text.isEmpty) {
              return 'field_required_message'.tr();
            }

            return null;
          },
          readOnly: true,
          onTap: () async {
            if (state.status == BaseStatus.success) {
              if (providerNames.isEmpty) {
                providerNames = state.item!;
              }
              await showModalBottomSheet<String>(
                context: context,
                builder: (context) {
                  return CustomBottomSheet(
                    bottomSheetHeight: 750,
                    message: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: const Text(
                        'choose_provider',
                        style: TextStyle(fontSize: 20.0),
                      ).tr(),
                    ),
                    options: [
                      Padding(
                        padding: const EdgeInsets.all(8),
                        child: TextFormField(
                          controller: _search,
                          decoration: InputDecoration(
                            labelText: 'search'.tr(),
                            filled: true,
                          ),
                          onChanged: (search) =>
                              _searchChanged(search, state.item!),
                          keyboardType: TextInputType.text,
                          textInputAction: TextInputAction.next,
                        ),
                      ),
                      ListView.builder(
                        physics: const ScrollPhysics(),
                        shrinkWrap: true,
                        itemCount: providerNames.length,
                        itemBuilder: (context, index) {
                          return ListTile(
                            trailing: Icon(
                              selectedProvider?.firstName == providerNames[index].firstName
                                  ? Icons.check_circle
                                  : Icons.circle_outlined,
                              color: Theme.of(context).primaryColor,
                            ),
                            title: Text(providerNames[index].firstName ?? ''),
                            onTap: () {
                              if (selectedProvider?.firstName !=
                                  providerNames[index].firstName) {
                                widget._providerController.text =
                                    providerNames[index].firstName ?? '';
                                widget.onChanged(
                                    providerNames[index]);
                                selectedProvider = providerNames[index];
                                Navigator.pop(context);
                              }
                            },
                          );
                        },
                      )
                    ],
                  );
                },
              );
            } else if (state.status == BaseStatus.failure) {
              BlocProvider.of<CategoryListBloc>(context).add(CategoryListRequested());
            }
          },
        );
      },
    );
  }

  void _searchChanged(String searchText, List<Provider> providers) {
    if (searchText.isNotEmpty) {
      setState(() {
        providerNames = List.from(providers.where((name) =>
            name.firstName!.toLowerCase().contains(searchText.toLowerCase())));
      });
    } else {
      setState(() {
        providerNames = List.from(providers);
      });
    }
  }
}
