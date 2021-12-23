#!/bin/bash
assert() {
  expected="$1"
  input="$2"

  ./9cc/9cc "$input" > ./9cc/tmp.s
  cc -o ./9cc/tmp ./9cc/tmp.s
  ./9cc/tmp
  actual="$?"

  if [ "$actual" = "$expected" ]; then
    echo "$input => $actual"
  else
    echo "$input => $expected expected, but got $actual"
    exit 1
  fi
}

assert 0 0
assert 42 42
assert 21 "5+20-4"
assert 41 " 12 + 34 - 5 "
assert 47 '5+6*7'
assert 15 '5*(9-6)'
assert 4 '(3+5)/2'
assert 10 '-10+20'

echo OK