import 'package:flutter/material.dart';
import 'package:tugas_9_flutter/data/data_cards.dart';
import 'package:tugas_9_flutter/models/modelday14.dart';

class ModelDay14 extends StatefulWidget {
  const ModelDay14({super.key});

  @override
  State<ModelDay14> createState() => _ModelDay14State();
}

class _ModelDay14State extends State<ModelDay14> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: welcomeList.length,
      itemBuilder: (context, index) {
        final card = welcomeList[index];

        return ListTile(
          leading: Image.asset("assets/cards/${card.img}"),
          title: Text(card.name ?? ''),
          subtitle: Text(card.fortuneTelling?[0] ?? ''),
        );
      },
    );
  }
}
