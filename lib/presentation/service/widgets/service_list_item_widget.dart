import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:zona_provider_main/domain/service/entities/enums/service_filter.dart';
import 'package:zona_provider_main/domain/service/entities/service.dart';
import 'package:zona_provider_main/injection.dart';
import 'package:zona_provider_main/presentation/core/blocs/core/base_state.dart';
import 'package:zona_provider_main/presentation/core/routes/router.dart';
import 'package:zona_provider_main/presentation/core/widgets/error_view.dart';
import 'package:zona_provider_main/presentation/core/widgets/screen_loader.dart';
import 'package:zona_provider_main/presentation/core/widgets/screen_utils.dart';
import 'package:zona_provider_main/presentation/core/widgets/shimmer.dart';
import 'package:zona_provider_main/presentation/service/blocs/delete_service_bloc/delete_service_bloc.dart';
import 'package:zona_provider_main/presentation/service/blocs/service_list_bloc/service_list_bloc.dart';
import 'package:zona_provider_main/presentation/service/widgets/service_item_widget.dart';


class ServiceListItemWidget extends StatefulWidget {
  final ServiceFilter serviceFilter;
  const ServiceListItemWidget({Key? key ,required this.serviceFilter,}) : super(key: key);

  @override
  State<ServiceListItemWidget> createState() => _ServiceListItemWidgetState();
}

class _ServiceListItemWidgetState extends State<ServiceListItemWidget>  with ScreenUtils<ServiceListItemWidget>, ScreenLoader{
  final ServiceListBloc _serviceListBloc = getIt<ServiceListBloc>();
  final DeleteServiceBloc _deleteServiceBloc = getIt<DeleteServiceBloc>();
  @override
  void initState() {
    _serviceListBloc.add(ServiceListRequested(serviceFilter: widget.serviceFilter,));
    super.initState();
  }

  @override
  Widget screen(BuildContext context) {
    return   BlocListener<DeleteServiceBloc, BaseState<String>>(
      bloc: _deleteServiceBloc,
      listener: (context, state) {
        if (state.isInProgress) {
          startLoading();
        } else if (state.isFailure) {
          showError(failure: state.failure);
          stopLoading();
        } else if (state.isSuccess) {
          stopLoading();
          showSuccess();
        }
      },
      child: RefreshIndicator(
        color: Theme.of(context).primaryColor,
        backgroundColor: Theme.of(context).colorScheme.background,
        onRefresh: () async {
          _serviceListBloc.add(ServiceListRequested(serviceFilter: widget.serviceFilter,));
        },
        child: BlocBuilder<ServiceListBloc, BaseState<List<Service>>>(
          bloc: _serviceListBloc,
          builder: (context, state) {
            if (state.isInProgress) {
              return Padding(
                padding: const EdgeInsets.only(
                  left: 16,
                  right: 16,
                ),
                child: ListView.builder(
                    itemCount: 15,
                    physics: const ScrollPhysics(),
                    shrinkWrap: true,
                    itemBuilder: (context, index) {
                      return const ShimmerWidget(
                        width: double.infinity,
                        height: 120,
                        marginButton: 8,
                      );
                    }),
              );
            } else if (state.isFailure) {
              return SizedBox(
                height: 160,
                child: Center(
                  child: ErrorView(
                    failure: state.failure,
                    onRetry: () {
                      _serviceListBloc.add(ServiceListRequested(serviceFilter: widget.serviceFilter,));
                    },
                  ),
                ),
              );
            }
            if (state.item?.isNotEmpty ?? false) {
              return ListView.builder(
                  itemCount: state.item!.length,
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                      return ServiceItemWidget(service: state.item![index],
                      onEdit: (){
                        AutoRouter.of(context).push(AddEditServicePageRoute(service:state.item![index] ));
                      },
                        onDelete: (){
                          _deleteServiceBloc.add(DeleteServiceRequested(
                              serviceId: state.item![index].id.toString()));
                        },
                      );

                  });
            } else {
              return Center(
                  child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  MaterialButton(
                    padding: const EdgeInsets.only(right: 4.0, left: 3.0),
                    minWidth: 40,
                    height: 40,
                    color: Theme.of(context).cardColor,
                    onPressed: () {
                      _serviceListBloc.add(ServiceListRequested(serviceFilter: widget.serviceFilter,));
                    },
                    child: const Icon(
                      Icons.refresh_rounded,
                      //  color: Theme.of(context).iconTheme.color,
                      size: 30.0,
                    ),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Text('no_data'.tr()),
                ],
              ));
            }
          },
        ),
      ),
    );
  }
}
