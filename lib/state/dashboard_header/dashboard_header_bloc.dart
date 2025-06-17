
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:practice_desktop_app/config/models/dashboard_header_model.dart';

part 'dashboard_header_event.dart';
part 'dashboard_header_state.dart';

class DashboardHeaderBloc extends Bloc<DashboardHeaderEvent, DashboardHeaderState>{
  DashboardHeaderBloc () : super(HeaderInitial()){
    on<AddHeader>(_addHeader);
    on<LoadHeader> (_loadHeader);
  }

  void _addHeader (AddHeader event, Emitter<DashboardHeaderState> emit){

    final List<DashBoardHeaderModel> dashBoardHeader = [
      DashBoardHeaderModel(title: 'Total income', profit: 342.247, profitOrLoss: '6.5% since last week', icon: Icons.monetization_on),
      DashBoardHeaderModel(title: 'Total outcome', profit: 232.247, profitOrLoss: '2.5% since last week', icon: Icons.monetization_on),
      DashBoardHeaderModel(title: 'pay per order', profit: 642.247, profitOrLoss: '4.5% since last week', icon: Icons.monetization_on),
      DashBoardHeaderModel(title: 'customers', profit: 122.247, profitOrLoss: '8.5% since last week', icon: Icons.monetization_on),
    ];
    emit(HeaderLoaded(dashBoardHeader));
  }

  void _loadHeader (LoadHeader event, Emitter<DashboardHeaderState> emit){
    if (state is HeaderLoaded){
      final List<DashBoardHeaderModel> updatedHeader = List.from((state as HeaderLoaded).headers)..add(event.header);
      emit(HeaderLoaded(updatedHeader));
    }
  }
}