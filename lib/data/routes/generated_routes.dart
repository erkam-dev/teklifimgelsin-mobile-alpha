import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:teklifim_gelsin/bloc/loan_brief_bloc.dart';

import '../../data/repository/loan_brief_repo.dart';
import '../../views/views.dart';

class RouteGenerator {
  final LoanBriefBloc _loanBriefBloc = LoanBriefBloc(LoanBriefRepo());

  Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case '/':
        return MaterialPageRoute(
          builder: (context) => BlocProvider<LoanBriefBloc>.value(
            value: _loanBriefBloc,
            child: const Home(),
          ),
        );
      default:
        return _errorRoute();
    }
  }

  static Route<dynamic> _errorRoute() {
    return MaterialPageRoute(
      builder: (context) => Scaffold(
        appBar: AppBar(title: const Text("Böyle bir sayfa bulunamadı")),
        body: const Center(
          child: Text(
              "Uygulamada böyle bir sayfa bulunamadı\nLütfen yeniden deneyin"),
        ),
      ),
    );
  }
}
