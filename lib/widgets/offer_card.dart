import 'dart:math';

import 'package:flutter/material.dart';
import 'package:teklifim_gelsin/widgets/detailed_offer_card.dart';

import '../data/data.dart';

const String bankIconPath = 'assets/images/bank_icons/';

class OfferCard extends StatefulWidget {
  final LoanBriefModel data;
  final int index;
  const OfferCard({
    Key? key,
    required this.data,
    required this.index,
  }) : super(key: key);

  @override
  State<OfferCard> createState() => _OfferCardState();
}

class _OfferCardState extends State<OfferCard> {
  double? interestRate;
  int? amount;
  int? maturity;
  late String bankName;
  double? totalInterestRate;
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
  }

  @override
  Widget build(BuildContext context) {
    String bankName = widget.data.offers![widget.index].bank!.toLowerCase();
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          HeroDialogRoute(
            builder: (context) =>
                DetailedOfferCard(data: widget.data, index: widget.index),
          ),
        );
      },
      child: Hero(
        tag: widget.index,
        child: Material(
          shape: Theme.of(context).cardTheme.shape,
          clipBehavior: Clip.antiAlias,
          child: Card(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Image.asset(
                    bankIconPath + bankName + '.png',
                    width: 50,
                  ),
                  Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        widget.data.offers![widget.index].bank!,
                        style: Theme.of(context).textTheme.headline4,
                      ),
                      const Text(
                        "Aylık Taksit ",
                      ),
                      Text(
                        monthlyPayment!.round().toString() + '₺',
                        style: Theme.of(context).textTheme.headline6,
                      ),
                    ],
                  ),
                  const Icon(Icons.navigate_next)
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
