import 'dart:async';

import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:zona_provider_main/domain/core/entities/failures.dart';
import 'package:zona_provider_main/domain/service/entities/category.dart';
import 'package:zona_provider_main/domain/service/entities/enums/service_filter.dart';
import 'package:zona_provider_main/domain/service/entities/provider.dart';
import 'package:zona_provider_main/domain/service/entities/service.dart';

abstract class ServiceRepository {
  Future<Either<Failure, List<Service>>> getServices({
    required ServiceFilter serviceFilter,
  });

  Future<Either<Failure, List<Category>>> getAllCategories();

  Future<Either<Failure, List<Provider>>> getAllProviders();

  Future<Either<Failure, String>> addService({
    String? name,
    String? description,
    double? price,
    int? idCategory,
    String? address,
    double? totalPrice,
    int? idProvider,
    int? isColor,
    int? status,
    File? image,
  });

  Future<Either<Failure, String>> updateService({
    required int id,
    String? name,
    String? description,
    double? price,
    int? idCategory,
    String? address,
    double? totalPrice,
    int? idProvider,
    int? isColor,
    int? status,
    File? image,
    double? rate,
  });

  Future<Either<Failure, String>> deleteService({
    required String id,
  });
}
