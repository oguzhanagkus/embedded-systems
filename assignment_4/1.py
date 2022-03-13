def prime_check(number):
    if (number < 2):
        return False
    elif (number == 2):
        return True
    elif (number == 3):
        return True

    if (number % 2 == 0):
        return False

    divider = 3
    half = number >> 1

    while (divider < half):
        if (number % divider == 0):
            return False
        else:
            divider += 2

    return True
    

count = 0

for i in range(1000000):
    if (prime_check(i)):
        count += 1

print(count)
