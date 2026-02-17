// Enums in Dart

// Basic enum
enum Day {
  monday,
  tuesday,
  wednesday,
  thursday,
  friday,
  saturday,
  sunday
}

// Enum with enhanced features (Dart 2.17+)
enum Status {
  pending('Pending', '⏳'),
  processing('Processing', '🔄'),
  completed('Completed', '✅'),
  failed('Failed', '❌');
  
  const Status(this.label, this.icon);
  
  final String label;
  final String icon;
}

// Enum with methods
enum Season {
  spring,
  summer,
  autumn,
  winter;
  
  String get description {
    switch (this) {
      case Season.spring:
        return 'Flowers bloom';
      case Season.summer:
        return 'Hot and sunny';
      case Season.autumn:
        return 'Leaves fall';
      case Season.winter:
        return 'Cold and snowy';
    }
  }
  
  bool get isWarm => this == Season.spring || this == Season.summer;
}

// Enum for HTTP methods
enum HttpMethod {
  get,
  post,
  put,
  delete,
  patch;
  
  String get name {
    return toString().split('.').last.toUpperCase();
  }
}

// Enum for log levels
enum LogLevel {
  debug(1),
  info(2),
  warning(3),
  error(4),
  critical(5);
  
  const LogLevel(this.severity);
  final int severity;
  
  bool operator >(LogLevel other) => severity > other.severity;
  bool operator <(LogLevel other) => severity < other.severity;
}

void main() {
  print('=== Basic Enum ===');
  Day today = Day.monday;
  print('Today is: $today');
  print('Index: ${today.index}');
  
  // Enum values
  print('All days: ${Day.values}');
  
  // Enum comparison
  if (today == Day.monday) {
    print('Start of the work week!');
  }
  
  // Switch with enum
  print('\n=== Switch with Enum ===');
  Day day = Day.friday;
  
  switch (day) {
    case Day.monday:
    case Day.tuesday:
    case Day.wednesday:
    case Day.thursday:
      print('Weekday');
      break;
    case Day.friday:
      print('TGIF!');
      break;
    case Day.saturday:
    case Day.sunday:
      print('Weekend!');
      break;
  }
  
  // Enhanced enum with properties
  print('\n=== Enhanced Enum ===');
  Status currentStatus = Status.processing;
  print('Status: ${currentStatus.label} ${currentStatus.icon}');
  
  for (var status in Status.values) {
    print('${status.icon} ${status.label}');
  }
  
  // Enum with methods
  print('\n=== Enum with Methods ===');
  Season currentSeason = Season.summer;
  print('Current season: $currentSeason');
  print('Description: ${currentSeason.description}');
  print('Is warm: ${currentSeason.isWarm}');
  
  print('\nAll seasons:');
  for (var season in Season.values) {
    print('${season.name}: ${season.description} (Warm: ${season.isWarm})');
  }
  
  // HTTP methods enum
  print('\n=== HTTP Methods ===');
  HttpMethod method = HttpMethod.get;
  print('Method: ${method.name}');
  
  for (var m in HttpMethod.values) {
    print('${m.name}');
  }
  
  // Log levels with comparison
  print('\n=== Log Levels ===');
  LogLevel minLevel = LogLevel.warning;
  
  void log(LogLevel level, String message) {
    if (level >= minLevel) {
      print('[${level.name.toUpperCase()}] $message');
    }
  }
  
  log(LogLevel.debug, 'This is a debug message'); // Won't print
  log(LogLevel.info, 'This is an info message'); // Won't print
  log(LogLevel.warning, 'This is a warning'); // Will print
  log(LogLevel.error, 'This is an error'); // Will print
  log(LogLevel.critical, 'This is critical!'); // Will print
  
  // Iterating through enum values
  print('\n=== Iterating Enum Values ===');
  for (var day in Day.values) {
    print('${day.index}: ${day.name}');
  }
  
  // Enum from string
  print('\n=== Enum from String ===');
  String dayName = 'wednesday';
  Day parsedDay = Day.values.firstWhere(
    (d) => d.name == dayName,
    orElse: () => Day.monday,
  );
  print('Parsed day: $parsedDay');
  
  // Using enum in collections
  print('\n=== Enum in Collections ===');
  Map<Day, String> schedule = {
    Day.monday: 'Team meeting',
    Day.wednesday: 'Project review',
    Day.friday: 'Sprint planning',
  };
  
  for (var entry in schedule.entries) {
    print('${entry.key.name}: ${entry.value}');
  }
}
