class CreateTodoDTO {
  final String title;

  CreateTodoDTO({required this.title});

  Map<String, dynamic> toJson() => {'title': title};
}
