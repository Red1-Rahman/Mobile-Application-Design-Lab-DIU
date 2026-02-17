// File Operations in Dart

import 'dart:io';

void main() async {
  print('=== File Operations in Dart ===\n');
  
  // Define file paths
  String textFilePath = 'example.txt';
  String dataFilePath = 'data.txt';
  String dirPath = 'test_directory';
  
  // 1. Writing to a file
  print('=== Writing to File ===');
  File file = File(textFilePath);
  
  // Write string
  await file.writeAsString('Hello, Dart!\nThis is a test file.\n');
  print('Written to $textFilePath');
  
  // Append to file
  await file.writeAsString('Appended line.\n', mode: FileMode.append);
  print('Appended to $textFilePath');
  
  // Write lines
  List<String> lines = [
    'Line 1',
    'Line 2',
    'Line 3',
  ];
  await File(dataFilePath).writeAsString(lines.join('\n'));
  print('Written lines to $dataFilePath');
  
  // 2. Reading from a file
  print('\n=== Reading from File ===');
  
  // Read as string
  String content = await file.readAsString();
  print('File content:\n$content');
  
  // Read as lines
  List<String> fileLines = await file.readAsLines();
  print('Number of lines: ${fileLines.length}');
  for (int i = 0; i < fileLines.length; i++) {
    print('Line ${i + 1}: ${fileLines[i]}');
  }
  
  // Read as bytes
  List<int> bytes = await file.readAsBytes();
  print('File size: ${bytes.length} bytes');
  
  // 3. File properties
  print('\n=== File Properties ===');
  print('File path: ${file.path}');
  print('Absolute path: ${file.absolute.path}');
  print('File exists: ${await file.exists()}');
  
  FileStat stats = await file.stat();
  print('File size: ${stats.size} bytes');
  print('Modified: ${stats.modified}');
  print('Accessed: ${stats.accessed}');
  print('Type: ${stats.type}');
  
  // 4. Checking file existence
  print('\n=== File Existence ===');
  File newFile = File('nonexistent.txt');
  if (await newFile.exists()) {
    print('File exists');
  } else {
    print('File does not exist');
    await newFile.writeAsString('Creating new file');
    print('File created');
  }
  
  // 5. Copying files
  print('\n=== Copying Files ===');
  File copiedFile = await file.copy('example_copy.txt');
  print('File copied to: ${copiedFile.path}');
  
  // 6. Renaming/Moving files
  print('\n=== Renaming Files ===');
  File renamedFile = await copiedFile.rename('example_renamed.txt');
  print('File renamed to: ${renamedFile.path}');
  
  // 7. Directory operations
  print('\n=== Directory Operations ===');
  Directory dir = Directory(dirPath);
  
  if (await dir.exists()) {
    print('Directory exists');
  } else {
    await dir.create();
    print('Directory created: ${dir.path}');
  }
  
  // Create file in directory
  File fileInDir = File('$dirPath/file_in_dir.txt');
  await fileInDir.writeAsString('File inside directory');
  print('Created file: ${fileInDir.path}');
  
  // List directory contents
  print('\n=== Listing Directory Contents ===');
  await for (FileSystemEntity entity in dir.list()) {
    print('${entity.path} (${entity is File ? "File" : "Directory"})');
  }
  
  // 8. Reading file synchronously (blocking)
  print('\n=== Synchronous Operations ===');
  File syncFile = File(textFilePath);
  String syncContent = syncFile.readAsStringSync();
  print('Sync read (first 50 chars): ${syncContent.substring(0, 50)}...');
  
  // 9. Stream reading (for large files)
  print('\n=== Stream Reading ===');
  Stream<List<int>> inputStream = file.openRead();
  int totalBytes = 0;
  
  await for (List<int> chunk in inputStream) {
    totalBytes += chunk.length;
  }
  print('Total bytes read via stream: $totalBytes');
  
  // 10. File write stream
  print('\n=== Stream Writing ===');
  File streamFile = File('stream_output.txt');
  IOSink sink = streamFile.openWrite();
  
  sink.write('Written via stream\n');
  sink.writeln('Another line');
  sink.writeAll(['Item 1', 'Item 2', 'Item 3'], ', ');
  
  await sink.flush();
  await sink.close();
  print('Stream write completed');
  
  // 11. Temporary files
  print('\n=== Temporary Files ===');
  Directory tempDir = Directory.systemTemp;
  File tempFile = File('${tempDir.path}/temp_${DateTime.now().millisecondsSinceEpoch}.txt');
  await tempFile.writeAsString('Temporary data');
  print('Temp file created: ${tempFile.path}');
  
  // 12. Error handling
  print('\n=== Error Handling ===');
  try {
    File nonExistent = File('does_not_exist.txt');
    await nonExistent.readAsString();
  } on FileSystemException catch (e) {
    print('File error: ${e.message}');
  } catch (e) {
    print('Error: $e');
  }
  
  // Cleanup
  print('\n=== Cleanup ===');
  await file.delete();
  await File(dataFilePath).delete();
  await newFile.delete();
  await renamedFile.delete();
  await streamFile.delete();
  await tempFile.delete();
  await dir.delete(recursive: true);
  
  print('Temporary files cleaned up');
  print('\nFile operations completed!');
}
