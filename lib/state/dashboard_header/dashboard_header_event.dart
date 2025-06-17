part of 'dashboard_header_bloc.dart';

abstract class DashboardHeaderEvent extends Equatable  {
  const DashboardHeaderEvent();

  @override
  List<Object> get props => [];
}

class AddHeader extends DashboardHeaderEvent {}

class LoadHeader extends DashboardHeaderEvent {
  final DashBoardHeaderModel header;
  const LoadHeader (this.header);

  @override
  List<Object> get props => [header];
}