// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'service_remote_datasource.dart';

// **************************************************************************
// RetrofitGenerator
// **************************************************************************

// ignore_for_file: unnecessary_brace_in_string_interps,no_leading_underscores_for_local_identifiers

class _ServiceRemoteDataSourceImpl implements ServiceRemoteDataSourceImpl {
  _ServiceRemoteDataSourceImpl(this._dio, {this.baseUrl});

  final Dio _dio;

  String? baseUrl;

  @override
  Future<BaseResponse<List<ServiceModel>>> getAllService() async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<BaseResponse<List<ServiceModel>>>(
            Options(method: 'POST', headers: _headers, extra: _extra)
                .compose(_dio.options, '/api/auth/all_services',
                    queryParameters: queryParameters, data: _data)
                .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = BaseResponse<List<ServiceModel>>.fromJson(
      _result.data!,
      (json) => (json as List<dynamic>)
          .map<ServiceModel>(
              (i) => ServiceModel.fromJson(i as Map<String, dynamic>))
          .toList(),
    );
    return value;
  }

  @override
  Future<BaseResponse<List<ServiceModel>>> getMyServices() async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<BaseResponse<List<ServiceModel>>>(
            Options(method: 'POST', headers: _headers, extra: _extra)
                .compose(_dio.options, '/api/auth/my_services',
                    queryParameters: queryParameters, data: _data)
                .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = BaseResponse<List<ServiceModel>>.fromJson(
      _result.data!,
      (json) => (json as List<dynamic>)
          .map<ServiceModel>(
              (i) => ServiceModel.fromJson(i as Map<String, dynamic>))
          .toList(),
    );
    return value;
  }

  @override
  Future<BaseResponse<List<ServiceModel>>> getPendingServices() async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<BaseResponse<List<ServiceModel>>>(
            Options(method: 'POST', headers: _headers, extra: _extra)
                .compose(_dio.options, '/api/auth/pending_services',
                    queryParameters: queryParameters, data: _data)
                .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = BaseResponse<List<ServiceModel>>.fromJson(
      _result.data!,
      (json) => (json as List<dynamic>)
          .map<ServiceModel>(
              (i) => ServiceModel.fromJson(i as Map<String, dynamic>))
          .toList(),
    );
    return value;
  }

  @override
  Future<BaseResponse<List<CategoryModel>>> getAllCategories() async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<BaseResponse<List<CategoryModel>>>(
            Options(method: 'POST', headers: _headers, extra: _extra)
                .compose(_dio.options, '/api/auth/categories',
                    queryParameters: queryParameters, data: _data)
                .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = BaseResponse<List<CategoryModel>>.fromJson(
      _result.data!,
      (json) => (json as List<dynamic>)
          .map<CategoryModel>(
              (i) => CategoryModel.fromJson(i as Map<String, dynamic>))
          .toList(),
    );
    return value;
  }

  @override
  Future<BaseResponse<List<ProviderModel>>> getAllProviders() async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<BaseResponse<List<ProviderModel>>>(
            Options(method: 'POST', headers: _headers, extra: _extra)
                .compose(_dio.options, '/api/auth/all_Providers',
                    queryParameters: queryParameters, data: _data)
                .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = BaseResponse<List<ProviderModel>>.fromJson(
      _result.data!,
      (json) => (json as List<dynamic>)
          .map<ProviderModel>(
              (i) => ProviderModel.fromJson(i as Map<String, dynamic>))
          .toList(),
    );
    return value;
  }

