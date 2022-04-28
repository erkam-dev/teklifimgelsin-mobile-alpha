import 'dart:convert';
import 'package:http/http.dart' as http;

import '../data.dart';

abstract class LoanBriefRepository {
  Future<LoanBriefModel> postDetails(
    int amount,
    int maturity,
    int type,
    int offerCount,
  );
}

class LoanBriefRepo extends LoanBriefRepository {
  @override
  Future<LoanBriefModel> postDetails(
      int amount, int maturity, int type, int offerCount) async {
    final response = await http.post(
      Uri.parse(apiUrl),
      headers: <String, String>{
        'content-type': 'application/json',
      },
      body: jsonEncode(<String, dynamic>{
        'amount': amount,
        'maturity': maturity,
        'type': type,
        'offer_count': offerCount
      }),
    );

    if (response.statusCode == 200) {
      return LoanBriefModel.fromJson(
        jsonDecode(response.body),
      );
    } else {
      throw Exception('Teklif Oluşturulamadı.');
    }
  }
}
