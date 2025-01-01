class Question {
  // final String id;
  final String title;
  final Map<String, bool> options;
  Question({
    // required this.id,
    required this.title,
    required this.options,
  });

  @override
  String toString() {
    // TODO: implement toString
    // return 'Question(id: $id, title: $title, options: $options)';
    return 'Question(title: $title, options: $options)';
  }
}

class MakeQuestion {
  // final String id;
  final String titlea;
  final Map<String, bool> optionsa;
  MakeQuestion({
    // required this.id,
    required this.titlea,
    required this.optionsa,
  });

  @override
  String toString() {
    // TODO: implement toString
    // return 'Question(id: $id, title: $title, options: $options)';
    return 'title: $titlea, options: $optionsa';
  }
}
