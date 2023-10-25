# Market-Basket-Analysis-for-Online-Retail-Dataset.R

Link to rpubs: https://rpubs.com/Rahila/1011747 

Association Rules Analysis for Online Retail

This project involves conducting association rules analysis on a dataset from an online retail company. The dataset encompasses transactions occurring between December 1, 2010, and December 9, 2011, for a UK-based online retail business specializing in unique all-occasion gifts. Many customers of this company are wholesalers.

The primary goals of the project are as follows:

Data Preprocessing and Cleaning: The initial step of the project involves data preparation. This includes removing transactions with non-positive unit prices, excluding specific product codes, and filtering out gift card-related entries. Additionally, data cleaning is performed on product descriptions, and certain irrelevant columns are dropped.
Data Transformation: The dataset is transformed into a basket format, where items within each transaction are aggregated into comma-separated lists. This format is suitable for conducting association rules analysis.
Frequent Item Analysis: Visualizations, in the form of item frequency plots, are generated to highlight the most commonly purchased items within the dataset.
Association Rules Discovery (Apriori Algorithm): The core of the project involves the application of the Apriori algorithm to uncover association rules. This step identifies sets of products that are frequently purchased together, subject to specified support and confidence thresholds
Rule Sorting and Visualization: The code sorts the discovered rules based on confidence and offers visualizations of these rules using various plot types, including two-key plots and parallel coordinates plots.
ECLAT Algorithm: In addition to the Apriori algorithm, the ECLAT algorithm is employed to discover frequent itemsets in the dataset. A summary of these itemsets is presented, and a parallel coordinates plot is created for the most frequent itemsets.
Customer Behavior Analysis: The project also explores the products commonly purchased alongside a specific item, such as the "REGENCY TEA PLATE GREEN." This analysis provides insights into customer purchase behavior.

The project aims to derive actionable insights from the retail dataset, assisting the online retail company in making informed decisions regarding product recommendations, inventory management, and marketing strategies. It provides a comprehensive analysis of customer behavior and product associations within the dataset.
