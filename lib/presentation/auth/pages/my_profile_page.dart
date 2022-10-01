import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:zona_provider_main/domain/user/entities/user_info.dart';
import 'package:zona_provider_main/presentation/auth/widgets/my_profile/profile_item_widget.dart';
import 'package:zona_provider_main/presentation/core/auth/auth_bloc.dart';
import 'package:zona_provider_main/presentation/core/routes/router.dart';
import 'package:zona_provider_main/presentation/core/widgets/back_leading_icon.dart';
import 'package:zona_provider_main/presentation/core/widgets/custom_app_bar.dart';
import 'package:cached_network_image/cached_network_image.dart';

class MyProfilePage extends StatefulWidget {
  const MyProfilePage({Key? key}) : super(key: key);

  @override
  State<MyProfilePage> createState() => _MyProfilePageState();
}

class _MyProfilePageState extends State<MyProfilePage> {
  UserInfo? userInfo;

  @override
  void initState() {
    if (BlocProvider.of<AuthBloc>(context).state is Authenticated) {
      userInfo =
          (BlocProvider.of<AuthBloc>(context).state as Authenticated).user;
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        leading: const BackLeadingIcon(),
        title: const Text(
          'my_profile',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ).tr(),
        centerTitle: true,
        actions: [
          MaterialButton(
            padding: const EdgeInsets.only(left: 4.0),
            minWidth: 40,
            height: 40,
            //  color: Theme.of(context).cardTheme.color,
            onPressed: () {
              AutoRouter.of(context).push( const EditMuProfilePageRoute());
            },
            child: Icon(
              Icons.edit,
              color: Theme.of(context).primaryColor,
              size: 30.0,
            ),
          )
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.only(
          top: 25,
          left: 17,
          right: 17,
        ),
        child: Column(
          children: [
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(10),
              margin: const EdgeInsets.only(
                bottom: 10,
              ),
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.onPrimary,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(35),
                    child: (userInfo?.profileImage?.isNotEmpty ?? false)
                        ? CachedNetworkImage(
                            placeholder: (context, url) =>
                                const CircularProgressIndicator(),
                            imageUrl: userInfo?.profileImage ?? '',
                            fit: BoxFit.cover,
                            width: 65,
                            height: 65,
                            errorWidget: (context, url, error) => const Icon(
                              Icons.error,
                              size: 65,
                            ),
                          )
                        : const Icon(
                            Icons.account_circle,
                            size: 65,
                          ),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          userInfo?.fullName ?? '',
                          style:
                              Theme.of(context).textTheme.headline3!.copyWith(
                                    fontWeight: FontWeight.bold,
                                  ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Text(
                          userInfo?.email ?? '',
                          style: Theme.of(context)
                              .textTheme
                              .headline3
                              ?.copyWith(
                                  color: Theme.of(context)
                                      .textTheme
                                      .caption
                                      ?.color),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(10),
              margin: const EdgeInsets.only(
                bottom: 10,
              ),
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.onPrimary,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  if (userInfo?.phone?.isNotEmpty ?? false)
                    ProfileItemWidget(
                      title: 'phone_number',
                      description: userInfo!.phone!,
                    ),
                  if (userInfo?.email?.isNotEmpty ?? false)
                    ProfileItemWidget(
                        title: 'email', description: userInfo!.email!),
                  if (userInfo?.gender != null)
                    ProfileItemWidget(
                      title: 'gender',
                      description:
                          userInfo!.gender.toString().split('.').last.tr(),
                    ),
                  if (userInfo?.dateOfBirth != null)
                    ProfileItemWidget(
                        title: 'date_of_birth',
                        description: DateFormat('yyyy-MM-dd')
                            .format(userInfo!.dateOfBirth!)),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
