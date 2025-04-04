import 'package:equatable/equatable.dart';

abstract class SidebarState extends Equatable {
  final int index;
  const SidebarState({this.index = 0});
}
class InitialSidebarState extends SidebarState {
  const InitialSidebarState() : super(index: 0);
  
  @override
  List<Object> get props => [index];
}
class SidebarStateChanged extends SidebarState {
  const SidebarStateChanged({required super.index});
  
  @override
  List<Object> get props => [index];
}
class SidebarStateError extends SidebarState {
  const SidebarStateError({required super.index});
  
  @override
  List<Object> get props => [index];
}