import 'package:flutter/material.dart';
import 'package:flutter_riverpod/all.dart';
import 'package:noteapp/notifier.dart';

final notesprovider = ChangeNotifierProvider<Notifier>((ref) {
  return Notifier();
});

class NotesList extends ConsumerWidget {
  @override
  Widget build(BuildContext context, ScopedReader watch) {
    final counter = watch(notesprovider);
    return Expanded(
      child: ListView.builder(
        itemBuilder: (context, int index) {
          print(counter.Notes[index]);
          return Text(counter.Notes[index]);
        },
        itemCount: counter.Notes.length,
      ),
    );
  }
}

class DashBoard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final notes = TextEditingController();
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          TextField(
            controller: notes,
          ),
          FlatButton(
              onPressed: () => context.read(notesprovider).onsubmit(notes.text),
              child: Text('Submit')),
          NotesList(),
        ],
      ),
    );
  }
}
