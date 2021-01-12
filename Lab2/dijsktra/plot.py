import numpy as np
import matplotlib.pyplot as plt
from math import log

x = [113274899, 113449694, 152153391]
x = [log(j,10) for j in x]
print(x)
y = [467.5, 582.1, 471.7]
#y = [w * 1000 for w in y]
types = ["SLL", "DLL", "DA"]

fig, ax = plt.subplots()
ax.scatter(x, y)

ax.set_xlabel('Mem-Access(log10)', fontsize=13)
ax.set_ylabel('Mem-Footprint(KB)', fontsize=13)
ax.set_title('Plot', fontsize=18)

for i, txt in enumerate(types):
    ax.annotate(txt, (x[i], y[i]), xytext= (8,8), textcoords='offset points')
    plt.scatter(x, y, marker='o', color='blue')

plt.savefig("plot.png", bbox_inches="tight")
