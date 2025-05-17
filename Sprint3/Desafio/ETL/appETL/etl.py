import pandas as pd

dataframeOriginal = pd.read_csv("concert_tours_by_women.csv", encoding="utf-8")

for columns in ["Actual gross", "Adjustedgross (in 2022 dollars)", "Average gross"]:
    dataframeOriginal[columns] = dataframeOriginal[columns].astype(str).str.replace(r"[^\d.]", "", regex=True)
    dataframeOriginal[columns] = dataframeOriginal[columns].replace("", None).astype(float)

for columns in ["Artist", "Tour title"]:
    dataframeOriginal[columns] = dataframeOriginal[columns].astype(str).str.replace(r"(?:\[[^\]]*\])+?", "", regex=True)
    dataframeOriginal[columns] = dataframeOriginal[columns].str.replace("*", "", regex=False)
    dataframeOriginal[columns] = dataframeOriginal[columns].str.replace(r"[^\x00-\x7F]+", "", regex=True)
    dataframeOriginal[columns] = dataframeOriginal[columns].str.strip()

dataframeOriginal[["Start year", "End year"]] = dataframeOriginal["Year(s)"].astype(str).str.extract(r"(\d{4})(?:-(\d{4}))?")
dataframeOriginal["End year"] = dataframeOriginal["End year"].fillna(dataframeOriginal["Start year"])
dataframeOriginal[["Start year", "End year"]] = dataframeOriginal[["Start year", "End year"]].astype(int)

comuns_selected = ["Rank", "Actual gross", "Adjustedgross (in 2022 dollars)", "Artist", "Tour title", "Shows", "Average gross", "Start year", "End year"]

dataframeOriginal[comuns_selected].to_csv("/saida/dataframeLimpo.csv", index=False)

print('Dataframe criado')
