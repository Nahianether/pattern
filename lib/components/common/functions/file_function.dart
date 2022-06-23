import 'dart:io';

import 'package:flutter/material.dart';
import 'package:path/path.dart' as path;

Stream<FileSystemEvent> fileWatchHelper({String? getpath}) {
  // final dir = await getApplicationDocumentsDirectory();
  // final watch= dir.watch();
  // return StreamController<FileSystemEvent>();
  final watch = Directory(getpath ?? '').watch();
  return watch;
}

fileBackUp({String? getpath}) {
  Directory(getpath ?? '/home/jahid007/Projects').create(recursive: true);
}

Future<void> copyDirectory(Directory source, Directory destination) async {
  await for (var entity in source.list(recursive: false)) {
    if (entity is Directory) {
      debugPrint('Dircetory ${entity.path}');
      var newDirectory = Directory(
          path.join(destination.absolute.path, path.basename(entity.path)));
      await newDirectory.create();
      await copyDirectory(entity.absolute, newDirectory);
    } else if (entity is File) {
      debugPrint('file ${entity.path}');
      await entity
          .copy(path.join(destination.path, path.basename(entity.path)));
    }
  }
}