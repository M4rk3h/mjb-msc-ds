# Calendar Module
import calendar
# November 2020
nov=calendar.TextCalendar(calendar.FRIDAY)
nov.prmonth(2020,11)
# May 1992
mjb=calendar.TextCalendar(calendar.SUNDAY)
mjb.prmonth(1992,5)

# Leap Years
stDate = 1950
enDate = 2020
leaps=calendar.leapdays(stDate, enDate)
print('There have been', leaps, 'leap years from', stDate, 'to', enDate)

# Calendar for given year
year=int(input('Enter the year to display:'))
print(calendar.prcal(year))

# Print as HTML
import os
home = os.getcwd()
cal=open(home + "/cal.html","w")
c = calendar.HTMLCalendar(calendar.SUNDAY)
cal.write(c.formatmonth(1990,3))
cal.close()

# Create yearly calendar
year=int(input('Enter the year to display:'))
cal=open(home + '/year.html', 'w')
cal.write(calendar.HTMLCalendar(calendar.MONDAY).formatyear(year))