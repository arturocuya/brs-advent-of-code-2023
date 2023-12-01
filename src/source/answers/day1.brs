sub day1_1(inputLines as object)
    sum = 0

    for each line in inputLines
        firstDigit = invalid
        lastDigit = invalid
        length = Len(line)

        for i = 0 to length
            char = line.Mid(i, 1)
            if (isNumber(char))
                firstDigit = char
                exit for
            end if
        end for

        if (firstDigit = invalid)
            continue for
        end if

        for j = length - 1 to i step -1
            char = line.Mid(j, 1)
            if (isNumber(char))
                lastDigit = char
                exit for
            end if
        end for

        sum += Val(firstDigit + lastDigit)
    end for
    ? "day 1_1", sum
end sub

sub day1_2(inputLines as object)
    sum = 0
    numbers = ["one", "two", "three", "four", "five", "six", "seven", "eight", "nine"]

    for each line in inputLines
        firstDigit = invalid
        lastDigit = invalid

        for i = 0 to Len(line)
            char = line.mid(i, 1)
            if (isNumber(char))
                firstDigit = char
                exit for
            else
                for n = 0 to numbers.count() - 1
                    if (line.mid(i, Len(numbers[n])) = numbers[n])
                        firstDigit = (n + 1).ToStr()
                        exit for
                    end if
                end for

                if (firstDigit <> invalid)
                    exit for
                end if
            end if
        end for

        for j = Len(line) - 1 to i step -1
            char = line.mid(j, 1)
            if (isNumber(char))
                lastDigit = char
                exit for
            else
                for n = 0 to numbers.count() - 1
                    possibleReverse = line.mid(j - Len(numbers[n]) + 1, Len(numbers[n]))
                    if (possibleReverse = numbers[n])
                        lastDigit = (n + 1).ToStr()
                        exit for
                    end if
                end for

                if (lastDigit <> invalid)
                    exit for
                end if
            end if
        end for

        sum += Val(firstDigit + lastDigit)
    end for
    ? "day1_2:", sum
end sub

function isNumber(word as string) as boolean
    number = Val(word)
    if (number <> 0)
        return true
    end if

    return word = "0"
end function

