import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:zona_provider_main/domain/core/entities/failures.dart';
import 'package:zona_provider_main/domain/core/usecases/usecase.dart';
import 'package:zona_provider_main/domain/service/repositories/service_repository.dart';

import 'package:injectable/injectable.dart';

@lazySingleton
class AddServiceUseCase extends UseCase<String, AddServiceUseCaseParams> {
  final ServiceRepository repository;

  AddServiceUseCase({
    required this.repository,
  });

  @override
  Future<Either<Failure, String>> call(AddServiceUseCaseParams params) {
    return repository.addService(
      name: params.name,
      description: params.description,
      price: params.price,
      idCategory: params.idCategory,
      address: params.address,
      totalPrice: params.totalPrice,
      idProvider: params.idProvider,
      isColor: params.isColor,
      status: params.status,
      image: params.image,
    );
  }
}

class AddServiceUseCaseParams {
  final String? name;
  final String? description;
  final double? price;
  final int? idCategory;
  final String? address;
  final double? totalPrice;
  final int? idProvider;
  final int? isColor;
  final int? status;
  final File? image;

  AddServiceUseCaseParams({
    this.name,
    this.description,
    this.price,
    this.idCategory,
    this.address,
    this.totalPrice,
    this.idProvider,
    this.isColor,
    this.status,
    this.image,
  });
}
