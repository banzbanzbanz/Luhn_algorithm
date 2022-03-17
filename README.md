# Luhn_algorithm
A MySQL Function that checks if a credit card is valid or invalid using Luhn’s Algorithm. If valid, it will return the Credit Card Type

You can grab some Test Credit Card Account Numbers here https://www.paypalobjects.com/en_GB/vhelp/paypalmanager_help/credit_card_numbers.htm
~~~sql

# SELECT MySQLverifyLuhn(CreditCardNumber);


SELECT MySQLverifyLuhn(378282246310005);

Returns: American Express

~~~
