%dw 2.0
output application/json
fun country(value) = if((value == "United States") or (value == "Spain") or (value == "Canada")) true else false
---
payload[?(($.Price == "1200") and (country($.Country)) and $.Payment_Type == 'Mastercard')] map {
    Transactiondate: $.Transaction_date as String {format: "MM/DD/YYYY"} ,
    productname: $.Product,
    Price: $.Price,
    Country: $.Country,
    paymenttype: $.Payment_Type
    
    
}