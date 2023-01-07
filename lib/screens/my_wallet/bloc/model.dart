class WalletModel {

  late final List<WalletData> list;
  late final String status;
  late final String message;
  late final int wallet;

  WalletModel.fromJson(Map<String, dynamic> json){
    list = List.from(json['data']??{}).map((e)=>WalletData.fromJson(e)).toList();
    status = json['status']??'';
    message = json['message']??'';
    wallet = json['wallet']??0;
  }

}

class WalletData {

  late final int id;
  late final int amount;
  late final int beforeCharge;
  late final int afterCharge;
  late final String date;
  late final String statusTrans;
  late final String status;
  late final String transactionType;
  late final String modelType;
  late final int modelId;
  late final String state;

  WalletData.fromJson(Map<String, dynamic> json){
    id = json['id']??0;
    amount = json['amount']??0;
    beforeCharge = json['before_charge']??0;
    afterCharge = json['after_charge']??0;
    date = json['date']??'';
    statusTrans = json['status_trans']??'';
    status = json['status']??'';
    transactionType = json['transaction_type']??'';
    modelType = json['model_type']??'';
    modelId = json['model_id']??0;
    state = json['state']??'';
  }

}