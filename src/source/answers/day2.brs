sub day2_1(inputLines as object)
    result = 0

    totalRed = 12
    totalGreen = 13
    totalBlue = 14

    ' line example: "Game 1: 3 blue, 4 red; 1 red, 2 green, 6 blue; 2 green"
    for i = 0 to inputLines.count() - 1
        line = inputLines[i]
        subsets = line.Tokenize(":")[1].Tokenize(";")

        isPossible = true
        for each subset in subsets
            colors = subset.Tokenize(",")
            for each color in colors
                _ = color.Tokenize(" ")
                amount = Val(_[0])
                colorName = _[1]

                tooBig = (amount > 14)
                blueAndBigger = (colorName = "blue" and amount > totalBlue)
                greenAndBigger = (colorName = "green" and amount > totalGreen)
                redAndBigger = (colorName = "red" and amount > totalRed)

                if (tooBig or blueAndBigger or greenAndBigger or redAndBigger)
                    isPossible = false
                    exit for
                end if
            end for
            if (not isPossible)
                exit for
            end if
        end for

        if (isPossible)
            result += i + 1
        end if
    end for
    ? "day 2_1", result
end sub

sub day2_2(inputLines as object)
    result = 0

    ' line example: "Game 1: 3 blue, 4 red; 1 red, 2 green, 6 blue; 2 green"
    for each line in inputLines
        subsets = line.Tokenize(":")[1].Tokenize(";")

        maxRed = 0
        maxGreen = 0
        maxBlue = 0
        ' in this case i need to go through the whole input, i can't exit for
        for each subset in subsets
            colors = subset.Tokenize(",")
            for each color in colors
                _ = color.Tokenize(" ")
                amount = Val(_[0])
                colorName = _[1]
                if (colorName = "red" and amount >= maxRed)
                    maxRed = amount
                else if (colorName = "green" and amount >= maxGreen)
                    maxGreen = amount
                else if (colorName = "blue" and amount >= maxBlue)
                    maxBlue = amount
                end if
            end for
        end for

        result += maxRed * maxGreen * maxBlue
    end for
    ? "day 2_2", result
end sub

