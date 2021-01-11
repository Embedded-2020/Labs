import seaborn as sns
import matplotlib.pyplot as plt

df = sns.load_dataset('iris')
df.head()

sns.boxplot( x=df["species"], y=df["sepal_length"], palette="Blues");
plt.show()