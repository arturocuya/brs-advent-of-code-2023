sub day1_1(inputLines as object)
    sum = 0

    ' line example: one111jxlmc7tvklrmhdpsix
    for each line in inputLines
        firstDigit = invalid
        lastDigit = invalid
        length = Len(line)

        for i = 0 to length - 1
            ' Mid() and string.mid() are different!
            char = line.Mid(i, 1)
            ' there is not a function like isNumber() in the std.
            ' you have to use Val(), but that gives 0 when the input is NaN
            if (isNumber(char))
                firstDigit = char
                exit for
            end if
        end for
        ' after exiting an array, the value of the iterator is still in scope

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

        for i = 0 to Len(line) - 1
            char = line.mid(i, 1)
            if (isNumber(char))
                firstDigit = char
                exit for
            else
                for n = 0 to numbers.count() - 1
                    ' string.mid() is very useful here, i can check if the
                    ' next list of characters with the same lenght as one of the numbers
                    ' is the actual number
                    ' e.g: if "???" = "one"
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
                    ' have to be smarter here since i'm scanning the line in reverse
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

