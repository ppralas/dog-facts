import 'package:cryptoapp/data/dog_quotes_api_client.dart';
import 'package:cryptoapp/data/reposistoy.dart';
import 'package:riverpod/riverpod.dart';

typedef EntityMapper<Entity, Response> = Entity Function(Response);

final factsEntityMapperProvider = Provider<EntityMapper<Facts, FactsResponse>>(
    //kako je definirano da je tipa entity mappera provider mora vratiti function response koji vraca entity facts
    ((ref) => (response) => Facts(response.facts)));
