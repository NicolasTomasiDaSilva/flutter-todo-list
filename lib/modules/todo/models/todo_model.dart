class Todo {
  final String id;
  late String title;
  late bool isDone;

  Todo({required this.id, required this.title, required this.isDone});

  factory Todo.fromJson(Map<String, dynamic> json) =>
      Todo(id: json['id'], title: json['title'], isDone: json['isDone']);
}
