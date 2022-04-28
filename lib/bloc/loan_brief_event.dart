part of 'loan_brief_bloc.dart';

abstract class LoanBriefEvent extends Equatable {
  const LoanBriefEvent();

  @override
  List<Object> get props => [];
}

class PostLoanBrief extends LoanBriefEvent {
  final int amount;
  final int maturity;
  final int type = 0;
  final int offerCount = 3;

  const PostLoanBrief({
    required this.amount,
    required this.maturity,
  });
}

class ResetView extends LoanBriefEvent {}
