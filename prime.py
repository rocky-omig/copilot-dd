def is_prime(n):
    """
    Check if a number is prime.

    Args:
        n (int): The number to check.

    Returns:
        bool: True if the number is prime, False otherwise.
    """
    if n < 2:
        return False
    for i in range(2, int(n ** 0.5) + 1):
        if n % i == 0:
            return False
    return True

# q: what does the function above do?
# a: it checks if a number is prime


# explain the code above line-by-line
# 1. `is_prime` is a function that takes an integer `n` and returns a boolean
# 2. If `n` is less than 2, return `False`
# 3. Loop through all integers from 2 to the square root of `n` (inclusive)
# 4. If `n` is divisible by `i`, return `False`
# 5. If no divisors are found, return `True`
