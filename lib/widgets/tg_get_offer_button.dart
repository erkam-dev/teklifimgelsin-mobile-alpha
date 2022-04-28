import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/loan_brief_bloc.dart';
import '../data/constants/alert_messages.dart';

class TgGetOfferButton extends StatelessWidget {
  final BuildContext context;
  final TextEditingController amountController;
  final TextEditingController maturityController;
  final FocusNode? amountFocus;
  final FocusNode? maturityFocus;
  final FocusNode? searchButtonFocus;

  const TgGetOfferButton({
    Key? key,
    required this.amountController,
    required this.maturityController,
    this.amountFocus,
    this.maturityFocus,
    this.searchButtonFocus,
    required this.context,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      child: const Padding(
        padding: EdgeInsets.all(20.0),
        child: Text("TeklifimGelsin"),
      ),
      onPressed: () {
        if (amountController.text.isEmpty || maturityController.text.isEmpty) {
          return;
        } else if (int.parse(amountController.text) == 0 ||
            int.parse(maturityController.text) == 0) {
          return;
        } else if (int.parse(amountController.text) > 50000 &&
            int.parse(maturityController.text) > 24) {
          showDialog(
            context: context,
            builder: (_) => AlertDialog(
              title: const Text("Teklif Bulunamadı"),
              content: Text(bigOfferErrorMessage),
              actions: [
                TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: const Text("Tamam"),
                ),
              ],
            ),
          );
        } else {
          BlocProvider.of<LoanBriefBloc>(context).add(
            PostLoanBrief(
              amount: int.parse(amountController.text),
              maturity: int.parse(maturityController.text),
            ),
          );
        }
      },
      focusNode: searchButtonFocus,
    );
  }
}
