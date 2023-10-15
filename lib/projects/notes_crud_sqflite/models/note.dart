class Note {
  int? id;
  String title;
  String? description;
  String date;
  int priority;

  Note(this.title, this.date, this.priority, [this.description]) {
    id = null;
  }

  Note.withId(this.id, this.title, this.date, this.priority,
      [this.description]);

  Map<String, dynamic> toMap() {
    var map = <String, dynamic>{
      'title': title,
      'priority': priority,
      'date': date,
    };

    if (id != null) {
      map['id'] = id;
    }

    if (description != null) {
      map['description'] = description;
    }

    return map;
  }

  factory Note.fromMapObject(Map<String, dynamic> map) {
    return Note.withId(
      map['id'],
      map['title'],
      map['date'],
      map['priority'],
      map['description'],
    );
  }
}
