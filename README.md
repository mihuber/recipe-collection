# The mystery of true-italian and pseudo-italian recipes

![spaghetti](images/spaghetti-napoli.jpg)

## aim
We tried to understand the differences between true-italian and pseudo-italian recipes.  
The analysis are based on a [tidy list](recipe-ingredients.csv) of selected recipes, their ingredients and amount.  
Based on the knowledge of which recipe is true- and which is pseudo-italian we try to find the ***italian-factor***.

## analyses
### looking at average ingredient-amounts
The average ingredient-amount of all ingredients which are present in at least one true- and one pseudo-italian recipe were compared:  

![average_amount](plots/average_amount.png)

No clear ***italian-factor*** apparent.  
But small differences were visible. Amongst others, Pseudo-italian recipes seem to contain a bit more beef, tomatoes and a bit less spaghetti.

### PCA
Using PCA, we hoped to find two clusters containing the true- and pseudo-italian recipes.

![pca](plots/pca.png)

There is a cluster of true-italian recipes.

But the problem is highly complex, as the eigenvalues/variances of dimensions show:

![pca](plots/pca-eigenvalues.png)

## summary
A clear ***italian-factor*** still remains a mystery. We failed to find one factor with the applied methods.

## outlook
If we'll find the ***italian-factor*** which defines a true-italian recipe, one could make predictions based on ingredients/amounts of an unknown recipe.
