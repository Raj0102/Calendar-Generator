var year, yearString, month, monthString, LeapYear, dayNumber, dayNumberString


fun toCheckLeapYear() {
        if((.year%4) == 0){
                if((.year%100) == 0) {
                        if((.year%400) == 0) {
                                LeapYear : 1
                        }
                        else {
                                LeapYear : 0
                                }
                        }
                        else {
                                LeapYear : 1
                        }
                }
}

fun tocreateStringreps() {
        if(.month == 1) {
                monthString : "Jan"
        }
         if(.month == 2) {
                monthString : "Feb"
        }
        if(.month == 3) {
                monthString : "March"
        }
        if(.month == 4) {
                monthString : "Apr"
        }
        if(.month == 5) {
                monthString : "May"
        }
        if(.month == 6) {
                monthString : "Jun"
        }
        if(.month == 7) {
                monthString : "Jul"
        }
        if(.month == 8) {
                monthString : "Aug"
        }
        if(.month == 9) {
        monthString : "Sept"
        }
        if(.month == 10) {
                monthString : "Oct"
        }
        if(.month == 11) {
                monthString : "Nov"
        }
        if(.month == 12) {
                monthString : "Dec"
        }
        i2s(.yearString, .year)
}

fun tocreateTableHeader() {
        html("<center><table border=10 cell spacing=10 cellpadding=5><tr><td colspan='30' align=center><b>")
        html(.monthString)
        html(" ")
        html(.yearString)
        html("</b></td></tr>")
        html("<tr><td align=center>Sun</td><td align=center>Mon</td><td align=center>Tue</td><td align=center>Wed</td><td align=center>Thurs</td><td align=center>Fri</td><td align=center>Sun</td></tr>")
}
fun tocreateRow() {
        html("<tr>")
        }

fun toendRow() {
        html("</tr>")
        }

fun tofillData(data){
        html("<td align=center>")
        html(.data)
        html("</td>")
        }

fun tocreateFirstRow(firstday) {
        var i
        i : 0
        tocreateRow()

        loop {
        until .i == .firstday
        tofillData(" ")
        i : .i + 1
        }

        loop {
        until .firstday > 6
        i2s(.dayNumberString, .dayNumber)
        tofillData(.dayNumberString)
        dayNumber : .dayNumber + 1
        firstday : .firstday + 1
        }
        toendRow()
}

fun togetFirstDayOfMonth() {
        var day, y, m
        day : 1
        y : (.year - (14 - .month)/12)
        m : (.month + 12 * ((14 - .month)/12) - 2)
        return ((.day + .y + .y/4 - .y/100 + .y/400 + (31 * .m/12)) % 7)
}


fun tocreateRestOfRow(maxdays) {
        var i
	i : 0
        loop {
                until .dayNumber > .maxdays
                tocreateRow()

                loop {
                        until .i > 6
                        i2s(.dayNumberString, .dayNumber)
                        tofillData(.dayNumberString)
                        dayNumber : .dayNumber + 1

                        if(.dayNumber == (.maxdays + 1)) {
                                i : 7
                        }
                        else {
                                i : .i + 1
                        }
                }
                i : 0
                toendRow()
        }
}

fun togenerateCalender() {

        var startDay
        startDay : togetFirstDayOfMonth()

        tocreateTableHeader()
        tocreateFirstRow(.startDay)

        if .month == 4 | .month == 6 | .month == 9 | .month == 11 {
                tocreateRestOfRow(30)
        }
        else if .month == 1 | .month == 3 | .month == 5 | .month == 7 | .month == 8 | .month == 10 | .month == 12 {
                tocreateRestOfRow(31)
        }
        else if .month == 2 {
                if .LeapYear == 0 {
                tocreateRestOfRow(28)
                }
                else {
                tocreateRestOfRow(29)
                }
  }
        html("</table></center>")
}

fun init() {
        year : 0
        month : 0
        month : iread()
        year : iread()

        dayNumber : 1
        dayNumberString : "1"

        monthString : "January"
        yearString : "2024"

       toCheckLeapYear()
       tocreateStringreps()
       togenerateCalender()

}

