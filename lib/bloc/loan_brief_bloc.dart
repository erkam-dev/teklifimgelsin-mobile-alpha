import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../data/data.dart';

part 'loan_brief_event.dart';
part 'loan_brief_state.dart';

class LoanBriefBloc extends Bloc<LoanBriefEvent, LoanBriefState> {
  late LoanBriefModel data;
  final LoanBriefRepo loanBriefRepo;

  LoanBriefBloc(this.loanBriefRepo) : super(LoanBriefInitial()) {
    on<LoanBriefEvent>((event, emit) async {
      if (event is PostLoanBrief) {
        emit(LoanBriefLoading());
        await Future.delayed(const Duration(milliseconds: 200), () async {
          data = await loanBriefRepo.postDetails(
              event.amount, event.maturity, 0, 3);
          emit(LoanBriefSuccess(data));
        });
      } else if (event is ResetView) {
        emit(LoanBriefInitial());
      }
    });
  }
}
