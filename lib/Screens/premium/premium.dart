import 'package:fad_quizapp/constants.dart';
import 'package:flutter/material.dart';

class PremiumScreen extends StatefulWidget {
  @override
  _PremiumScreenState createState() => _PremiumScreenState();
}

class _PremiumScreenState extends State<PremiumScreen> {
  int selectedIndex;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kPrimaryColor,
      appBar: AppBar(
        centerTitle: true,
        elevation: 0.0,
        title: Text(
          'Premium',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
      body: LayoutBuilder(builder: (context, viewportConstraints) {
        return SingleChildScrollView(
          child: ConstrainedBox(
            constraints: BoxConstraints(
              minHeight: viewportConstraints.maxHeight,
            ),
            child: IntrinsicHeight(
              child: Container(
                child: Form(
                  child: Column(
                    children: [
                      Spacer(),
                      Expanded(
                        flex: 20,
                        child: Container(
                          decoration: BoxDecoration(
                            color: kPrimaryLightColor,
                            borderRadius:
                                BorderRadius.vertical(top: Radius.circular(30)),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              SizedBox(height: 20),
                              PaymentOption(
                                paymentType: 'Monthly',
                                paymentDesc: 'Pay Monthly, Cancel Anytime',
                                price: 500,
                                paymentDuration: '/m',
                                paymentOptionIndex: 0,
                                selectedOptionIndex: selectedIndex,
                                onTap: () => setState(() => selectedIndex = 0),
                              ),
                              PaymentOption(
                                paymentType: 'Yearly',
                                paymentDesc: 'Pay for a full year',
                                price: 4000,
                                paymentDuration: '/yr',
                                paymentOptionIndex: 1,
                                selectedOptionIndex: selectedIndex,
                                onTap: () => setState(() => selectedIndex = 1),
                              ),
                              SizedBox(height: 10),
                              Divider(color: Colors.blueGrey),
                              Padding(
                                padding: EdgeInsets.all(15),
                                child: Text(
                                  'Payment Details',
                                  style: TextStyle(
                                    fontSize: 22,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.symmetric(
                                    vertical: 10, horizontal: 15),
                                child: Text(
                                  'Card Number',
                                  style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.symmetric(
                                    vertical: 10, horizontal: 15),
                                child: TextField(
                                  onEditingComplete: () =>
                                      FocusScope.of(context).nextFocus(),
                                  keyboardType: TextInputType.number,
                                  cursorColor: kSecondaryColor,
                                  decoration: kinputDecoration,
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.symmetric(
                                    vertical: 10, horizontal: 15),
                                child: Text(
                                  'Card Holder\'s Name',
                                  style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.symmetric(
                                    vertical: 10, horizontal: 15),
                                child: TextField(
                                  onEditingComplete: () =>
                                      FocusScope.of(context).nextFocus(),
                                  cursorColor: kSecondaryColor,
                                  decoration: kinputDecoration.copyWith(
                                      hintText: 'Wood Smith'),
                                ),
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Expanded(
                                    flex: 2,
                                    child: Padding(
                                      padding: EdgeInsets.symmetric(
                                          vertical: 0, horizontal: 15),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Padding(
                                            padding: EdgeInsets.symmetric(
                                                vertical: 10, horizontal: 0),
                                            child: Text(
                                              'CVV',
                                              style: TextStyle(
                                                fontSize: 18,
                                                fontWeight: FontWeight.w500,
                                              ),
                                            ),
                                          ),
                                          TextField(
                                            onEditingComplete: () =>
                                                FocusScope.of(context)
                                                    .nextFocus(),
                                            keyboardType: TextInputType.number,
                                            textAlign: TextAlign.center,
                                            cursorColor: kSecondaryColor,
                                            decoration: kinputDecoration
                                                .copyWith(hintText: '283'),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  Spacer(),
                                  Expanded(
                                    flex: 3,
                                    child: Padding(
                                      padding: EdgeInsets.symmetric(
                                          vertical: 0, horizontal: 15),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Padding(
                                            padding: EdgeInsets.symmetric(
                                                vertical: 10, horizontal: 0),
                                            child: Text(
                                              'Expiry Date',
                                              style: TextStyle(
                                                fontSize: 18,
                                                fontWeight: FontWeight.w500,
                                              ),
                                            ),
                                          ),
                                          TextField(
                                            onEditingComplete: () =>
                                                FocusScope.of(context)
                                                    .nextFocus(),
                                            keyboardType: TextInputType.number,
                                            cursorColor: kSecondaryColor,
                                            decoration: kinputDecoration
                                                .copyWith(hintText: '03/21'),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              Container(
                                height: 50,
                                width: double.maxFinite,
                                margin: EdgeInsets.symmetric(
                                    vertical: 20, horizontal: 30),
                                alignment: Alignment.center,
                                decoration: BoxDecoration(
                                  color: kPrimaryColor,
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: Text(
                                  'Make Payment',
                                  style: TextStyle(
                                    fontSize: 22,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                              ),
                              // SizedBox(height: 20),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        );
      }),
    );
  }
}

class PaymentOption extends StatelessWidget {
  final String paymentType;
  final String paymentDesc;
  final int price;
  final String paymentDuration;
  final int paymentOptionIndex;
  final int selectedOptionIndex;
  final Function onTap;

  const PaymentOption({
    Key key,
    @required this.price,
    @required this.paymentType,
    @required this.paymentDuration,
    @required this.paymentDesc,
    @required this.paymentOptionIndex,
    @required this.selectedOptionIndex,
    @required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        height: 60,
        padding: EdgeInsets.all(10),
        margin: EdgeInsets.only(left: 30, right: 30, top: 10, bottom: 10),
        decoration: BoxDecoration(
          color: selectedOptionIndex == paymentOptionIndex
              ? Colors.grey[200]
              : kPrimaryLightColor,
          border: Border.all(
              color: selectedOptionIndex == paymentOptionIndex
                  ? Colors.blueGrey
                  : Colors.grey[300]),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Row(
          children: [
            selectedOptionIndex == paymentOptionIndex
                ? Icon(Icons.check_circle, size: 15)
                : Container(
                    height: 12,
                    width: 12,
                    decoration: BoxDecoration(
                        color: kPrimaryLightColor,
                        borderRadius: BorderRadius.circular(1000000),
                        border: Border.all(color: kSecondaryColor)),
                  ),
            Spacer(),
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  paymentType,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.blueGrey[800],
                    fontSize: 17,
                  ),
                ),
                Text(
                  paymentDesc,
                  style: TextStyle(
                    color: Colors.grey,
                    fontSize: 10,
                  ),
                ),
              ],
            ),
            Spacer(flex: 7),
            RichText(
              text: TextSpan(children: [
                TextSpan(
                  text: 'N$price',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.blueGrey[800],
                    fontSize: 20,
                  ),
                ),
                TextSpan(
                  text: paymentDuration,
                  style: TextStyle(
                    color: Colors.grey,
                    fontSize: 10,
                  ),
                ),
              ]),
            )
          ],
        ),
      ),
    );
  }
}

InputDecoration kinputDecoration = InputDecoration(
  hintText: 'xxxx xxxx xxxx xxxx'.toUpperCase(),
  focusedBorder: OutlineInputBorder(
    borderRadius: BorderRadius.circular(10),
    borderSide: BorderSide(
      color: kSecondaryColor,
      width: 2,
    ),
  ),
  contentPadding: EdgeInsets.symmetric(vertical: 10, horizontal: 16),
  enabledBorder: OutlineInputBorder(
    borderRadius: BorderRadius.circular(10),
    borderSide: BorderSide(
      color: kSecondaryColor,
      width: 2,
    ),
  ),
);
