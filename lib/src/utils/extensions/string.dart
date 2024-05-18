import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

extension StringX on String {
  String get toTitleCase {
    return replaceAll(RegExp(' +'), ' ').split(" ").map((str) {
      return "${str[0].toUpperCase()}${str.substring(1)}";
    }).join(" ");
  }

  String get toSentenceCase {
    return replaceAll(RegExp(' +'), ' ').split(".").map((str) {
      return "${str[0].toUpperCase()}${str.substring(1)}";
    }).join(".");
  }

  String get toSupabasePhaseQuery {
    return replaceAll(RegExp(' +'), '+');
  }

  int get daysFromTimeframe => switch (this) {
        '30days' => 30,
        '90days' => 90,
        'thisYear' => 365,
        _ => 30,
      };

  int get stringToInt => int.parse(this);

  double get removeExtraDecimalPoints {
    final splitted = split('.');
    if (splitted.length == 1) {
      return double.parse(this);
    } else if (splitted.length == 2) {
      return splitted[0].isEmpty
          ? double.parse(splitted[0])
          : double.parse(this);
    } else {
      return double.parse('${splitted[0]}.${splitted[1][0]}');
    }
  }

  String get reasonsForUnconfirmedDeliveryLabel => switch (this) {
        "not_delivered" => "Not Delivered",
        "wrong_product" => "Wrong Product Delivered",
        'wrong_quantity' => "Incorrect Quantity",
        "poor_quality" => "Unsatisfactory Quality",
        "other" => "Other Delivery Issues",
        _ => "Unconfirmed Delivery"
      };

  String get extractNumber {
    final numbers = RegExp(r'\d+');
    final number = numbers.firstMatch(this);
    return number?.group(0) ?? '1';
  }

  String get extractNonNumber {
    final numbers = RegExp(r'\D+');
    final match = numbers.firstMatch(this);
    return match?.group(0) ?? '';
  }

  String get intFromFloatString {
    return split('.').first;
  }

  String get listingCategoryStringToInt {
    return switch (this) {
      'buy listing' => '0',
      'sales listing' => '1',
      _ => '0',
    };
  }

  String get contractTypeToProposalType {
    return switch (this) {
      'sellerToBuyer' => 'sales_proposal',
      'buyerToSeller' => 'buy_proposal',
      _ => 'buy_proposal'
    };
  }

  String get contractTypeToProposalTypeNumber {
    return switch (this) {
      'sellerToBuyer' => '1',
      'buyerToSeller' => '0',
      _ => '0'
    };
  }

  Future<bool?> get showErrorToast {
    return Fluttertoast.showToast(
      msg: this,
      toastLength: Toast.LENGTH_LONG,
      gravity: ToastGravity.BOTTOM,
      timeInSecForIosWeb: 1,
      backgroundColor: Colors.red,
      textColor: Colors.white,
      fontSize: 16.0,
    );
  }

  Future<bool?> get showInfoToast {
    return Fluttertoast.showToast(
      msg: this,
      // toastLength: Toast.LENGTH_LONG,
      gravity: ToastGravity.BOTTOM,
      timeInSecForIosWeb: 1,
      // textColor: Colors.white,
      fontSize: 16.0,
    );
  }

  String get obscurePhoneNumber {
    return length > 6
        ? replaceRange(2, length - 4, '*****')
        : replaceRange(1, length - 2, '****');
  }

  String get transactionTypeToSymbol {
    return switch (toLowerCase()) {
      'withdrawal' => '-',
      'deposit' => '+',
      _ => ''
    };
  }
}
