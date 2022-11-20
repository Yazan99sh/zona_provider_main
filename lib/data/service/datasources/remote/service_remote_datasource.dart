import 'dart:io';

import 'package:dio/dio.dart';

import 'package:injectable/injectable.dart';
import 'package:retrofit/retrofit.dart';
import 'package:http_parser/http_parser.dart';
import 'package:zona_provider_main/data/core/models/base_response/base_response.dart';
import 'package:zona_provider_main/data/core/utils/configuration.dart';
import 'package:zona_provider_main/data/service/models/category_model/category_model.dart';
import 'package:zona_provider_main/data/service/models/provider_model/provider_model.dart';
import 'package:zona_provider_main/data/service/models/service_model/service_model.dart';

part 'service_remote_datasource.g.dart';

abstract class ServiceRemoteDataSource {
  Future<BaseResponse<List<ServiceModel>>> getAllService();

  Future<BaseResponse<List<ServiceModel>>> getMyServices();

  Future<BaseResponse<List<ServiceModel>>> getPendingServices();

  Future<BaseResponse<List<CategoryModel>>> getAllCategories();

  Future<BaseResponse<List<ProviderModel>>> getAllProviders();

  Future<String> addService({
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

  Future<String> updateService({
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

  Future<String> deleteService({
    required String id,
  });
}

@LazySingleton(as: ServiceRemoteDataSource)
@RestApi(baseUrl: '')
abstract class ServiceRemoteDataSourceImpl implements ServiceRemoteDataSource {
  @factoryMethod
  factory ServiceRemoteDataSourceImpl(Dio dio, Configuration configuration) {
    return _ServiceRemoteDataSourceImpl(dio, baseUrl: configuration.getBaseUrl);
  }

  @override
  @POST('/api/auth/all_services')
  Future<BaseResponse<List<ServiceModel>>> getAllService();

  @override
  @POST('/api/auth/my_services')
  Future<BaseResponse<List<ServiceModel>>> getMyServices();

  @override
  @POST('/api/auth/pending_services')
  Future<BaseResponse<List<ServiceModel>>> getPendingServices();

  @override
  @POST('/api/auth/categories')
  Future<BaseResponse<List<CategoryModel>>> getAllCategories();

  @override
  @POST('/api/auth/all_Providers')
  Future<BaseResponse<List<ProviderModel>>> getAllProviders();

  @override
  @POST('/api/auth/Add_Service_Bytoken')
  Future<String> addService({
    @Part() String? name,
    @Part() String? description,
    @Part() double? price,
    @Part(name: 'idcategory') int? idCategory,
    @Part() String? address,
    @Part(name: 'total_price') double? totalPrice,
    @Part(name: 'idprovider') int? idProvider,
    @Part(name: 'is_color') int? isColor,
    @Part() int? status,
    @Part(contentType: 'image/jpeg') File? image,
  });

  @override
  @PATCH('/api/auth/Update_Service_Bytoken')
  Future<String> updateService({
    @Part(name: 'id') required int id,
    @Part() String? name,
    @Part() String? description,
    @Part() double? price,
    @Part(name: 'idcategory') int? idCategory,
    @Part() String? address,
    @Part(name: 'total_price') double? totalPrice,
    @Part(name: 'idprovider') int? idProvider,
    @Part(name: 'is_color') int? isColor,
    @Part() int? status,
    @Part(contentType: 'image/jpeg') File? image,
    @Part() double? rate,
  });

  @override
  @POST('/api/auth/delete_service')
  Future<String> deleteService({
    @Part() required String id,
  });
}
