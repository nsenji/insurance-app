import 'dart:convert';
import 'package:http/http.dart' as http;

uploadAttachments() {}

const String url = "https://api.grow.curacel.co/api/v1/orders";
const String apikey = 'Bearer 667|RC6ubQEjOfd8AIze9JTBUeg2atJNdem5QKp9sR9W';

buyhealth(
  String productCode,
  String ref,
  String? policyStartDate,
  String? preferredHospital,
  String? medicalHistory,
  String? nextOfKinName,
  String? nextOfKinEmail,
  String? nextOfKinphone,
) async {
  Map<String, dynamic> data = {
    "product_code": productCode,
    "customer_ref": ref,
    "payment_type": 'wallet',
    "policy_start_date": policyStartDate,
    "preferred_hospital_location": preferredHospital,
    "medical_history": medicalHistory,
    "next_of_kin": {
      "name": nextOfKinName,
      "email": nextOfKinEmail,
      "phone": nextOfKinphone,
    }
  };

  String jsonData = jsonEncode(data);

  final response = await http.post(Uri.parse(url),
      headers: {
        'accept': 'application/json',
        'content-type': 'application/json',
        'authorization': apikey,
      },
      body: jsonData);

  if (response.statusCode == 201 || response.statusCode == 200) {
    final responseBody = jsonDecode(response.body);
    print('it went through');
    print(responseBody['message']);
    return responseBody['message'].toString();
  } else {
    final error = jsonDecode(response.body);
    print('it didnt go through');
    print(error['message']);
    return error['message'].toString();
  }
}

buygoodsInTransit(
  String productCode,
  String ref,
  String? policyStartDate,
  String? amountInsured,
  String? tripFrequency,
  String? tripsPerDay,
  String? pickUpLocation,
  String? dropOffLocation,
) async {
  Map<String, dynamic> data = {
    "product_code": productCode,
    "customer_ref": ref,
    "payment_type": 'wallet',
    "policy_start_date": policyStartDate,
    "asset_value": amountInsured,
    "trip_frequency": tripFrequency,
    "trips_per_day": tripsPerDay,
    "pickup_location": pickUpLocation,
    "dropoff_location": dropOffLocation,
  };
  String jsonData = jsonEncode(data);

  final response = await http.post(Uri.parse(url),
      headers: {
        'accept': 'application/json',
        'content-type': 'application/json',
        'authorization': apikey,
      },
      body: jsonData);

  if (response.statusCode == 201) {
    final responseBody = jsonDecode(response.body);
    String message = responseBody.toString();
    return message;
  } else {
    final error = jsonDecode(response.body);
    String message = error.toString();
    return message;
  }
}

buyThirdParty(
  String productCode,
  String ref,
  String? policyStartDate,
  String? amountInsured,
  String? driverLicence,
  String? chassisNumber,
) async {
  Map<String, dynamic> data = {
    "product_code": productCode,
    "customer_ref": ref,
    "payment_type": 'wallet',
    "policy_start_date": policyStartDate,
    "drivers_licence_number": driverLicence,
    "chassis_number": chassisNumber,
    "attachments": []
  };
  String jsonData = jsonEncode(data);

  final response = await http.post(Uri.parse(url),
      headers: {
        'accept': 'application/json',
        'content-type': 'application/json',
        'authorization': apikey,
      },
      body: jsonData);

  if (response.statusCode == 201) {
    final responseBody = jsonDecode(response.body);
    String message = responseBody.toString();
    return message;
  } else {
    final error = jsonDecode(response.body);
    String message = error.toString();
    return message;
  }
}

buyComprehensive(
  String productCode,
  String ref,
  String? policyStartDate,
  String? amountInsured,
  String? driverLicence,
  String? chassisNumber,
  String? valueOfVehicle,
  String? vehicleRegNumber,
  String? vehicleClass,
  String? vehicleMake,
  String? engineNumber,
  String? vehicleColor,
) async {
  Map<String, dynamic> data = {
    "product_code": productCode,
    "customer_ref": ref,
    "payment_type": 'wallet',
    "policy_start_date": policyStartDate,
    "asset_value": amountInsured,
    "registration_number": vehicleRegNumber,
    "vehicle_class": vehicleRegNumber,
    "vehicle_make": vehicleMake,
    "chassis_number": chassisNumber,
    "engine_number": engineNumber,
    "drivers_licence_number": driverLicence,
    "vehicle_color": vehicleColor,
  };

  String jsonData = jsonEncode(data);

  final response = await http.post(Uri.parse(url),
      headers: {
        'accept': 'application/json',
        'content-type': 'application/json',
        'authorization': apikey,
      },
      body: jsonData);

  if (response.statusCode == 201) {
    final responseBody = jsonDecode(response.body);
    String message = responseBody.toString();
    return message;
  } else {
    final error = jsonDecode(response.body);
    String message = error.toString();
    return message;
  }
}

