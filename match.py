from datetime import datetime
import sys


# get input month and input date to compare
inputmonth = int(sys.argv[2])
inputdate = sys.argv[1].replace("\"", "")

# convert inputdate to a date instance
date = datetime.strptime(inputdate, "%Y-%m-%d")

# check if the month is less than input month
print(date.month <= inputmonth)
