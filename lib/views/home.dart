import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:teklifim_gelsin/bloc/loan_brief_bloc.dart';
import 'package:teklifim_gelsin/views/views.dart';
import 'package:teklifim_gelsin/widgets/widgets.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  late FocusNode amountFocus;
  late FocusNode maturityFocus;
  late FocusNode searchButtonFocus;
  late TextEditingController amountController;
  late TextEditingController maturityController;

  @override
  void initState() {
    super.initState();
    amountFocus = FocusNode();
    maturityFocus = FocusNode();
    searchButtonFocus = FocusNode();
    amountController = TextEditingController();
    maturityController = TextEditingController();
  }

  @override
  void dispose() {
    amountFocus.dispose();
    maturityFocus.dispose();
    searchButtonFocus.dispose();
    amountController.dispose();
    maturityController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: tgAppBar(context),
      body: BlocConsumer<LoanBriefBloc, LoanBriefState>(
        listener: (context, state) {},
        builder: (context, state) {
          if (state is LoanBriefSuccess) {
            return resultView(context, state.data);
          } else if (state is LoanBriefLoading) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is LoanBriefError) {
            return const Center(child: Text("Hata meydana geldi"));
          } else {
            return searchView(
              context,
              amountFocus,
              amountController,
              maturityFocus,
              maturityController,
              searchButtonFocus,
            );
          }
        },
      ),
    );
  }
}
