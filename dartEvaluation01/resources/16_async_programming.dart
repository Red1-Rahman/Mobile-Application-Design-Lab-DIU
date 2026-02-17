// Asynchronous Programming in Dart

import 'dart:async';

// Simple async function
Future<String> fetchUserData() async {
  print('Fetching user data...');
  await Future.delayed(Duration(seconds: 2));
  return 'User: John Doe';
}

// Async function with error
Future<int> calculateWithDelay(int a, int b) async {
  await Future.delayed(Duration(seconds: 1));
  if (b == 0) {
    throw Exception('Division by zero');
  }
  return a ~/ b;
}

// Multiple async operations
Future<void> fetchMultipleData() async {
  print('Starting multiple fetches...');
  
  Future<String> user = Future.delayed(
    Duration(seconds: 1),
    () => 'User Data',
  );
  
  Future<String> posts = Future.delayed(
    Duration(seconds: 2),
    () => 'Posts Data',
  );
  
  Future<String> comments = Future.delayed(
    Duration(seconds: 1),
    () => 'Comments Data',
  );
  
  // Wait for all futures to complete
  List<String> results = await Future.wait([user, posts, comments]);
  
  print('All data fetched:');
  for (var result in results) {
    print('  - $result');
  }
}

// Stream example
Stream<int> numberStream() async* {
  for (int i = 1; i <= 5; i++) {
    await Future.delayed(Duration(seconds: 1));
    yield i;
  }
}

// Stream with error handling
Stream<String> dataStream() async* {
  yield 'First';
  await Future.delayed(Duration(milliseconds: 500));
  yield 'Second';
  await Future.delayed(Duration(milliseconds: 500));
  throw Exception('Stream error!');
  yield 'Third'; // Won't be reached
}

// Transform stream
Stream<int> doubleNumbers(Stream<int> source) async* {
  await for (int value in source) {
    yield value * 2;
  }
}

// StreamController example
class CounterController {
  final StreamController<int> _controller = StreamController<int>();
  int _count = 0;
  
  Stream<int> get stream => _controller.stream;
  
  void increment() {
    _count++;
    _controller.add(_count);
  }
  
  void decrement() {
    _count--;
    _controller.add(_count);
  }
  
  void dispose() {
    _controller.close();
  }
}

// Broadcast stream
StreamController<String> createBroadcastStream() {
  return StreamController<String>.broadcast();
}

void main() async {
  print('=== Basic Async/Await ===');
  String userData = await fetchUserData();
  print('Received: $userData');
  
  // Future with then/catchError
  print('\n=== Future with then/catchError ===');
  fetchUserData()
      .then((data) => print('Then: $data'))
      .catchError((error) => print('Error: $error'));
  
  // Error handling in async
  print('\n=== Error Handling ===');
  try {
    int result = await calculateWithDelay(10, 0);
    print('Result: $result');
  } catch (e) {
    print('Caught error: $e');
  }
  
  // Multiple futures
  print('\n=== Multiple Futures ===');
  await fetchMultipleData();
  
  // Future.any
  print('\n=== Future.any ===');
  Future<String> fast = Future.delayed(Duration(seconds: 1), () => 'Fast');
  Future<String> slow = Future.delayed(Duration(seconds: 3), () => 'Slow');
  
  String first = await Future.any([fast, slow]);
  print('First to complete: $first');
  
  // Basic Stream
  print('\n=== Basic Stream ===');
  print('Number stream:');
  await for (int number in numberStream()) {
    print('  Received: $number');
  }
  
  // Stream with listen
  print('\n=== Stream with Listen ===');
  print('Listening to number stream:');
  
  StreamSubscription<int> subscription = numberStream().listen(
    (number) {
      print('  Number: $number');
    },
    onDone: () {
      print('  Stream completed');
    },
    onError: (error) {
      print('  Error: $error');
    },
  );
  
  // Wait for stream to complete
  await Future.delayed(Duration(seconds: 6));
  
  // Stream error handling
  print('\n=== Stream Error Handling ===');
  try {
    await for (String data in dataStream()) {
      print('  Data: $data');
    }
  } catch (e) {
    print('  Caught: $e');
  }
  
  // Transform stream
  print('\n=== Transform Stream ===');
  Stream<int> original = numberStream();
  Stream<int> doubled = doubleNumbers(original);
  
  print('Doubled numbers:');
  await for (int number in doubled) {
    print('  $number');
  }
  
  // StreamController
  print('\n=== StreamController ===');
  CounterController counter = CounterController();
  
  counter.stream.listen((count) {
    print('  Counter: $count');
  });
  
  counter.increment();
  counter.increment();
  counter.increment();
  counter.decrement();
  
  await Future.delayed(Duration(milliseconds: 100));
  counter.dispose();
  
  // Broadcast stream
  print('\n=== Broadcast Stream ===');
  StreamController<String> broadcast = createBroadcastStream();
  
  broadcast.stream.listen((data) {
    print('  Listener 1: $data');
  });
  
  broadcast.stream.listen((data) {
    print('  Listener 2: $data');
  });
  
  broadcast.add('Hello');
  broadcast.add('World');
  
  await Future.delayed(Duration(milliseconds: 100));
  broadcast.close();
  
  // Stream methods
  print('\n=== Stream Methods ===');
  Stream<int> nums = Stream.fromIterable([1, 2, 3, 4, 5]);
  
  List<int> list = await nums.toList();
  print('To list: $list');
  
  nums = Stream.fromIterable([1, 2, 3, 4, 5]);
  int sum = await nums.reduce((a, b) => a + b);
  print('Sum: $sum');
  
  nums = Stream.fromIterable([1, 2, 3, 4, 5]);
  bool hasEven = await nums.any((n) => n % 2 == 0);
  print('Has even: $hasEven');
  
  // Future timeout
  print('\n=== Future Timeout ===');
  try {
    await Future.delayed(Duration(seconds: 5))
        .timeout(Duration(seconds: 2));
  } on TimeoutException {
    print('Operation timed out!');
  }
  
  // Completer
  print('\n=== Completer ===');
  Completer<String> completer = Completer<String>();
  
  Future<String> operation = completer.future;
  
  operation.then((value) => print('Completed with: $value'));
  
  // Complete the future after delay
  Future.delayed(Duration(seconds: 1), () {
    completer.complete('Success!');
  });
  
  await Future.delayed(Duration(seconds: 2));
  
  print('\nAsync operations completed!');
}