buyMarine(
  String productCode,
  String ref,
  String? policyStartDate,
  String? amountInsured,
  String? tripFrequency,
  String? tripsPerDay,
  String? pickUpLocation,
  String? dropOffLocation,
) async {
  Map<String, dynamic> data = {
    "product_code": productCode,
    "customer_ref": ref,
    "payment_type": 'wallet',
    "policy_start_date": policyStartDate,
    "asset_value": amountInsured,
    "pickup_location": pickUpLocation,
    "dropoff_location": dropOffLocation,
  };
  String jsonData = jsonEncode(data);

  final response = await http.post(Uri.parse(url),
      headers: {
        'accept': 'application/json',
        'content-type': 'application/json',
        'authorization': apikey,
      },
      body: jsonData);

  if (response.statusCode == 201) {
    final responseBody = jsonDecode(response.body);
    String message = responseBody.toString();
    return message;
  } else {
    final error = jsonDecode(response.body);
    String message = error.toString();
    return message;
  }
}

buyJobLoss(
  String productCode,
  String ref,
  String? policyStartDate,
  String? amountInsured,
  String? employer,
  String? jobRole,
  String? employmentDate,
  String? grossIncome,
) async {
  Map<String, dynamic> data = {
    "product_code": productCode,
    "customer_ref": ref,
    "payment_type": 'wallet',
    "policy_start_date": policyStartDate,
    "asset_value": amountInsured,
    "employer": employer,
    "job_role": jobRole,
    "employment_date": employmentDate,
    "gross_income": grossIncome,
    "attachments": []
  };
  String jsonData = jsonEncode(data);

  final response = await http.post(Uri.parse(url),
      headers: {
        'accept': 'application/json',
        'content-type': 'application/json',
        'authorization': apikey,
      },
      body: jsonData);

  if (response.statusCode == 201) {
    final responseBody = jsonDecode(response.body);
    String message = responseBody.toString();
    return message;
  } else {
    final error = jsonDecode(response.body);
    String message = error.toString();
    return message;
  }
}

buyGadget(
  String productCode,
  String ref,
  String? policyStartDate,
  String? amountInsured,
  String? gadgetType,
  String? gadgetName,
  String? imei,
  String? datePurchased,
) async {
  Map<String, dynamic> data = {
    "product_code": productCode,
    "customer_ref": ref,
    "payment_type": 'wallet',
    "policy_start_date": policyStartDate,
    "asset_value": amountInsured,
    "gadget_type": gadgetType,
    "gadget_name": gadgetName,
    "imei": imei,
    "date_purchased": datePurchased,
    "attachments": []
  };
  String jsonData = jsonEncode(data);

  final response = await http.post(Uri.parse(url),
      headers: {
        'accept': 'application/json',
        'content-type': 'application/json',
        'authorization': apikey,
      },
      body: jsonData);

  if (response.statusCode == 201) {
    final responseBody = jsonDecode(response.body);
    String message = responseBody.toString();
    return message;
  } else {
    final error = jsonDecode(response.body);
    String message = error.toString();
    return message;
  }
}

buycredit(
  String productCode,
  String ref,
  String? policyStartDate,
  String? amountInsured,
  String? loanDuration,
  String? monthlyLoanInstallment,
  String? businessAddress,
  String? natureOfBusiness,
) async {
  Map<String, dynamic> data = {
    "product_code": productCode,
    "customer_ref": ref,
    "payment_type": 'wallet',
    "policy_start_date": policyStartDate,
    "asset_value": amountInsured,
    "loan_duration": loanDuration,
    "monthly_loan_instalment": monthlyLoanInstallment,
    "business_address": businessAddress,
    "nature_of_business": natureOfBusiness,
  };
  String jsonData = jsonEncode(data);

  final response = await http.post(Uri.parse(url),
      headers: {
        'accept': 'application/json',
        'content-type': 'application/json',
        'authorization': apikey,
      },
      body: jsonData);

  if (response.statusCode == 201) {
    final responseBody = jsonDecode(response.body);
    String message = responseBody.toString();
    return message;
  } else {
    final error = jsonDecode(response.body);
    String message = error.toString();
    return message;
  }
}

buyFire(
  String productCode,
  String ref,
  String? policyStartDate,
  String? amountInsured,
  String? address,
) async {
  Map<String, dynamic> data = {
    "product_code": productCode,
    "customer_ref": ref,
    "payment_type": 'wallet',
    "policy_start_date": policyStartDate,
    "asset_value": amountInsured,
    "address": address,
  };
  String jsonData = jsonEncode(data);

  final response = await http.post(Uri.parse(url),
      headers: {
        'accept': 'application/json',
        'content-type': 'application/json',
        'authorization': apikey,
      },
      body: jsonData);

  if (response.statusCode == 201) {
    final responseBody = jsonDecode(response.body);
    String message = responseBody.toString();
    return message;
  } else {
    final error = jsonDecode(response.body);
    String message = error.toString();
    return message;
  }
}