  @override
  Future<String> addService(
      {name,
      description,
      price,
      idCategory,
      address,
      totalPrice,
      idProvider,
      isColor,
      status,
      image}) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    queryParameters.removeWhere((k, v) => v == null);
    final _headers = <String, dynamic>{};
    final _data = FormData();
    if (name != null) {
      _data.fields.add(MapEntry('name', name));
    }
    if (description != null) {
      _data.fields.add(MapEntry('description', description));
    }
    if (price != null) {
      _data.fields.add(MapEntry('price', price.toString()));
    }
    if (idCategory != null) {
      _data.fields.add(MapEntry('idcategory', idCategory.toString()));
    }
    if (address != null) {
      _data.fields.add(MapEntry('address', address));
    }
    if (totalPrice != null) {
      _data.fields.add(MapEntry('total_price', totalPrice.toString()));
    }
    if (idProvider != null) {
      _data.fields.add(MapEntry('idprovider', idProvider.toString()));
    }
    if (isColor != null) {
      _data.fields.add(MapEntry('is_color', isColor.toString()));
    }
    if (status != null) {
      _data.fields.add(MapEntry('status', status.toString()));
    }
    if (image != null) {
      _data.files.add(MapEntry(
          'image',
          MultipartFile.fromFileSync(image.path,
              filename: image.path.split(Platform.pathSeparator).last,
              contentType: MediaType.parse('image/jpeg'))));
    }
    final _result = await _dio.fetch<String>(_setStreamType<String>(
        Options(method: 'POST', headers: _headers, extra: _extra)
            .compose(_dio.options, '/api/auth/Add_Service_Bytoken',
                queryParameters: queryParameters, data: _data)
            .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = _result.data!;
    return value;
  }

  @override
  Future<String> updateService(
      {required id,
      name,
      description,
      price,
      idCategory,
      address,
      totalPrice,
      idProvider,
      isColor,
      status,
      image,
      rate}) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    queryParameters.removeWhere((k, v) => v == null);
    final _headers = <String, dynamic>{};
    final _data = FormData();
    _data.fields.add(MapEntry('id', id.toString()));
    if (name != null) {
      _data.fields.add(MapEntry('name', name));
    }
    if (description != null) {
      _data.fields.add(MapEntry('description', description));
    }
    if (price != null) {
      _data.fields.add(MapEntry('price', price.toString()));
    }
    if (idCategory != null) {
      _data.fields.add(MapEntry('idcategory', idCategory.toString()));
    }
    if (address != null) {
      _data.fields.add(MapEntry('address', address));
    }
    if (totalPrice != null) {
      _data.fields.add(MapEntry('total_price', totalPrice.toString()));
    }
    if (idProvider != null) {
      _data.fields.add(MapEntry('idprovider', idProvider.toString()));
    }
    if (isColor != null) {
      _data.fields.add(MapEntry('is_color', isColor.toString()));
    }
    if (status != null) {
      _data.fields.add(MapEntry('status', status.toString()));
    }
    if (image != null) {
      _data.files.add(MapEntry(
          'image',
          MultipartFile.fromFileSync(image.path,
              filename: image.path.split(Platform.pathSeparator).last,
              contentType: MediaType.parse('image/jpeg'))));
    }
    if (rate != null) {
      _data.fields.add(MapEntry('rate', rate.toString()));
    }
    final _result = await _dio.fetch<String>(_setStreamType<String>(
        Options(method: 'PATCH', headers: _headers, extra: _extra)
            .compose(_dio.options, '/api/auth/Update_Service_Bytoken',
                queryParameters: queryParameters, data: _data)
            .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = _result.data!;
    return value;
  }

  @override
  Future<String> deleteService({required id}) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = FormData();
    _data.fields.add(MapEntry('id', id));
    final _result = await _dio.fetch<String>(_setStreamType<String>(
        Options(method: 'POST', headers: _headers, extra: _extra)
            .compose(_dio.options, '/api/auth/delete_service',
                queryParameters: queryParameters, data: _data)
            .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = _result.data!;
    return value;
  }

  RequestOptions _setStreamType<T>(RequestOptions requestOptions) {
    if (T != dynamic &&
        !(requestOptions.responseType == ResponseType.bytes ||
            requestOptions.responseType == ResponseType.stream)) {
      if (T == String) {
        requestOptions.responseType = ResponseType.plain;
      } else {
        requestOptions.responseType = ResponseType.json;
      }
    }
    return requestOptions;
  }
}
