import 'dart:developer';

import 'package:cryptoapp/domain/providers/provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

//probati na ovom primjeru napisati repozitorij koji ce imati samo

class DogQuotes extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final data = ref.watch(dogQuotesProvider);

    return Scaffold(
        appBar: AppBar(actions: [
          ElevatedButton(
              onPressed: () => ref.refresh(dogQuotesProvider),
              child: Icon(Icons.refresh))
        ]),
        //tu raspakiravam liniju 11
        body: Center(
          child: data.maybeWhen(
            data: (data) {
              return data.fold(
                  (l) => Text('Error: ${l.error}'),
                  (r) => ListView.separated(
                        itemBuilder: (context, index) => Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(
                                  top: 150, left: 20, right: 20),
                              child: Text(
                                r.facts[index].toString(),
                              ),
                            ),
                          ],
                        ),
                        separatorBuilder: (context, index) => Divider(),
                        itemCount: r.facts.length,
                      ));
            },
            loading: () => CircularProgressIndicator(),
            orElse: () {
              return SizedBox();
            },
          ),
        ));
  }
}
