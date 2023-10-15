-- 1. Write a PL/SQL program to find the largest of three numbers

DECLARE
   a NUMBER := 10;
   b NUMBER := 20;
   c NUMBER := 15;
   largest NUMBER;
BEGIN
   IF (a >= b) AND (a >= c) THEN
      largest := a;
   ELSIF (b >= a) AND (b >= c) THEN
      largest := b;
   ELSE
      largest := c;
   END IF;

   DBMS_OUTPUT.PUT_LINE('The largest number among ' || a || ', ' || b || ', and ' || c || ' is ' || largest);
END;

-- 2. Write a PL/SQL program to generate reverse for given number

DECLARE
   n NUMBER(4) := 5; 
   s NUMBER(4) := 8;  
   r NUMBER(4);
BEGIN
   WHILE n > 0 LOOP
      r := MOD(n, 10); 
      s := (s * 10) + r; 
      n := TRUNC(n / 10); 
   END LOOP;

   DBMS_OUTPUT.put_line('The reverse number is: ' || s);
END;

-- 3. Write a PL/SQL program to find the factorial of a given number

DECLARE
   n NUMBER(4) := 5; 
   f NUMBER(4) := 1;  
   result NUMBER(4);
BEGIN
   FOR i IN 1..n LOOP
      f := f * i;
   END LOOP;

      result := f;
   
   DBMS_OUTPUT.put_line('The factorial of ' || n || ' is: ' || result);
END;

-- 4. Write a PL/SQL program to check whether given number is prime or no

DECLARE
   n NUMBER(4) := &n; -- Input number
   is_prime BOOLEAN := TRUE;  

BEGIN
   IF n <= 1 THEN
      is_prime := FALSE; 
   ELSE
      FOR i IN 2..TRUNC(SQRT(n)) LOOP
         IF MOD(n, i) = 0 THEN
            is_prime := FALSE; 
            EXIT;
         END IF;
      END LOOP;
   END IF;

   IF is_prime THEN
      DBMS_OUTPUT.put_line(n || ' is a prime number.');
   ELSE
      DBMS_OUTPUT.put_line(n || ' is not a prime number.');
   END IF;
END;


-- 5. Write a PL/SQL program to generate Fibonacci series upto N

DECLARE
   n NUMBER(4) := &n; 
   a NUMBER(4) := 0;  
   b NUMBER(4) := 1;  
   fib NUMBER(4);

BEGIN
   DBMS_OUTPUT.put_line('Fibonacci series up to ' || n || ':');
   
   IF n >= 1 THEN
      DBMS_OUTPUT.put_line(a); 
   END IF;

   IF n >= 2 THEN
      DBMS_OUTPUT.put_line(b); 
   END IF;

   FOR i IN 3..n LOOP
      fib := a + b; 
      DBMS_OUTPUT.put_line(fib); 
      a := b;  
      b := fib;
   END LOOP;
END;

-- 6.	Write a PL/SQL program for calculating sum of two numbers. [NOT WORKING]
-- DECLARE
--    num1 NUMBER(4) := &num1; -- Input for the first number, provide a value when prompted
--    num2 NUMBER(4) := &num2; -- Input for the second number, provide a value when prompted
--    sum NUMBER(4);

-- BEGIN
--    sum := num1 + num2; -- Calculate the sum

--    -- Output the result
--    DBMS_OUTPUT.put_line('The sum of ' || num1 || ' and ' || num2 || ' is: ' || sum);
-- END;
-- /

-- 7. Write a PL/SQL program to check the given year is leap year or not

DECLARE
    year_to_check NUMBER := &n; -- Replace with the year you want to check
    is_leap BOOLEAN := FALSE;
BEGIN
    -- Check if the year is divisible by 4
    IF (MOD(year_to_check, 4) = 0) THEN
        IF (MOD(year_to_check, 100) <> 0 OR MOD(year_to_check, 400) = 0) THEN
            is_leap := TRUE;
        END IF;
    END IF;
    
    IF is_leap THEN
        DBMS_OUTPUT.PUT_LINE(year_to_check || ' is a leap year.');
    ELSE
        DBMS_OUTPUT.PUT_LINE(year_to_check || ' is not a leap year.');
    END IF;
END;

-- 8.	Find the sum of the digits of a given number

DECLARE
    number_to_sum NUMBER := &n; 
    digit_sum NUMBER := 0;
    temp_number NUMBER;
BEGIN
    temp_number := number_to_sum;
    
    -- Loop to calculate the sum of digits
    WHILE temp_number > 0 LOOP
        digit_sum := digit_sum + MOD(temp_number, 10); 
        temp_number := TRUNC(temp_number / 10); 
    END LOOP;

    DBMS_OUTPUT.PUT_LINE('The sum of the digits of ' || number_to_sum || ' is ' || digit_sum);
END;

-- 9.	Check the number of vowels and consonants in a given string

DECLARE
    input_string VARCHAR2(100) := 'Hello, World!'; -- Replace with your input string
    num_vowels NUMBER := 0;
    num_consonants NUMBER := 0;
    i NUMBER;
    character VARCHAR2(1);
BEGIN
    input_string := UPPER(input_string);

    FOR i IN 1..LENGTH(input_string) LOOP
        character := SUBSTR(input_string, i, 1);
        
        IF REGEXP_LIKE(character, '[A-Z]') THEN
            IF character IN ('A', 'E', 'I', 'O', 'U') THEN
                num_vowels := num_vowels + 1;
            ELSE
                num_consonants := num_consonants + 1;
            END IF;
        END IF;
    END LOOP;

    DBMS_OUTPUT.PUT_LINE('Input String: ' || input_string);
    DBMS_OUTPUT.PUT_LINE('Number of Vowels: ' || num_vowels);
    DBMS_OUTPUT.PUT_LINE('Number of Consonants: ' || num_consonants);
END;

-- 10. Count odd and even digits in a number

DECLARE
    input_number NUMBER := 123456789; -- Replace with the number you want to analyze
    num_even NUMBER := 0;
    num_odd NUMBER := 0;
    temp_number NUMBER;
    digit NUMBER;
BEGIN
    temp_number := input_number;

    WHILE temp_number > 0 LOOP
        digit := MOD(temp_number, 10);
        IF MOD(digit, 2) = 0 THEN
            num_even := num_even + 1;
        ELSE
            num_odd := num_odd + 1;
        END IF;
        temp_number := TRUNC(temp_number / 10); 
    END LOOP;

    DBMS_OUTPUT.PUT_LINE('Input Number: ' || input_number);
    DBMS_OUTPUT.PUT_LINE('Number of Even Digits: ' || num_even);
    DBMS_OUTPUT.PUT_LINE('Number of Odd Digits: ' || num_odd);
END;
