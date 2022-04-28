import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/loan_brief_bloc.dart';
import '../data/data.dart';
import '../widgets/widgets.dart';

Widget resultView(BuildContext context, LoanBriefModel data) =>
    SingleChildScrollView(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(20),
            child: Text(
              "Teklifler",
              style: Theme.of(context).textTheme.headline3,
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Row(
                children: [
                  Icon(
                    Icons.monetization_on,
                    color: Colors.orange.shade900,
                  ),
                  Text(
                    " ${data.amount}₺",
                    style: Theme.of(context).textTheme.headline5,
                  ),
                ],
              ),
              Row(
                children: [
                  Icon(
                    Icons.access_time,
                    color: Colors.orange.shade900,
                  ),
                  Text(
                    " ${data.maturity} ay vade",
                    style: Theme.of(context).textTheme.headline5,
                  ),
                ],
              ),
            ],
          ),
          ListView.builder(
            itemCount: data.offers!.length,
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemBuilder: (context, index) => data.offers!.isEmpty
                ? const Text("Hiç teklif bulunamadı")
                : OfferCard(
                    data: data,
                    index: index,
                  ),
          ),
          Padding(
            padding: const EdgeInsets.all(20),
            child: Text("Toplam ${data.totalOffers} tane sonuç bulundu."),
          ),
          ElevatedButton(
            onPressed: () {
              BlocProvider.of<LoanBriefBloc>(context).add(ResetView());
            },
            child: const Padding(
              padding: EdgeInsets.all(20),
              child: Text("Yeniden Hesapla"),
            ),
          ),
        ],
      ),
    );
