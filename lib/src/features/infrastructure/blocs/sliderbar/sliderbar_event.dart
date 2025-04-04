import 'package:meta/meta.dart';

@immutable
abstract class SidebarEvent {
  const SidebarEvent();
}

class ChangeScreenEvent extends SidebarEvent {
  final int index;
  const ChangeScreenEvent(this.index);
}


