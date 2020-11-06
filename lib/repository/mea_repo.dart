import 'package:fluttertui_app/models/mea.dart';
import 'package:fluttertui_app/networking_bot/apiProvider.dart';

import 'dart:async';

class MeaRepository {
  ApiProvider _provider = ApiProvider();

  Future<Mea> fetchMea() async {

    const route = "/fastapi_mea/";

    // INPUT into MEA is QEA outpt
    Map<String, dynamic> payLoadMap = {
      "username": "GeeVee",
      "qeaAdvice": {
        "agent": "Quant Engine Agent (QEA)",
        "advice": "switch",
        "signal": {
          "action": "switch",
          "sell": "Arrowstreet Global Equity",
          "buy": "Zurich Investements Global Growth"
        },
        "level_0":
        "SELL Arrowstreet Global Equity. BUY Zurich Investements Global Growth",
        "level_1":
        "Your fund 'Arrowstreet Global Equity' is in a position outside of the required threshold limit for the investment universe, it will need to be sold",
        "level_2":
        "Your fund 'Arrowstreet Global Equity' is in position 11 out of 200.  This is outside the required threshold limit of position 5 for the investment universe, it will need to be sold.  The fund 'Zurich Investements Global Growth' is in position 1 out of 200.",
        "level_3":
        "Zurich Investements Global Growth, Zurich Investements Advt Glb Gr Shr Fd, Megallan Global (Hedged)"
      }
    };

    Map<String, dynamic> webServiceResponse = await _provider.post(route, payLoadMap);

    return Mea.fromJson(webServiceResponse);
  }
}