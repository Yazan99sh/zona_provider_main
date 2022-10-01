import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:zona_provider_main/domain/auth/usecases/update_profile_use_case.dart';
import 'package:zona_provider_main/domain/user/entities/enums/gender.dart';
import 'package:zona_provider_main/domain/user/entities/my_Profile.dart';
import 'package:zona_provider_main/presentation/core/blocs/core/base_state.dart';

part 'update_profile_event.dart';

@injectable
class UpdateProfileBloc extends Bloc<UpdateProfileEvent, BaseState<MyProfile>> {
  final UpdateProfileUseCase updateProfileUseCase;

  UpdateProfileBloc(this.updateProfileUseCase) : super(const BaseState()) {
    on<UpdateProfileRequested>(
      (event, emit) async {
        emit(const BaseState(status: BaseStatus.inProgress));
        final result = await updateProfileUseCase.call(
          UpdateProfileUseCaseParams(
            email: event.email,
            firstName: event.firstName,
            lastName: event.lastName,
            phone: event.phone,
            gender: event.gender,
            profileImage: event.profileImage,
            dateOfBirth: event.dateOfBirth,
          ),
        );
        emit(
          result.fold(
            (l) => state.setFailureState(l),
            (r) => state.setSuccessState(r),
          ),
        );
      },
    );
  }
}
