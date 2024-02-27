import unittest
from prime import is_prime  # assuming your function is in a file named prime.py

class TestIsPrime(unittest.TestCase):

    def test_negative_number(self):
        self.assertFalse(is_prime(-1), "Negative numbers are not prime")

    def test_zero(self):
        self.assertFalse(is_prime(0), "Zero is not prime")

    def test_one(self):
        self.assertFalse(is_prime(1), "One is not prime")

    def test_two(self):
        self.assertTrue(is_prime(2), "Two is prime")

    def test_prime_number(self):
        self.assertTrue(is_prime(7), "Seven is prime")

    def test_non_prime_number(self):
        self.assertFalse(is_prime(4), "Four is not prime")

    def test_large_prime_number(self):
        self.assertTrue(is_prime(104729), "104729 is prime")

    def test_large_non_prime_number(self):
        self.assertFalse(is_prime(100000), "100000 is not prime")

if __name__ == '__main__':
    unittest.main()
