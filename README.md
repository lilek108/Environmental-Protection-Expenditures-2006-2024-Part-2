# Environmental Protection Expenditures (2006 - 2024) - Part 2: Exploratory Data Analysis (EDA)

# Project Background

Environmental protection expenditures reflect government priorities in addressing ecological challenges such as air quality, water management, waste treatment, and climate-related initiatives.

This project represents the second part of the analysis based on the same official dataset from the Czech Statistical Office (https://csu.gov.cz/domov). While the [first project](https://github.com/lilek108/Environmental-Protection-Expenditures-2006-2024-Part-1) focused on aggregated public spending and dashboard-based reporting, this study dives deeper into the dataset through EDA.
The objective of this phase is to investigate data structure, confidentiality patterns, and structural relationships between regions, programs, and expenditure types. Special attention is given to confidential transactions, where financial amounts are not publicly disclosed, and to understanding how their presence may influence analytical conclusions.

Key analysis questions:

Confidential Transactions Analysis:
  * How has the number of confidential transactions evolved over time?
  * How are confidential transactions distributed across environmental programs/regions/expenditure types
  * Are certain programs or regions disproportionately associated with confidential payments?

Structural Relationships in Public Expenditures:
  * What structural relationship exists between regions and environmental programs in terms of allocated funding?
  * Are specific programs concentrated in particular regions?
  * How do expenditure types vary across regions?

# Data Structure and Overview

The dataset was obtained from the official website of the Czech Statistical Office ([link available here](https://csu.gov.cz/produkty/naklady-na-ochranu-zivotniho-prostredi-a-ekonomicky-prinos-techto-aktivit)). The source page also provides detailed documentation describing individual columns and dimensional tables.

The database structure used in this analysis is identical to the one described in [Project 1](https://github.com/lilek108/Environmental-Protection-Expenditures-2006-2024-Part-1), where the full data model, table descriptions, and relationships are explained in detail. A visual representation of the relational schema is provided below.

<img width="639" height="569" alt="eco_data_scheme" src="https://github.com/user-attachments/assets/f77994b9-89aa-46db-a31e-837dbd0e6706" />

<br>
<br>

For a comprehensive explanation of all tables and dimensional mappings, please refer to the first project.

For the purposes of this EDA-focused study, a dedicated SQL transformation script (eco_full_table.sql) was used to extract and aggregate the required subset of data from the prepared PostgreSQL database.

The script generates a CSV file (eco_full_table.csv) with the following structure:

<img width="254" height="173" alt="image" src="https://github.com/user-attachments/assets/3ceff7c5-524e-4f9f-a35d-d1d398d9315e" />

<br>
<br>

The complete analytical workflow, including data preparation steps, transformations, visualizations, and exploratory procedures, is documented in the attached Python notebook (eco_EDA.ipynb).

# Executive Summary

Over the observed period, **the number of transactions increased**, while the **proportion of public (amount-disclosed) transactions declined**. As a result,although **activity intensified**, the **share of financially transparent transactions decreased**.

**Funding disparities** across regions and programs are **driven primarily by transaction size rather than transaction count**. Because a meaningful share of transactions is **confidential and lacks disclosed amounts**, the true distribution of funds **may be partially understated or distorted**.

When focusing strictly on public transactions with known amounts, financing appears **concentrated in waste-related programs** and structurally centralized, with a **substantial share allocated at the national level** and **Prague emerging as the dominant region once national-level expenditures are excluded**. National-level allocations, as well as Waste Management and Wastewater Management, remain comparatively transparent due to their relatively low proportion of confidential transactions. However, all structural conclusions should be interpreted in light of varying transparency levels across regions and programs.

# Insights 

**1. Confidential Transactions YoY Change**

*The share of transactions with undisclosed amounts increased significantly in the early years of the dataset. Although this proportion has remained relatively stable over the past decade, it is notably higher than in the initial years, indicating a lasting shift toward a greater presence of non-disclosed expenditures.*

The total number of environmental transactions increased steadily until 2014. From 2014 to 2023, the overall transaction volume remained relatively stable, followed by a noticeable decline in 2024.

<img width="631" height="462" alt="Screenshot 2026-02-02 at 13 41 39" src="https://github.com/user-attachments/assets/f5deb5f6-61ee-4b92-a0d7-95b47b01ebc6" />

<br>
<br>

A similar pattern is observed for public transactions : growth until 2014, a prolonged plateau, and a decrease in 2024, while the count of confidential transactions approxiamately stabilised already in 2010 with the same decrease pattern in 2024.

<img width="629" height="461" alt="Screenshot 2026-02-02 at 13 42 12" src="https://github.com/user-attachments/assets/8965426a-0d7a-46e1-8a34-b0fc13142124" />

*'duverny'(blue) = confidential, 'verejny'(yellow) = public*

<br>
<br>

When examining the share of confidential transactions in total transaction volume, a different dynamic emerges. The proportion of confidential payments increased sharply until 2010, reaching its peak that year. Afterward, it stabilized at approximately 16%, fluctuating slightly but remaining relatively constant in subsequent years.

<img width="628" height="464" alt="Screenshot 2026-02-02 at 13 42 52" src="https://github.com/user-attachments/assets/ee40ce25-586d-4e06-8915-ddfe3aaeecdc" />

<br>
<br>

**2. Confidential Transactions Distribution**

*When aggregated across all years, the total number of transactions per region and per program remains broadly similar. This indicates that disparities in environmental funding are not primarily driven by transaction frequency, but by the monetary size of individual transactions (see Part 1 for detailed funding distribution analysis).*

This finding increases the analytical importance of confidential transactions. Since confidential records do not disclose monetary amounts, their proportional presence becomes structurally significant: if funding differences are driven by transaction size rather than count, a higher share of confidential transactions may materially distort conclusions about actual financial allocation

While the total number of transactions remains broadly similar across regions and programs, the share of confidential transactions differs significantly, indicating that confidentiality is not evenly distributed across the system.

<img width="624" height="466" alt="Screenshot 2026-02-02 at 19 40 14" src="https://github.com/user-attachments/assets/161db3f5-891b-420e-92d2-f6b2732c31c4" />
<img width="626" height="467" alt="Screenshot 2026-02-02 at 19 41 40" src="https://github.com/user-attachments/assets/7f8b0916-9a29-4b89-9aac-318dbad21024" />
<img width="574" height="849" alt="Screenshot 2026-02-02 at 19 43 31" src="https://github.com/user-attachments/assets/34700646-3075-4c35-95b7-059e1fb620af" />
<img width="575" height="844" alt="Screenshot 2026-02-02 at 19 43 53" src="https://github.com/user-attachments/assets/f2efa2d4-79da-4c7f-a652-c8b634a9c99a" />

*'duverny'(blue) = confidential, 'verejny'(yellow) = public*

<br>
<br>

Certain regions — particularly Karlovy Vary (>22%), Prague (≈20%), and Liberec (≈20%) — exhibit substantially higher proportions of undisclosed transactions compared to others. In contrast, transactions without a specified regional allocation (Česká republika) show the lowest confidentiality share.

<img width="628" height="463" alt="Screenshot 2026-02-02 at 19 45 38" src="https://github.com/user-attachments/assets/b5633989-bb91-4be2-bae6-f47f99e1f0ba" />

<br>
<br>

A similar concentration appears at the program level: Radiation Protection (≈28%) display the highest shares of confidential transactions, whereas Waste Management and Wastewater Management remain among the most transparent categories.

<img width="568" height="846" alt="Screenshot 2026-02-02 at 19 46 11" src="https://github.com/user-attachments/assets/92b7d60b-9264-4e44-a062-38294d3f70e5" />

<br>
<br>

By expenditure type, transaction volumes are structurally uneven, confidentiality level is relatively low in Non-investment environmental protection expenditure (≈10%), while the most "confidential" category is Revenues from sale of by-products (>20%).

<img width="630" height="466" alt="Screenshot 2026-02-02 at 19 47 07" src="https://github.com/user-attachments/assets/ea90f9a8-d9c7-4a89-b89c-d0e8e991a9c8" />
<img width="628" height="469" alt="Screenshot 2026-02-02 at 19 47 25" src="https://github.com/user-attachments/assets/1f23a7d3-969c-4a36-b6ac-812388428079" />

<br>
<br>

**3. Exposure of the Relationship Between Regional/Program/Expense type Characteristics**

*Environmental expenditures are structurally centralized besides a few special cases, while confidential transactions distort true program and regional priorities.*

**a. Programs by Regions and Regions by Programs**

The matrix showing the distribution of regional expenditures across programs **(where 100% of each region’s spending is divided among programs)** confirms that **Waste Management and Wastewater Management dominate most regional spending structures**, reinforcing conclusions from the first part of the analysis. These two areas represent the structural backbone of environmental financing across the country.

<img width="1255" height="789" alt="Screenshot 2026-02-02 at 23 48 34" src="https://github.com/user-attachments/assets/e4745f9f-7731-4d03-9934-27f656ca21b5" />

<br>
<br>

It is noteworthy that in the **Liberec Region (Liberecký kraj)**, **35% of total regional expenditures** are allocated to **Protection and Rehabilitation of Soil, Underground and Surface Water**. At the same time, approximately **30%** of transactions within this program-region combination are **confidential**, so the real monetary importance of this program in the Liberec Region is **likely higher than observed in disclosed data**.

<img width="1254" height="791" alt="Screenshot 2026-02-02 at 23 52 50" src="https://github.com/user-attachments/assets/f73fea5f-5591-4381-901a-ae12ddc5626d" />

<br>
<br>

When examining the inverse matrix, **where 100% of each program’s expenditures is distributed across regions**, a large share of spending is classified at the **national level without specific regional assignment**. This confirms the structural centralization already observed in the first project. Among region-specific allocations, **31% of all expenditures on Limitation of Noise and Vibration are concentrated in Prague (Hlavní město Praha)**, which aligns with expectations given the capital’s urban density and infrastructure characteristics.

**Radiation Protection** presents the most extreme case of centralization. Approximately **80% of total expenditures** in this program are allocated at the **national level** rather than assigned to individual regions. Moreover, this program also has one of the **highest proportions of confidential transactions**, implying that its **true financial scale may be significantly underestimated**. When national-level spending is excluded and only region-specific allocations are considered, **98% of Radiation Protection expenditures are directed to Prague**, demonstrating near-total concentration within a single region.

<img width="1308" height="791" alt="Screenshot 2026-02-03 at 00 00 24" src="https://github.com/user-attachments/assets/319953ff-b0f1-46bc-b29c-3b711b1feefc" />
<img width="1310" height="788" alt="Screenshot 2026-02-03 at 00 00 53" src="https://github.com/user-attachments/assets/eb4be893-7ef1-4f56-b83d-a5bc567227ce" />

<br>
<br>

A similar but more transparent concentration is observed in **Research and Development for Environmental Protection**, where **52% of expenditures** are allocated to the **Středočeský Region**. Unlike Radiation Protection, this program exhibits a relatively **low share of confidential transactions (18%)**, suggesting that the observed concentration reflects the more reliable estimation.

Overall, program-level analysis indicates that environmental financing is mostly geographically unlocalized, with Prague emerging as the dominant regional beneficiary once national allocations are excluded.

**b. Expenditure Types by Regions and Regions by Expenditure Types**

The distribution of regional expenditures across expenditure types shows that **Non-Investment Environmental Protection Expenditure constitutes the dominant category across the regions**. Importantly, this category has a **very low proportion of confidential transactions**. This strengthens confidence that its observed dominance reflects actual financial structure, however the higher share of confidental transactions for other types of expenses may lead to falsely high share values for this expenditure type.

<img width="1257" height="788" alt="Screenshot 2026-02-03 at 00 23 48" src="https://github.com/user-attachments/assets/69b60423-6e42-4c18-a887-686f0c6f23c6" />
<img width="1260" height="785" alt="Screenshot 2026-02-03 at 00 24 15" src="https://github.com/user-attachments/assets/01586501-bc17-4986-8527-cda398bf047a" />

<br>
<br>

When examining the inverse distribution, where total expenditures of each type are allocated across regions, **the same pattern of national-level centralization reappears**. A substantial share of expenditures is not assigned to specific regions but categorized at the level of the Czech Republic as a whole. Once these national allocations are excluded, **Prague again emerges as the principal regional recipient**.

An additional notable concentration appears in the **Moravian-Silesian Region (Moravskoslezský kraj)**, which accounts for **46%** of all **Capitalized output**.

<img width="1304" height="792" alt="Screenshot 2026-02-03 at 00 40 19" src="https://github.com/user-attachments/assets/d1645a32-9081-47aa-9278-44c6d6868200" />
<img width="1300" height="789" alt="Screenshot 2026-02-03 at 00 40 42" src="https://github.com/user-attachments/assets/1fbaf2ff-ec04-4ea0-820d-0b4941438587" />

<br>
<br>

Taken together, the analysis of both programmatic and expenditure-type structures demonstrates that environmental financing in the Czech Republic is characterized by overall decentralization, geographic concentration, and selective program prioritization. At the same time, the uneven distribution of confidential transactions introduces asymmetrical uncertainty, meaning that some programs and regions may be systematically undervalued in observed data.


