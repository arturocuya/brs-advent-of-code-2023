sub main()
    screen = CreateObject("roSGScreen")
    m.port = CreateObject("roMessagePort")
    screen.setMessagePort(m.port)
    m.global = screen.getGlobalNode()

    screen.CreateScene("MainScene")
    screen.show()

    input = getInputLines("pkg:/input/day1.txt")
    day1_1(input)
    day1_2(input)

    input = getInputLines("pkg:/input/day2.txt")
    day2_1(input)
    day2_2(input)

    while(true)
        msg = wait(0, m.port)
        msgType = type(msg)
        if (msgType = "roSGScreenEvent")
            if (msg.isScreenClosed())
                return
            end if
        end if
    end while
end sub

function getInputLines(path as string) as object
    return ReadAsciiFile(path).Tokenize(chr(10))
end function
