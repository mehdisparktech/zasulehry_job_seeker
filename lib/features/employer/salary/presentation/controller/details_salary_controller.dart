import 'package:get/get.dart';

class DetailsSalaryController extends GetxController {

  // Salary data structure
  Map<String, Map<String, String>> salaryData = {
    'Gross Salary': {'Month': '\$3000', 'Years': '\$36000'},
    'Pension Insurance (18.6%)': {'Month': '\$279', 'Years': '\$293.38'},
    'Unemployment Insurance (2.6%)': {'Month': '\$369', 'Years': '\$29358'},
    'Care Insurance (3.6%)': {'Month': '\$369', 'Years': '\$29358'},
    'Health Insurance (17.1%)': {'Month': '\$369', 'Years': '\$29358'},
    'Total Social Expenses': {'Month': '\$369', 'Years': '\$29358'},
  };

  Map<String, Map<String, String>> taxData = {
    'Payroll Tax': {'Month': '\$369', 'Years': '\$29358'},
    'Solidarity Surcharge': {'Month': '\$279', 'Years': '\$293.38'},
    'Church Tax': {'Month': '\$369', 'Years': '\$29358'},
    'Total Taxes': {'Month': '\$369', 'Years': '\$29358'},
  };

  var value = false.obs;

  Map<String, String> netSalary = {'Month': '\$2561', 'Years': '\$56889'};

  void toggleValue(bool val) {
    value.value = val;
  }

}