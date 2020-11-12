import 'package:flutter/material.dart';
import 'package:flutter_riverpod/all.dart';
import 'package:noteapp/notifier.dart';

final notesprovider = ChangeNotifierProvider<Notifier>((ref) {
  return Notifier();
});

class NotesList extends ConsumerWidget {
  @override
  Widget build(BuildContext context, ScopedReader watch) {
    final noteswatcher = watch(notesprovider);
    return Expanded(
      child: ListView.builder(
        itemBuilder: (context, int index) {
          print(noteswatcher.Notes[index]);
          return Text(noteswatcher.Notes[index]);
        },
        itemCount: noteswatcher.Notes.length,
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
