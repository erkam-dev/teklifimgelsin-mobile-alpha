import 'package:flutter/material.dart';

import '../widgets/widgets.dart';

Widget searchView(
  BuildContext context,
  FocusNode amountFocus,
  TextEditingController amountController,
  FocusNode maturityFocus,
  TextEditingController maturityController,
  FocusNode searchButtonFocus,
) =>
    Center(
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "İhtiyaç Kredisi",
              style: Theme.of(context).textTheme.headline3,
            ),
            const SizedBox(height: 50),
            TgTextField(
              label: const Text("Kredi Miktarı"),
              prefixText: "₺ ",
              maxLength: 6,
              focusNode: amountFocus,
              textEditingController: amountController,
            ),
            TgTextField(
              label: const Text("Vade Süresi"),
              maxLength: 2,
              focusNode: maturityFocus,
              textEditingController: maturityController,
            ),
            const SizedBox(height: 50),
            TgGetOfferButton(
              context: context,
              amountController: amountController,
              amountFocus: amountFocus,
              maturityController: maturityController,
              maturityFocus: maturityFocus,
              searchButtonFocus: searchButtonFocus,
            ),
          ],
        ),
      ),
    );
