import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:zona_provider_main/presentation/core/widgets/custom_bottom_sheet.dart';

class EditDeleteButtonSheetWidget extends StatelessWidget {
  final Function() onEdit;
  final String textEdit;
  final Function() onDelete;
  final String textDelete;

  const EditDeleteButtonSheetWidget(
      {Key? key,
      required this.onEdit,
      required this.textEdit,
      required this.onDelete,
      required this.textDelete,})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () async {
          await showModalBottomSheet(
              context: context,
              builder: (context) {
                return CustomBottomSheet(options: [
                  ListTile(
                      leading: Icon(
                        Icons.edit,
                        color: Theme.of(context).colorScheme.secondary,
                      ),
                      title: Text(
                        textEdit.tr(),
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      onTap: onEdit),
                  ListTile(
                      leading: Icon(
                        Icons.delete,
                        color: Theme.of(context).errorColor,
                      ),
                      title: Text(
                        textDelete.tr(),
                        style: TextStyle(
                          color: Theme.of(context).errorColor,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      onTap: onDelete)
                ]);
              });
        },
        child: const Icon(Icons.more_vert));
  }
}
