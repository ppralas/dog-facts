// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'dog_quotes_api_client.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

FactsResponse _$FactsResponseFromJson(Map<String, dynamic> json) =>
    FactsResponse(
      (json['facts'] as List<dynamic>).map((e) => e as String).toList(),
    );

Map<String, dynamic> _$FactsResponseToJson(FactsResponse instance) =>
    <String, dynamic>{
      'facts': instance.facts,
    };

// **************************************************************************
// RetrofitGenerator
// **************************************************************************

// ignore_for_file: unnecessary_brace_in_string_interps,no_leading_underscores_for_local_identifiers

class _DogQuotesApiClient implements DogQuotesApiClient {
  _DogQuotesApiClient(
    this._dio, {
    this.baseUrl,
  }) {
    baseUrl ??= 'https://dog-api.kinduff.com/api';
  }

  final Dio _dio;

  String? baseUrl;

  @override
  Future<FactsResponse> getFacts() async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    final _result = await _dio
        .fetch<Map<String, dynamic>>(_setStreamType<FactsResponse>(Options(
      method: 'GET',
      headers: _headers,
      extra: _extra,
    )
            .compose(
              _dio.options,
              '/facts',
              queryParameters: queryParameters,
              data: _data,
            )
            .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = FactsResponse.fromJson(_result.data!);
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
