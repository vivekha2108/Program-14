#!/bin/bash

TOTAL=0
FAILED=0

echo "=========================================="
echo "PL/SQL PROGRAM 14 - AUTOGRADING"
echo "SUM OF TWO NUMBERS"
echo "=========================================="

run_test() {
    local num="$1"
    local description="$2"
    local pattern="$3"

    if grep -qi "$pattern" student_solution.sql; then
        echo "Test Case $num PASS: $description"
        TOTAL=$((TOTAL + 1))
    else
        echo "Test Case $num FAIL: $description"
        FAILED=$((FAILED + 1))
    fi
}

run_test 1 "DECLARE section exists" "DECLARE"

run_test 2 "First variable declared" "num1"

run_test 3 "Second variable declared" "num2"

run_test 4 "Sum variable declared" "total"

run_test 5 "Addition operation used" "num1 + num2"

run_test 6 "BEGIN section exists" "BEGIN"

run_test 7 "DBMS_OUTPUT used" "DBMS_OUTPUT.PUT_LINE"

run_test 8 "Sum displayed" "Sum"

run_test 9 "END section exists" "END"

run_test 10 "PL/SQL block terminator exists" "/"

echo
echo "=========================================="
echo "Total Marks: $TOTAL / 10"
echo "=========================================="

if [ "$FAILED" -eq 0 ]; then
    echo "All test cases passed."
    exit 0
else
    echo "$FAILED test case(s) failed."
    exit 1
fi
