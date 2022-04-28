class OfferModel {
  final String? bank;
  final double? interestRate;
  final String? url;
  final double? annualRate;
  final int? bankId;

  OfferModel({
    this.interestRate,
    this.bank,
    this.url,
    this.annualRate,
    this.bankId,
  });
  factory OfferModel.fromJson(Map<String, dynamic> json) {
    return OfferModel(
      bank: json['bank'],
      annualRate: json['annual_rate'],
      interestRate: json['interest_rate'],
      url: json['url'],
      bankId: json['bank_id'],
    );
  }
}
