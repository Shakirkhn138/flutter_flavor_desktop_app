part of 'dashboard_header_bloc.dart';

abstract class DashboardHeaderState extends Equatable {
  const DashboardHeaderState ();

  @override
  List<Object> get props => [];
}

class HeaderInitial extends DashboardHeaderState {}

class HeaderLoading extends DashboardHeaderState {}

class HeaderLoaded extends DashboardHeaderState {
  final List<DashBoardHeaderModel> headers;
  const HeaderLoaded (this.headers);

  @override
  List<Object> get props => [headers];
}

class HeaderError extends DashboardHeaderState {
  final String error;
  const HeaderError (this.error);

  @override
  List<Object> get props => [error];
}
