# Program to Read Weather CSV Data
def main():
    import csv
    with open("../weather.csv",'r') as infile:
        reader = csv.reader(infile)
        header_row = next(reader)
        for index, column_header in enumerate(header_row):
            print(index, column_header)
        Temp = []
        for row in reader:
            Temp.append(float(row[4]))
        print(Temp)
    infile.close()

main()