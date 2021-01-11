#!/bin/bash
#!/bin/sh

for i in {1..10}; 
do
	cd ..

	./phods >> ./Outputs/1.3/helper.txt

	cd Scripts
done

###################################################################cleanup###################################################################
cd ..
cd Outputs/1.3
cat helper.txt > "1.3.txt"

rm helper.txt

cd ../..
cd Scripts
###############################################################Mean_Calculation##############################################################

MeanCalc="./Mean.py"

/bin/bash -c "python3 $MeanCalc 1.3" 