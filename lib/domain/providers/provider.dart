import 'package:cryptoapp/data/reposistoy.dart';
import 'package:riverpod/riverpod.dart';

//odvaja odgovornosti i widget ne mora sve znat sto mu treba, cilj je da widget zna sto manje daj mi podatke a ne zanima ga od kud dolaze
final dogQuotesProvider = FutureProvider(
  ((ref) async {
    return ref.watch(factRepoProvider).getFacts();
  }),
);
//iduce state notifier pa sam kreirati state 