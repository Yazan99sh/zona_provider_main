import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:zona_provider_main/presentation/core/routes/router.dart';
import 'package:zona_provider_main/presentation/core/widgets/app_drawer.dart';
import 'package:zona_provider_main/presentation/core/widgets/drawer_leading_icon.dart';

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
      ),
      body: Center(
          child: ElevatedButton(
              onPressed: () {
                AutoRouter.of(context).push(const MyProfilePageRoute());
              },
              child: const Text('my profile'))),
    );
  }
}
