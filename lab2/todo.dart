class TodoApp {
  final List<String> _todos = [];

  void add(String task) => _todos.add(task);
  void remove(int index) => _todos.removeAt(index);
  void show() => print("Todos: $_todos");
}

void main() {
  var app = TodoApp();
  app.add("Buy milk"); //0
  app.add("Study Dart"); //1
  app.add("Go to GYM"); //2
  app.add("Go to sleep"); //3
  app.add("Learn openGL"); //4
  app.add("Learn Unity"); //5
  app.add("Learn Unreal Engine"); //6
  app.add("learn Quantum Computing"); //7
  app.add("Learn Astrophysics"); //8


  app.show();
  //Remove astrophysics, OpenGL
  app.remove(8);
  app.remove(4);

  app.show();
}
