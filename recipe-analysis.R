library(tidyverse)
library(cowplot)
library(magick)
library(factoextra)

recipe_ingredients <-
  read_csv("recipe-ingredients.csv")

# ingredient amount ---------------------------------

avg_amount <-
  recipe_ingredients %>%
  group_by(ingredient, italian) %>%
  summarise(avg_amount_gram = mean(amount_gram))

ingredient_duplicate <-
  avg_amount[duplicated(avg_amount$ingredient), 1] %>%
  unlist()

p <-
  avg_amount %>%
  filter(ingredient %in% ingredient_duplicate) %>%
  ggplot(aes(x = reorder(ingredient, avg_amount_gram), y = avg_amount_gram, group = italian)) +
  geom_col(position = "dodge", col = "black", aes(fill = italian)) +
  scale_fill_manual(values = c("#999999", "#FBCD3F")) +
  labs(y = "average amount [g]", x = "") +
  coord_flip() +
  theme(text = element_text(size = 16))

ggdraw() +
  draw_image("images/pizza-hawaii.png", scale = 0.8, x = 0.1, y = -0.18) +
  draw_plot(p)

# PCA ---------------------------------

recipe_ingredients_spread <-
  recipe_ingredients %>%
  spread(ingredient, amount_gram, fill = 0) %>%
  as.data.frame()

rownames(recipe_ingredients_spread) <- recipe_ingredients_spread[,1]

res_pca <-
  recipe_ingredients_spread %>%
  select(-italian) %>%
  select(-product_final) %>%
  prcomp(scale = TRUE)

groups <- as.factor(recipe_ingredients_spread$italian)

fviz_eig(res_pca)

fviz_pca_ind(res_pca,
             col.ind = groups, # color by groups
             palette = c("#999999", "#FBCD3F"),
             addEllipses = TRUE, # Concentration ellipses
             ellipse.type = "confidence",
             legend.title = "italian",
             repel = TRUE     # Avoid text overlapping
)

