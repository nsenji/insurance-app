uploadAttachments() {}

buyhealth(
  String productCode,
  String ref,
  String? policyStartDate,
  String? preferredHospital,
  String? medicalHistory,
  String? nextOfKinEmail,
) {
  Map<String, dynamic> data = {
    "product_code": '',
    "customer_ref": '',
    "payment_type": 'wallet',
    "policy_start_date": policyStartDate,
    "preferred_hospital_location": preferredHospital,
    "medical_history": medicalHistory,
    "next_of_kin": {
      "name": '',
      "email": nextOfKinEmail,
      "phone": '',
    }
  };
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
) {
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
}

buyThirdParty(
  String productCode,
  String ref,
  String? policyStartDate,
  String? amountInsured,
  String? driverLicence,
  String? chassisNumber,
) {
  Map<String, dynamic> data = {
    "product_code": productCode,
    "customer_ref": ref,
    "payment_type": 'wallet',
    "policy_start_date": policyStartDate,
    "drivers_licence_number": driverLicence,
    "chassis_number": chassisNumber,
  };
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
) {
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
) {
  Map<String, dynamic> data = {
    "product_code": productCode,
    "customer_ref": ref,
    "payment_type": 'wallet',
    "policy_start_date": policyStartDate,
    "asset_value": amountInsured,
    "pickup_location": pickUpLocation,
    "dropoff_location": dropOffLocation,
  };
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
) {
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
  };
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
) {
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
    
  };
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
) {
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
}

buyFire(
  String productCode,
  String ref,
  String? policyStartDate,
  String? amountInsured,
  String? address,
) {
  Map<String, dynamic> data = {
    "product_code": productCode,
    "customer_ref": ref,
    "payment_type": 'wallet',
    "policy_start_date": policyStartDate,
    "asset_value": amountInsured,
    "address": address,
    
  };
}
