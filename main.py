import pandas as pd
import matplotlib.pyplot as plt

df=pd.read_csv("drug_adverse_events.csv")
df.head()


##  Most Common Drug Reports
print(df["Drug_Name"].value_counts())


print(df["Severity"].value_counts())


print(df["Hospitalization"].value_counts())

#ADR Frequency by Drug

df["Drug_Name"].value_counts().plot(kind="bar")
plt.title("Adverse Event Reports by Drug")
plt.xlabel("Drug Name")
plt.ylabel("Count")
plt.show()

## Severity Distribution
df["Severity"].value_counts().plot(kind="pie", autopct="%1.1f%%")
plt.title("Severity Distribution")
plt.ylabel("")
plt.show()

##Hospitalization by Drug
pd.crosstab(df["Drug_Name"], df["Hospitalization"]).plot(kind="bar")
plt.title("Hospitalization by Drug")
plt.xlabel("Drug Name")
plt.ylabel("Count")
plt.show()

##ADVANCED ANALYSIS:
severe_cases = df[df["Severity"] == "Severe"]
severe_cases["Drug_Name"].value_counts().plot(kind="barh")
plt.title("Severe Adverse Events by Drug")
plt.xlabel("Severe Case Count")
plt.ylabel("Drug Name")
plt.show()