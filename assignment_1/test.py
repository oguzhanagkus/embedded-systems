with open("output_reference.txt", "w") as file:
    for x in range (256):
        for y in range (256):
            if x + y < 400:
                z = x % 64 + y * 3
            else:
                z = x % 16 + y * 13

            file.write(str(x) + "," + str(y) + "," + str(z) + "\n")
