import 'package:flutter/material.dart';
import 'package:pokemon_tiktok/guardado/nota.dart';
import 'package:pokemon_tiktok/guardado/opcion_database.dart';

final _lightColors = [
  Colors.amber.shade300,
  Colors.lightGreen.shade300,
  Colors.lightBlue.shade300,
  Colors.orange.shade300,
  Colors.pinkAccent.shade100,
  Colors.tealAccent.shade100
];

class NoteCardWidget extends StatelessWidget {
  NoteCardWidget({
    Key? key,
    required this.note,
    required this.index,
  }) : super(key: key);

  final Note note;
  final int index;

  @override
  Widget build(BuildContext context) {

    final color = _lightColors[note.id! % _lightColors.length];

    return Card(
      color: color,
      child: Container(
        constraints: BoxConstraints(minHeight: 30),
        padding: EdgeInsets.all(8),
        child: Row(
         // mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
              Image.network(note.url_imagen,),
          Text(
              note.title,
              style: TextStyle(
                color: Colors.white,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.15,
            ),
            Align(
              alignment: Alignment.center,
              child:
              IconButton(
                icon: Icon(Icons.delete),
                onPressed: () async {
                  await NotesDatabase.instance.delete(note.id as int );
                },
              ),),

                ]
           )

      ),
    );
  }

}
