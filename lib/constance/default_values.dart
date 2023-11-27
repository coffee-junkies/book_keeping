import '../classes/chart_of_account.dart';
import 'constance.dart';
//0 - assets
//1 - liabilities
//2 - equities
//3 - revenues
//4 - expenses
List<ChartOfAccounts> kChartOfAccounts = [

  //1000 - assets
  ChartOfAccounts(numericSystem: 1010, name: "Cash Operating Account", type: typeOfAccount[0], description: ""),
  ChartOfAccounts(numericSystem: 1020, name: "Cash Debitors", type: typeOfAccount[0], description: ""),
  ChartOfAccounts(numericSystem: 1030, name: "Cash Petty Cash", type: typeOfAccount[0], description: ""),
  //1200 - receivables
  ChartOfAccounts(numericSystem: 1210, name: "A/REC Trade", type: typeOfAccount[0], description: ""),
  ChartOfAccounts(numericSystem: 1220, name: "A/REC Trade Notes Receivable", type: typeOfAccount[0], description: ""),
  ChartOfAccounts(numericSystem: 1230, name: "A/REC Installment Receivable", type: typeOfAccount[0], description: ""),
  ChartOfAccounts(numericSystem: 1240, name: "A/REC Retainage Withheld", type: typeOfAccount[0], description: ""),
  ChartOfAccounts(numericSystem: 1290, name: "A/REC Allowance for Uncollectible Accounts", type: typeOfAccount[0], description: ""),
  //1300 - Inventories
  ChartOfAccounts(numericSystem: 1310, name: "Inventory-Reserved", type: typeOfAccount[0], description: ""),
  ChartOfAccounts(numericSystem: 1320, name: "Inventory-Work in Progress", type: typeOfAccount[0], description: ""),
  ChartOfAccounts(numericSystem: 1330, name: "Inventory-Finished Goods", type: typeOfAccount[0], description: ""),
  ChartOfAccounts(numericSystem: 1340, name: "Inventory-Reserved", type: typeOfAccount[0], description: ""),
  ChartOfAccounts(numericSystem: 1350, name: "Unbilled Cost and Fees", type: typeOfAccount[0], description: ""),
  ChartOfAccounts(numericSystem: 1390, name: "Reserve for Obsolescence", type: typeOfAccount[0], description: ""),
  //1400 PREPAID EXPENSES & OTHER CURRENT ASSETS
  ChartOfAccounts(numericSystem: 1410, name: "PREPAID – Insurance", type: typeOfAccount[0], description: ""),
  ChartOfAccounts(numericSystem: 1420, name: "PREPAID – Real Estate Taxes", type: typeOfAccount[0], description: ""),
  ChartOfAccounts(numericSystem: 1430, name: "PREPAID – Repairs & Maintenance", type: typeOfAccount[0], description: ""),
  ChartOfAccounts(numericSystem: 1440, name: "PREPAID – Rent", type: typeOfAccount[0], description: ""),
  ChartOfAccounts(numericSystem: 1450, name: "PREPAID – Deposits", type: typeOfAccount[0], description: ""),
  //1500 PROPERTY PLANT & EQUIPMENT
  ChartOfAccounts(numericSystem: 1510, name: "PPE – Buildings", type: typeOfAccount[0], description: ""),
  ChartOfAccounts(numericSystem: 1520, name: "PPE – Machinery & Equipment", type: typeOfAccount[0], description: ""),
  ChartOfAccounts(numericSystem: 1530, name: "PPE – Vehicles", type: typeOfAccount[0], description: ""),
  ChartOfAccounts(numericSystem: 1540, name: "PPE – Computer Equipment", type: typeOfAccount[0], description: ""),
  ChartOfAccounts(numericSystem: 1550, name: "PPE – Furniture & Fixtures", type: typeOfAccount[0], description: ""),
  ChartOfAccounts(numericSystem: 1560, name: "PPE – Leasehold Improvements", type: typeOfAccount[0], description: ""),
  //1600 ACCUMULATED DEPRECIATION & AMORTIZATION
  ChartOfAccounts(numericSystem: 1610, name: "ACCUM DEPR Buildings", type: typeOfAccount[0], description: ""),
  ChartOfAccounts(numericSystem: 1620, name: "ACCUM DEPR Machinery & Equipment", type: typeOfAccount[0], description: ""),
  ChartOfAccounts(numericSystem: 1630, name: "ACCUM DEPR Vehicles", type: typeOfAccount[0], description: ''),
  ChartOfAccounts(numericSystem: 1640, name: "ACCUM DEPR Computer Equipment", type: typeOfAccount[0], description: ''),
  ChartOfAccounts(numericSystem: 1650, name: "ACCUM DEPR Furniture & Fixtures", type: typeOfAccount[0], description: ''),
  ChartOfAccounts(numericSystem: 1660, name: "ACCUM DEPR Leasehold Improvements", type: typeOfAccount[0], description: ''),
  //1700 NON – CURRENT RECEIVABLES
  ChartOfAccounts(numericSystem: 1710, name: "NCA – Notes Receivable", type: typeOfAccount[0], description: ''),
  ChartOfAccounts(numericSystem: 1720, name: "NCA – Installment Receivables", type: typeOfAccount[0], description: ''),
  ChartOfAccounts(numericSystem: 1730, name: "NCA – Retainage Withheld", type: typeOfAccount[0], description: ''),
  //1800 INTERCOMPANY RECEIVABLES
  ChartOfAccounts(numericSystem: 1800, name: "Inter Company Receivables", type: typeOfAccount[0], description: ''),
  //1900 OTHER NON-CURRENT ASSETS
  ChartOfAccounts(numericSystem: 1910, name: "Organization Costs", type: typeOfAccount[0], description: ''),
  ChartOfAccounts(numericSystem: 1920, name: "Patents & Licenses", type: typeOfAccount[0], description: ''),
  ChartOfAccounts(numericSystem: 1930, name: "Intangible Assets – Capitalized Software Costs", type: typeOfAccount[0], description: ''),
  //2000 LIABILITIES
  //2010 2100 PAYABLES
  ChartOfAccounts(numericSystem: 2110, name: "Accounts Payable", type: typeOfAccount[1], description: ""),
  ChartOfAccounts(numericSystem: 2120, name: "Accrued Accounts Payable", type: typeOfAccount[1], description: ""),
  ChartOfAccounts(numericSystem: 2130, name: "Retainage Withheld", type: typeOfAccount[1], description: ""),
  ChartOfAccounts(numericSystem: 2150, name: "Current Maturities of Long-Term Debt", type: typeOfAccount[1], description: ""),
  ChartOfAccounts(numericSystem: 2160, name: "Bank Notes Payable", type: typeOfAccount[1], description: ""),
  ChartOfAccounts(numericSystem: 2170, name: "Construction Loans Payable", type: typeOfAccount[1], description: ""),
  //2200 ACCRUED COMPENSATION & RELATED ITEMS
  ChartOfAccounts(numericSystem: 2210, name: "Accrued – Payroll", type: typeOfAccount[1], description: ""),
  ChartOfAccounts(numericSystem: 2220, name: "Accrued – Commissions", type: typeOfAccount[1], description: ""),
  ChartOfAccounts(numericSystem: 2230, name: "Accrued – FICA", type: typeOfAccount[1], description: ""),
  ChartOfAccounts(numericSystem: 2240, name: "Accrued – Unemployment Taxes", type: typeOfAccount[1], description: ""),
  ChartOfAccounts(numericSystem: 2250, name: "Accrued – Workmen’s Comp", type: typeOfAccount[1], description: ""),
  ChartOfAccounts(numericSystem: 2260, name: "Accrued – Medical Benefits", type: typeOfAccount[1], description: ""),
  ChartOfAccounts(numericSystem: 2270, name: "Accrued – 401 K Company Match", type: typeOfAccount[1], description: ""),
  ChartOfAccounts(numericSystem: 2275, name: "W/H – FICA", type: typeOfAccount[1], description: ""),
  ChartOfAccounts(numericSystem: 2280, name: "W/H – Medical Benefits", type: typeOfAccount[1], description: ""),
  ChartOfAccounts(numericSystem: 2285, name: "W/H – 401 K Employee Contribution", type: typeOfAccount[1], description: ""),
  //2300 OTHER ACCRUED EXPENSES
  ChartOfAccounts(numericSystem: 2310, name: "Accrued – Rent", type: typeOfAccount[1], description: ""),
  ChartOfAccounts(numericSystem: 2320, name: "Accrued – Interest", type: typeOfAccount[1], description: ""),
  ChartOfAccounts(numericSystem: 2330, name: "Accrued – Property Taxes", type: typeOfAccount[1], description: ""),
  ChartOfAccounts(numericSystem: 2340, name: "Accrued – Warranty Expense", type: typeOfAccount[1], description: ""),
  //2500 ACCRUED TAXES
  ChartOfAccounts(numericSystem: 2510, name: "Accrued – Federal Income Taxes", type: typeOfAccount[1], description: ""),
  ChartOfAccounts(numericSystem: 2520, name: "Accrued – State Income Taxes", type: typeOfAccount[1], description: ""),
  ChartOfAccounts(numericSystem: 2530, name: "Accrued – Franchise Taxes", type: typeOfAccount[1], description: ""),
  ChartOfAccounts(numericSystem: 2540, name: "Deferred  – FIT Current", type: typeOfAccount[1], description: ""),
  ChartOfAccounts(numericSystem: 2550, name: "Deferred  – State Income Taxes", type: typeOfAccount[1], description: ""),
  //2600 DEFERRED TAXES
  ChartOfAccounts(numericSystem: 2610, name: "D/T – FIT – NON CURRENTT", type: typeOfAccount[1], description: ""),
  ChartOfAccounts(numericSystem: 2620, name: "D/T – SIT – NON CURRENT", type: typeOfAccount[1], description: ""),
  //2700 LONG-TERM DEBT
  ChartOfAccounts(numericSystem: 2710, name: "LTD – Notes Payable", type: typeOfAccount[1], description: ""),
  ChartOfAccounts(numericSystem: 2720, name: "LTD – Mortgages Payable", type: typeOfAccount[1], description: ""),
  ChartOfAccounts(numericSystem: 2730, name: "LTD – Installment Notes Payable", type: typeOfAccount[1], description: ""),
  //2800 INTERCOMPANY PAYABLES
  ChartOfAccounts(numericSystem: 2800, name: "Inter Company Payables", type: typeOfAccount[1], description: ""),
  //2900 OTHER NON CURRENT LIABILITIES
  ChartOfAccounts(numericSystem: 2900, name: "Other Non Current Liabilities", type: typeOfAccount[1], description: ""),
  //3000 OWNERS EQUITIES
  ChartOfAccounts(numericSystem: 3100, name: "Common Stock", type: typeOfAccount[2], description: ""),
  ChartOfAccounts(numericSystem: 3200, name: "Preferred Stock", type: typeOfAccount[2], description: ""),
  ChartOfAccounts(numericSystem: 3300, name: "Paid in Capital", type: typeOfAccount[2], description: ""),
  ChartOfAccounts(numericSystem: 3400, name: "Partners Capital", type: typeOfAccount[2], description: ""),
  ChartOfAccounts(numericSystem: 3500, name: "Member Contributions", type: typeOfAccount[2], description: ""),
  ChartOfAccounts(numericSystem: 3900, name: "Retained Earnings", type: typeOfAccount[2], description: ""),
  //4000 REVENUE
  ChartOfAccounts(numericSystem: 4010, name: "REVENUE – PRODUCT 1", type: typeOfAccount[3], description: ""),
  ChartOfAccounts(numericSystem: 4020, name: "REVENUE – PRODUCT 2", type: typeOfAccount[3], description: ""),
  ChartOfAccounts(numericSystem: 4030, name: "REVENUE – PRODUCT 3", type: typeOfAccount[3], description: ""),
  ChartOfAccounts(numericSystem: 4040, name: "REVENUE – PRODUCT 4", type: typeOfAccount[3], description: ""),
  ChartOfAccounts(numericSystem: 4600, name: "Interest Income", type: typeOfAccount[3], description: ""),
  ChartOfAccounts(numericSystem: 4700, name: "Other Income", type: typeOfAccount[3], description: ""),
  ChartOfAccounts(numericSystem: 4800, name: "Finance Charge Income", type: typeOfAccount[3], description: ""),
  ChartOfAccounts(numericSystem: 4900, name: "Sales Returns and Allowances", type: typeOfAccount[3], description: ""),
  ChartOfAccounts(numericSystem: 4950, name: "Sales Discounts", type: typeOfAccount[3], description: ""),
  //5000 COST OF GOODS SOLD
  ChartOfAccounts(numericSystem: 5010, name: "COGS – PRODUCT 1", type: typeOfAccount[3], description: ""),
  ChartOfAccounts(numericSystem: 5020, name: "COGS – PRODUCT 2", type: typeOfAccount[3], description: ""),
  ChartOfAccounts(numericSystem: 5030, name: "COGS – PRODUCT 3", type: typeOfAccount[3], description: ""),
  ChartOfAccounts(numericSystem: 5040, name: "COGS – PRODUCT 4", type: typeOfAccount[3], description: ""),
  ChartOfAccounts(numericSystem: 5700, name: "Freight", type: typeOfAccount[3], description: ""),
  ChartOfAccounts(numericSystem: 5800, name: "Inventory Adjustments", type: typeOfAccount[3], description: ""),
  ChartOfAccounts(numericSystem: 5900, name: "Purchase Returns and Allowances", type: typeOfAccount[3], description: ""),
  ChartOfAccounts(numericSystem: 5950, name: "Reserved", type: typeOfAccount[3], description: ""),
  //6000 – 7000 OPERATING EXPENSES
  ChartOfAccounts(numericSystem: 6010, name: "Advertising Expense", type: typeOfAccount[4], description: ""),
  ChartOfAccounts(numericSystem: 6050, name: "Amortization Expense", type: typeOfAccount[4], description: ""),
  ChartOfAccounts(numericSystem: 6100, name: "Auto Expense", type: typeOfAccount[4], description: ""),
  ChartOfAccounts(numericSystem: 6150, name: "Bad Debt Expense", type: typeOfAccount[4], description: ""),
  ChartOfAccounts(numericSystem: 6200, name: "Bank Charges", type: typeOfAccount[4], description: ""),
  ChartOfAccounts(numericSystem: 6250, name: "Cash Over and Short", type: typeOfAccount[4], description: ""),
  ChartOfAccounts(numericSystem: 6300, name: "Commission Expense", type: typeOfAccount[4], description: ""),
  ChartOfAccounts(numericSystem: 6350, name: "Depreciation Expense", type: typeOfAccount[4], description: ""),
  ChartOfAccounts(numericSystem: 6400, name: "Employee Benefit Program", type: typeOfAccount[4], description: ""),
  ChartOfAccounts(numericSystem: 6550, name: "Freight Expense", type: typeOfAccount[4], description: ""),
  ChartOfAccounts(numericSystem: 6600, name: "Gifts Expense", type: typeOfAccount[4], description: ""),
  ChartOfAccounts(numericSystem: 6650, name: "Insurance – General", type: typeOfAccount[4], description: ""),
  ChartOfAccounts(numericSystem: 6700, name: "Interest Expense", type: typeOfAccount[4], description: ""),
  ChartOfAccounts(numericSystem: 6750, name: "Professional Fees", type: typeOfAccount[4], description: ""),
  ChartOfAccounts(numericSystem: 6800, name: "License Expense", type: typeOfAccount[4], description: ""),
  ChartOfAccounts(numericSystem: 6850, name: "Maintenance Expense", type: typeOfAccount[4], description: ""),
  ChartOfAccounts(numericSystem: 6900, name: "Meals and Entertainment", type: typeOfAccount[4], description: ""),
  ChartOfAccounts(numericSystem: 6950, name: "Office Expense", type: typeOfAccount[4], description: ""),
  ChartOfAccounts(numericSystem: 7000, name: "Payroll Taxes", type: typeOfAccount[4], description: ""),
  ChartOfAccounts(numericSystem: 7050, name: "Printing", type: typeOfAccount[4], description: ""),
  ChartOfAccounts(numericSystem: 7150, name: "Postage", type: typeOfAccount[4], description: ""),
  ChartOfAccounts(numericSystem: 7200, name: "Rent", type: typeOfAccount[4], description: ""),
  ChartOfAccounts(numericSystem: 7250, name: "Repairs Expense", type: typeOfAccount[4], description: ""),
  ChartOfAccounts(numericSystem: 7300, name: "Salaries Expense", type: typeOfAccount[4], description: ""),
  ChartOfAccounts(numericSystem: 7350, name: "Supplies Expense", type: typeOfAccount[4], description: ""),
  ChartOfAccounts(numericSystem: 7400, name: "Taxes – FIT Expense", type: typeOfAccount[4], description: ""),
  ChartOfAccounts(numericSystem: 7500, name: "Utilities Expense", type: typeOfAccount[4], description: ""),
  ChartOfAccounts(numericSystem: 7900, name: "Gain/Loss on Sale of Assets", type: typeOfAccount[4], description: ""),
];