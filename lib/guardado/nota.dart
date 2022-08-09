final String tableNotes = 'notes';

class NoteFields {
  static final List<String> values = [
    /// Add all fields
    id, title, description,url_imagen
  ];

  static final String id = '_id';
  static final String title = 'title';
  static final String description = 'description';
  static final String url_imagen = 'url_imagen';
}

class Note {
  final int? id;
  final String title;
  final String description;
  final String url_imagen;

  const Note({
    this.id,
    required this.title,
    required this.description,
    required this.url_imagen,
  });

  Note copy({
    int? id,
    String? title,
    String? description,
    String? url_imagen,
  }) =>
      Note(
        id: id ?? this.id,
        title: title ?? this.title,
        description: description ?? this.description,
        url_imagen: url_imagen ?? this.url_imagen,
      );

  static Note fromJson(Map<String, Object?> json) => Note(
    id: json[NoteFields.id] as int?,
    title: json[NoteFields.title] as String,
    description: json[NoteFields.description] as String,
    url_imagen: json[NoteFields.url_imagen] as String,
  );

  Map<String, Object?> toJson() => {
    NoteFields.id: id,
    NoteFields.title: title,
    NoteFields.description: description,
    NoteFields.url_imagen : url_imagen,
  };
}
