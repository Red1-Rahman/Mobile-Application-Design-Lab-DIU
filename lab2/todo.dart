class TodoApp {
  final List<String> _todos = [];

  void add(String task) => _todos.add(task);
  void remove(int index) => _todos.removeAt(index);
  void show() => print("Todos: $_todos");
}

void main() {
  var app = TodoApp();
  app.add("Buy milk");
  app.add("Study Dart");
  app.add("Go to GYM");
  app.add("Go to sleep");
  app.add("Learn openGL");
  app.add("Learn Unity");
  app.add("Learn Unreal Engine");
  app.add("learn Quantum Computing");
  app.add("Learn Astrophysics");


  app.show();

  app.remove(0);




  app.show();
}
