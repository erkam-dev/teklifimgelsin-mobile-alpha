import 'dart:math';
import 'package:flutter/material.dart';
import '../data/data.dart';
import 'widgets.dart';

class DetailedOfferCard extends StatefulWidget {
  final LoanBriefModel data;
  final int index;
  const DetailedOfferCard({
    Key? key,
    required this.data,
    required this.index,
  }) : super(key: key);

  @override
  State<DetailedOfferCard> createState() => _DetailedOfferCardState();
}

class _DetailedOfferCardState extends State<DetailedOfferCard> {
  double? interestRate;
  int? amount;
  int? maturity;
  late String bankName;
  double? totalInterestRate;
  double? totalDebt;
  double? monthlyPayment;

  @override
  void initState() {
    super.initState();
    interestRate = widget.data.offers![widget.index].interestRate!;
    amount = widget.data.amount;
    maturity = widget.data.maturity;
    bankName = widget.data.offers![widget.index].bank!;
    totalInterestRate = interestRate! * 0.012;
    monthlyPayment = (amount! *
            totalInterestRate! *
            pow((1 + totalInterestRate!), maturity!)) /
        (pow((1 + totalInterestRate!), maturity!) - 1);
    totalDebt = monthlyPayment! * maturity!.toDouble();
  }

  @override
  Widget build(BuildContext context) {
    final Size screenSize = MediaQuery.of(context).size;
    return Align(
      alignment: Alignment.center,
      child: Hero(
        tag: widget.index,
        child: Material(
          shape: Theme.of(context).cardTheme.shape,
          child: ConstrainedBox(
            constraints: BoxConstraints(
              maxHeight: screenSize.height / 1.5,
              maxWidth: screenSize.width / 1.2,
              minWidth: screenSize.width / 1.5,
            ),
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Image.asset(
                      bankIconPath + bankName.toLowerCase() + '.png',
                      height: 100,
                    ),
                    Text(
                      bankName,
                      style: Theme.of(context).textTheme.headline4,
                    ),
                    ListTile(
                      title: const Text(
                        "Tutar",
                      ),
                      trailing: Text(
                        amount.toString() + '₺',
                        style: Theme.of(context).textTheme.headline6,
                      ),
                    ),
                    ListTile(
                      title: const Text(
                        "Vade",
                      ),
                      trailing: Text(
                        maturity.toString() + ' Ay',
                        style: Theme.of(context).textTheme.headline6,
                      ),
                    ),
                    ListTile(
                      title: const Text(
                        "Aylık taksit",
                      ),
                      trailing: Text(
                        monthlyPayment!.round().toString() + '₺',
                        style: Theme.of(context).textTheme.headline6,
                      ),
                    ),
                    ListTile(
                      title: const Text(
                        "Faiz Oranı",
                      ),
                      trailing: Text(
                        '%' + interestRate.toString(),
                        style: Theme.of(context).textTheme.headline6,
                      ),
                    ),
                    ListTile(
                      title: const Text(
                        "Maliyet",
                      ),
                      trailing: Text(
                        totalDebt!.round().toString() + '₺',
                        style: Theme.of(context).textTheme.headline6,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
