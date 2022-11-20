import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:zona_provider_main/domain/service/entities/category.dart';
import 'package:zona_provider_main/presentation/core/blocs/core/base_state.dart';
import 'package:zona_provider_main/presentation/core/widgets/custom_bottom_sheet.dart';
import 'package:zona_provider_main/presentation/core/widgets/ios_arrow_down_icon.dart';
import 'package:zona_provider_main/presentation/service/blocs/category_list_bloc/category_list_bloc.dart';

class CategoryControl extends StatefulWidget {
  const CategoryControl({
    Key? key,
    required TextEditingController categoryController,
    required this.onChanged,
    this.initialValue,
  })  : _categoryController = categoryController,
        super(key: key);

  final TextEditingController _categoryController;
  final void Function(Category) onChanged;
  final Category? initialValue;

  @override
  State<CategoryControl> createState() => _CategoryControlState();
}

class _CategoryControlState extends State<CategoryControl> {
  Category? selectedCategory;
  final TextEditingController _search = TextEditingController();
  List<Category> categoryNames = [];

  @override
  void initState() {
    if (BlocProvider.of<CategoryListBloc>(context).state.status !=
        BaseStatus.success) {
      BlocProvider.of<CategoryListBloc>(context).add(CategoryListRequested());
    }
    if (widget.initialValue != null) {
      selectedCategory = BlocProvider.of<CategoryListBloc>(context)
          .state
          .item
          ?.firstWhere((element) => element.id == widget.initialValue!.id);
      widget._categoryController.text = selectedCategory?.name ?? '';
    }

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CategoryListBloc, BaseState<List<Category>>>(
      builder: (context, state) {
        return TextFormField(
          controller: widget._categoryController,
          decoration: InputDecoration(
            // enabledBorder: OutlineInputBorder(
            //   borderRadius: BorderRadius.circular(8),
            // ),
            filled: true,
            label: Text('category'.tr()),
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
              if (categoryNames.isEmpty) {
                categoryNames = state.item!;
              }
              await showModalBottomSheet<String>(
                context: context,
                builder: (context) {
                  return CustomBottomSheet(
                    bottomSheetHeight: 750,
                    message: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: const Text(
                        'choose_category',
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
                        itemCount: categoryNames.length,
                        itemBuilder: (context, index) {
                          return ListTile(
                            trailing: Icon(
                              selectedCategory?.name ==
                                      categoryNames[index].name
                                  ? Icons.check_circle
                                  : Icons.circle_outlined,
                              color: Theme.of(context).primaryColor,
                            ),
                            title: Text(categoryNames[index].name ?? ''),
                            onTap: () {
                              if (selectedCategory?.name !=
                                  categoryNames[index].name) {
                                widget._categoryController.text =
                                    categoryNames[index].name ?? '';
                                widget.onChanged(categoryNames[index]);
                                selectedCategory = categoryNames[index];
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
              BlocProvider.of<CategoryListBloc>(context)
                  .add(CategoryListRequested());
            }
          },
        );
      },
    );
  }

  void _searchChanged(String searchText, List<Category> categories) {
    if (searchText.isNotEmpty) {
      setState(() {
        categoryNames = List.from(categories.where((name) =>
            name.name!.toLowerCase().contains(searchText.toLowerCase())));
      });
    } else {
      setState(() {
        categoryNames = List.from(categories);
      });
    }
  }
}
