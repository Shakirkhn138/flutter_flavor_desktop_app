import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:practice_desktop_app/config/models/setting_table_model.dart';

part 'setting_table_event.dart';
part 'setting_table_state.dart';

class SettingTableBloc extends Bloc<SettingTableEvent, SettingTableState> {
  SettingTableBloc() : super(SettingTableInitial()) {
    on<LoadSettingTable>(_loadTable);
    on<AddSettingTable>(_addTable);
  }

  void _loadTable (LoadSettingTable event , Emitter<SettingTableState> emit){
    final List<SettingTableModel> employee = [
      SettingTableModel(
        image: 'assets/images/profile.jpg',
        name: 'Luca Romano',
        email: 'luca.romano@cafeapp.com',
        payroll: 'CAFE1023LR',
        department: 'Barista',
        role: 'Lead Barista',
        joiningDate: 'Jan 10, 2024',
        contractType: 'Full-time',
      ),
      SettingTableModel(
        image: 'assets/images/profile.jpg',
        name: 'Sophie Müller',
        email: 'sophie.muller@cafeapp.com',
        payroll: 'CAFE2391SM',
        department: 'Bakery',
        role: 'Pastry Chef',
        joiningDate: 'Mar 15, 2023',
        contractType: 'Full-time',
      ),
      SettingTableModel(
        image: 'assets/images/profile.jpg',
        name: 'Jean Dubois',
        email: 'jean.dubois@cafeapp.com',
        payroll: 'CAFE7862JD',
        department: 'Kitchen',
        role: 'Head Chef',
        joiningDate: 'May 01, 2022',
        contractType: 'Full-time',
      ),
      SettingTableModel(
        image: 'assets/images/profile.jpg',
        name: 'Anna Nowak',
        email: 'anna.nowak@cafeapp.com',
        payroll: 'CAFE1122AN',
        department: 'Customer Service',
        role: 'Front Desk',
        joiningDate: 'Jun 18, 2024',
        contractType: 'Part-time',
      ),
      SettingTableModel(
        image: 'assets/images/profile.jpg',
        name: 'Mateo García',
        email: 'mateo.garcia@cafeapp.com',
        payroll: 'CAFE4455MG',
        department: 'Cleaning',
        role: 'Cleaning Staff',
        joiningDate: 'Apr 03, 2023',
        contractType: 'Full-time',
      ),
      SettingTableModel(
        image: 'assets/images/profile.jpg',
        name: 'Isabelle Lefevre',
        email: 'isabelle.lefevre@cafeapp.com',
        payroll: 'CAFE9911IL',
        department: 'Bakery',
        role: 'Assistant Baker',
        joiningDate: 'Feb 25, 2024',
        contractType: 'Internship',
      ),
      SettingTableModel(
        image: 'assets/images/profile.jpg',
        name: 'Tomáš Novák',
        email: 'tomas.novak@cafeapp.com',
        payroll: 'CAFE7733TN',
        department: 'Barista',
        role: 'Junior Barista',
        joiningDate: 'Jul 30, 2022',
        contractType: 'Full-time',
      ),
      SettingTableModel(
        image: 'assets/images/profile.jpg',
        name: 'Eva Rossi',
        email: 'eva.rossi@cafeapp.com',
        payroll: 'CAFE5522ER',
        department: 'Customer Service',
        role: 'Waitress',
        joiningDate: 'Aug 12, 2023',
        contractType: 'Part-time',
      ),
      SettingTableModel(
        image: 'assets/images/profile.jpg',
        name: 'Marek Kowalski',
        email: 'marek.kowalski@cafeapp.com',
        payroll: 'CAFE8822MK',
        department: 'Finance',
        role: 'Accountant',
        joiningDate: 'Sep 05, 2021',
        contractType: 'Full-time',
      ),
      SettingTableModel(
        image: 'assets/images/profile.jpg',
        name: 'Elena Petrov',
        email: 'elena.petrova@cafeapp.com',
        payroll: 'CAFE3344EP',
        department: 'Kitchen',
        role: 'Sous Chef',
        joiningDate: 'Oct 22, 2022',
        contractType: 'Contract',
      ),
    ];
    emit(SettingTableLoaded(employee));
  }

  void _addTable (AddSettingTable event, Emitter<SettingTableState> emit){
    if (state is SettingTableLoaded){
      final List<SettingTableModel> updatedSettingTable = List.from((state as SettingTableLoaded).employees)..add(event.employee);
      emit(SettingTableLoaded(updatedSettingTable));
    }
  }
}
