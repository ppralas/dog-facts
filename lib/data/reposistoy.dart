import 'package:cryptoapp/data/dog_quotes_api_client.dart';
import 'package:cryptoapp/data/mappers/mapper.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:riverpod/riverpod.dart';

final factRepoProvider =
    Provider<FactsRepository>(((ref) => FactsRepositoryImpl(
          ref.watch(apiClient),
          ref.watch(factsEntityMapperProvider),
        )));

class Failure {
  final dynamic error;
  final StackTrace? trace;

  Failure(this.error, this.trace);
}

abstract class FactsRepository {
  Future<Either<Failure, Facts>> getFacts();
}

class Facts extends Equatable {
  final List<String> facts;

  Facts(this.facts);

  @override
  List<Object?> get props => [facts];
}

class FactsRepositoryImpl implements FactsRepository {
  final DogQuotesApiClient dogApi;
  final EntityMapper<Facts, FactsResponse> mapper;
  FactsRepositoryImpl(this.dogApi, this.mapper);

  @override
  Future<Either<Failure, Facts>> getFacts() async {
    try {
      final result = await dogApi.getFacts();

      return right(mapper(result));
    } catch (error, stackTrace) {
      return left(Failure(error, stackTrace));
    }
  }
}
