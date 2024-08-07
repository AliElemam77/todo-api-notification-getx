class AllNotes {
  int? total;
  List<Note>? notes;

  AllNotes({this.total, this.notes});

  AllNotes.fromJson(Map<String, dynamic> json) {
    total = json['total'];
    if (json['notes'] != null) {
      notes = <Note>[];
      json['notes'].forEach((v) {
        notes!.add(Note.fromJson(v));
      });
    }
  }
}

class Note {
  String? sId;
  String? title;
  String? subtitle;
  String? userId;
  String? createdAt;

  Note({
    this.sId,
    this.title,
    this.subtitle,
    this.userId,
    this.createdAt,
  });

  Note.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    title = json['title'];
    subtitle = json['subtitle'];
    userId = json['user_id'];
    createdAt = json['createdAt'];
  }
  Note.toJson(Map<String, dynamic> json) {
    title = json['title'];
    subtitle = json['subtitle'];
  }
}
