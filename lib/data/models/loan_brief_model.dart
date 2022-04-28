import 'dart:convert';
import 'offer_model.dart';

class LoanBriefModel {
  final int? amount;
  final int? maturity;
  final String? type;
  final int? offerCount;
  final int? totalOffers;
  final List<OfferModel>? offers;

  const LoanBriefModel({
    required this.amount,
    required this.maturity,
    required this.type,
    required this.offerCount,
    required this.offers,
    this.totalOffers,
  });

  LoanBriefModel copyWith(
      {int? amount,
      int? maturity,
      String? type,
      int? offerCount,
      List<OfferModel>? offers}) {
    return LoanBriefModel(
      amount: amount ?? this.amount,
      maturity: maturity ?? this.maturity,
      type: type ?? this.type,
      offerCount: offerCount ?? this.offerCount,
      offers: offers ?? this.offers,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'amount': amount,
      'maturity': maturity,
      'type': type,
      'offer_count': offerCount,
      'offers': offers,
    };
  }

  String toJson() => json.encode(toMap());

  factory LoanBriefModel.fromJson(Map<String, dynamic> json) {
    var list = json['offers'] as List;
    List<OfferModel> offersList =
        list.map((i) => OfferModel.fromJson(i)).toList();
    return LoanBriefModel(
        amount: json['amount'],
        maturity: json['maturity'],
        type: json['type'],
        offerCount: json['offer_count'],
        totalOffers: json['total_offers'],
        offers: offersList);
  }
}
