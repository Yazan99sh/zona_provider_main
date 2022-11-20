import 'package:cached_network_image/cached_network_image.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:zona_provider_main/domain/service/entities/service.dart';
import 'package:zona_provider_main/presentation/core/utils/generated_assets/assets.gen.dart';
import 'package:zona_provider_main/presentation/core/widgets/delete_dialog_widget.dart';
import 'package:zona_provider_main/presentation/core/widgets/edit_delete_button_sheet_widget.dart';
import 'package:zona_provider_main/presentation/core/widgets/loader.dart';

class ServiceItemWidget extends StatelessWidget {
  final Service service;
  final void Function() onDelete;
  final void Function() onEdit;
  const ServiceItemWidget({
    Key? key,
    required this.service,
    required this.onEdit,
    required this.onDelete,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(
        top: 10,
        left: 16,
        right: 16,
      ),
      padding: const EdgeInsets.all(10),
      width: double.infinity,
      decoration: BoxDecoration(
          color: Theme.of(context).cardColor,
          borderRadius: BorderRadius.circular(8)),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(45),
            child: CachedNetworkImage(
              errorWidget: (context, url, error) {
                return Assets.images.logo.image(
                  width: 40,
                  height: 40,
                );
              },
              placeholder: (context, s) => const Loader(),
              imageUrl: service.image??'',
              height: 75,
              width: 75,
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(
            width: 20,
          ),
          Expanded(
              child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                service.name ?? '',
                style: Theme.of(context)
                    .textTheme
                    .headline3
                    ?.copyWith(fontWeight: FontWeight.w600, fontSize: 17),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 5,bottom: 5,),
                child: Text(
                  service.description?.toString() ?? '',
                  style: Theme.of(context)
                      .textTheme
                      .caption
                      ?.copyWith(fontWeight: FontWeight.w600, fontSize: 17),
                ),
              ),Text(
                service.address ?? '',
                style: Theme.of(context)
                    .textTheme
                    .caption
                    ?.copyWith(fontWeight: FontWeight.w600, fontSize: 17),
              ),
              Text(
                service.price?.toString() ?? '',
                style: Theme.of(context)
                    .textTheme
                    .caption
                    ?.copyWith(fontWeight: FontWeight.w600, fontSize: 17),
              ),
            ],
          )),
          Container(
            margin: const EdgeInsets.only(right: 10),
            alignment: Alignment.center,
            //height: 100,
            child:  EditDeleteButtonSheetWidget(
              onEdit: onEdit,
              textEdit: 'edit_service',
              onDelete: () {
                Navigator.pop(context);
                showDialog(
                  context: context,
                  builder: (context) {
                    return DeleteDialogWidget(
                        title: 'service'.tr(),
                        message: 'service'.tr(),
                        onDelete: onDelete);
                  },
                );
              },
              textDelete: 'delete_service',
            )
          )
        ],
      ),
    );
  }
}
