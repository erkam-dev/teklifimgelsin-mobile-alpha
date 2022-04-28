part of 'loan_brief_bloc.dart';

enum LoanBriefStatus { initial, loading, success, failure }

abstract class LoanBriefState extends Equatable {
  const LoanBriefState();

  @override
  List<Object> get props => [];
}

class LoanBriefInitial extends LoanBriefState {}

class LoanBriefLoading extends LoanBriefState {}

class LoanBriefSuccess extends LoanBriefState {
  final LoanBriefModel data;

  const LoanBriefSuccess(this.data);
}

class LoanBriefError extends LoanBriefState {}
