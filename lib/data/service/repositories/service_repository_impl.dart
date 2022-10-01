import 'dart:async';
import 'dart:io';
import 'package:dartz/dartz.dart';

import 'package:injectable/injectable.dart';
import 'package:logger/logger.dart';
import 'package:zona_provider_main/data/core/models/base_response/base_response.dart';
import 'package:zona_provider_main/data/core/repositories/base_repository_impl.dart';
import 'package:zona_provider_main/data/core/utils/configuration.dart';
import 'package:zona_provider_main/data/service/datasources/remote/service_remote_datasource.dart';
import 'package:zona_provider_main/data/service/models/category_model/category_model.dart';
import 'package:zona_provider_main/data/service/models/provider_model/provider_model.dart';
import 'package:zona_provider_main/data/service/models/service_model/service_model.dart';
import 'package:zona_provider_main/domain/core/entities/failures.dart';
import 'package:zona_provider_main/domain/core/utils/network/network_info.dart';
import 'package:zona_provider_main/domain/service/entities/category.dart';
import 'package:zona_provider_main/domain/service/entities/enums/service_filter.dart';
import 'package:zona_provider_main/domain/service/entities/provider.dart';
import 'package:zona_provider_main/domain/service/entities/service.dart';
import 'package:zona_provider_main/domain/service/repositories/service_repository.dart';

@LazySingleton(as: ServiceRepository)
class ServiceRepositoryImpl extends BaseRepositoryImpl
    implements ServiceRepository {
  final ServiceRemoteDataSource remote;
  final NetworkInfo networkInfo;
  final Logger logger;
  final Configuration configuration;

  ServiceRepositoryImpl(
    this.remote,
    this.networkInfo,
    this.logger,
    this.configuration,
  ) : super(networkInfo, logger);

  @override
  Future<Either<Failure, List<Service>>> getServices({
    required ServiceFilter serviceFilter,
  }) {
    return request(
      () async {
        final BaseResponse<List<ServiceModel>> result;
        if (serviceFilter == ServiceFilter.allService) {
          result = await remote.getAllService();
        } else if (serviceFilter == ServiceFilter.myServices) {
          result = await remote.getMyServices();
        } else {
          result = await remote.getPendingServices();
        }
        return Right(result.data!.map((e) => e.toDomain()).toList());
      },
    );
  }

  @override
  Future<Either<Failure, List<Category>>> getAllCategories() {
    return request(
      () async {
        final result = await remote.getAllCategories();
        return Right(result.data!.map((e) => e.toDomain()).toList());
      },
    );
  }

  @override
  Future<Either<Failure, List<Provider>>> getAllProviders() {
    return request(
      () async {
        final result = await remote.getAllProviders();
        return Right(result.data!.map((e) => e.toDomain()).toList());
      },
    );
  }

  @override
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
  }) {
    return request(
      () async {
        final result = await remote.addService(
          name: name,
          description: description,
          price: price,
          idCategory: idCategory,
          address: address,
          totalPrice: totalPrice,
          idProvider: idProvider,
          isColor: isColor,
          status: status,
          image: image,
        );
        return Right(result);
      },
    );
  }

  @override
  Future<Either<Failure, String>> updateService({
    required String id,
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
  }) {
    return request(
      () async {
        final result = await remote.updateService(
          id: id,
          name: name,
          description: description,
          price: price,
          idCategory: idCategory,
          address: address,
          totalPrice: totalPrice,
          idProvider: idProvider,
          isColor: isColor,
          status: status,
          image: image,
          rate: rate,
        );
        return Right(result);
      },
    );
  }

  @override
  Future<Either<Failure, String>> deleteService({
    required String id,
  }) {
    return request(() async {
      final result = await remote.deleteService(id: id);
      return Right(
        result,
      );
    });
  }
}
