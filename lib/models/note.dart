class Note {

  Note({this.id, required this.note, required this.createdAt});
  int? id;
  String note;
  DateTime createdAt;

  ///
  Map<String, dynamic> toMap() {
    return {'note': note, 'createdAt': createdAt.toString()};
  }
}
