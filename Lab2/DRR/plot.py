import numpy as np
import matplotlib.pyplot as plt
from math import log

def sunarthsh(i):
    if(i==2 or i==5 or i==8):
        return (-100,4)
    else:
        return (8,8)

x = [78843453, 79666891, 459437498, 77744776, 78456123, 456943681, 79257559, 79923684, 463461777]
x = [log(j,10) for j in x]
print(x)
y = [808.9, 1091.4, 1522, 934.1, 1094.4, 1539, 871.3, 1039.6, 1586]
#y = [w * 1000 for w in y]
types = ["SLL-SLL", "SLL-DLL", "SLL-DA", "DLL-SLL", "DLL-DLL", "DLL-DA", "DA-SLL", "DA-DLL", "DA-DA"]

fig, ax = plt.subplots()
ax.scatter(x, y)

ax.set_xlabel('Mem-Accesses(log10)', fontsize=13)
ax.set_ylabel('Mem-Footprint(KB)', fontsize=13)
ax.set_title('Plot', fontsize=18)

for i, txt in enumerate(types):
    ax.annotate(txt, (x[i], y[i]), xytext= sunarthsh(i), textcoords='offset points')
    plt.scatter(x, y, marker='o', color='blue')

plt.savefig("plot.png", bbox_inches="tight")
