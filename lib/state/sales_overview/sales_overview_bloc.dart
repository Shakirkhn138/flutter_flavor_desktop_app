import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';
import 'package:practice_desktop_app/config/models/sales_overview_model.dart';

part 'sales_overview_event.dart';
part 'sales_overview_state.dart';

class SalesOverviewBloc extends Bloc<SalesOverviewEvent, SalesOverviewState>{
  SalesOverviewBloc () : super(SalesInitial()){
    on<LoadSales>(_loadSales);
    on<AddSales>(_addSales);
  }
  
  void _loadSales (LoadSales event, Emitter<SalesOverviewState> emit){
    final List<SalesOverviewModel> salesOverview = [
      SalesOverviewModel(icon: Icons.incomplete_circle_outlined, money: 832, title: 'sales'),
      SalesOverviewModel(icon: Icons.incomplete_circle_outlined, money: 832, title: 'Revenue'),
      SalesOverviewModel(icon: Icons.incomplete_circle_outlined, money: 832, title: 'Profit'),
      SalesOverviewModel(icon: Icons.incomplete_circle_outlined, money: 832, title: 'Cost'),
    ];
    emit(SalesLoaded(salesOverview));
  }

  void _addSales (AddSales event, Emitter<SalesOverviewState> emit){
    if (state is SalesLoaded){
      final List<SalesOverviewModel> updatedSales = List.from((state as SalesLoaded).sales)..add(event.sale);
      emit(SalesLoaded(updatedSales));
    }
  }
}