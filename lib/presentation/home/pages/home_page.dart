import 'package:flutter/material.dart';
import 'package:zona_provider_main/domain/service/entities/enums/service_filter.dart';
import 'package:zona_provider_main/presentation/core/utils/generated_assets/assets.gen.dart';
import 'package:zona_provider_main/presentation/core/widgets/app_drawer.dart';
import 'package:zona_provider_main/presentation/core/widgets/drawer_leading_icon.dart';
import 'package:zona_provider_main/presentation/service/widgets/service_list_item_widget.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const AppDrawer(),
      appBar: AppBar(
        leading: const DrawerLeadingIcon(),
        centerTitle: true,
        title: Assets.images.logo.image(
          width: 110,
          height: 60,
        ),
      ),
      body: const ServiceListItemWidget(serviceFilter: ServiceFilter.allService)
    );
  }
}
