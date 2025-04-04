import 'dart:io';

void main() async {
  final file = File('packages.txt');

  if (await file.exists()) {
   final List<String> packages = await file.readAsLines();
    List<String> installedPackages = [];

    ProcessResult result = await Process.run('dart', ['pub', 'get']);
    if (result.exitCode == 0) {
      print('pub get completed successfully.');
    } else {
      print('pub get failed: ${result.stderr}');
    }
    // Get the list of installed packages 
    ProcessResult listResult = await Process.run('dart', ['pub', 'list']);
    if (listResult.exitCode == 0) {
      installedPackages = listResult.stdout.toString().split('\n');
    }

    int totalPackages = packages.length;
    int installedCount = 0;
    int skippedCount = 0;

    for (String package in packages) {
      package = package.trim();
      if (package.isNotEmpty) {
        if (!installedPackages.contains(package)) {
          installedCount++;
          stdout.write('\rInstalling: $package [$installedCount/$totalPackages]');
          ProcessResult result = await Process.run('dart', ['pub', 'add', package]);
          print('\n' + result.stdout);
          print(result.stderr);
        } else {
          skippedCount++;
          print('Skipping (already installed): $package');
        }
      }
    }
    // here Print the summary of the About for me Created and make name  like pices 
    print('\nTotal Packages: $totalPackages');
    print('Installed: $installedCount');
    print('Skipped: $skippedCount');
    aboutPrint();
    
  } else {
    print('packages.txt not found!');
  }
}
aboutPrint(){
  print(''.padLeft(50, '-'));
  print(''.padLeft(10) + 'About Package'.toUpperCase());
  print('Created by:'.padLeft(10) + 'MAHMOUD HAFEZ ELTARQI'.padLeft(25));
  print('This package allows you to install multiple packages in Flutter using a TXT file.');
  print(''.padLeft(50, '-'));
}