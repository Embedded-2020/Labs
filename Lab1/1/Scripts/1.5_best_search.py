import sys

mini = -1
mini_numbers = [0, 0]
for x in 1, 2, 3, 4, 6, 8, 9, 12, 16, 18, 24, 36, 48, 72, 144:
	for y in 1, 2, 4, 8, 11, 16, 22, 44, 88, 176:
		x= str(x)
		y= str(y)
		file = open("../Outputs/1.5/1.5_" + x + '_' + y + "_mean.txt", 'r')
		for line in file:
			if line.split(':')[0] == 'Mean':
				Check = line.split(':')[1]
				Check = Check.split(' ')[1]
				Check = Check.split('\n')[0]
				Check = float(Check)
				if (Check < mini or mini < 0):
					mini = Check
					mini_numbers = [x, y]
print(mini)
print(mini_numbers)













