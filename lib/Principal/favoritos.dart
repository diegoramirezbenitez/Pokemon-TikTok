import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:pokemon_tiktok/guardado/opcion_database.dart';
import 'package:pokemon_tiktok/guardado/nota.dart';
import 'package:pokemon_tiktok/Principal/colores.dart';

class favoritos extends StatefulWidget {
  @override
  _NotesPageState createState() => _NotesPageState();
}

class _NotesPageState extends State<favoritos> {
  late List<Note> notes;
  bool isLoading = false;

  @override
  void initState() {
    super.initState();

    refreshNotes();
  }


  Future refreshNotes() async {
    setState(() => isLoading = true);

    this.notes = await NotesDatabase.instance.readAllNotes();

    setState(() => isLoading = false);
  }

  @override
  Widget build(BuildContext context) =>
      Scaffold(
    appBar: AppBar(
      backgroundColor: Colors.black12,
      title: Text(
        'Mis favoritos',
        style: TextStyle(fontSize: 20,color: Colors.white),
      ),
      //actions: [Icon(Icons.search), SizedBox(width: 12)],
    ),
    body: Center(
      child: isLoading
          ? CircularProgressIndicator()
          : notes.isEmpty
          ? Text(
        'No hay Favoritos',
        style: TextStyle(color: Colors.black, fontSize: 24),
      )
          : buildNotes(),
    ),
  );


  Widget buildNotes() => StaggeredGridView.countBuilder(
    padding: EdgeInsets.all(8),
    itemCount: notes.length,
    staggeredTileBuilder: (index) => StaggeredTile.fit(2),
    crossAxisCount: 2,
    mainAxisSpacing: 4,
    crossAxisSpacing: 4,
    itemBuilder: (context, index) {
      final note = notes[index];

      return GestureDetector(
        onTap: () async {
          refreshNotes();
        },
        child: NoteCardWidget(note: note, index: index),
      );
    },
  );
}
