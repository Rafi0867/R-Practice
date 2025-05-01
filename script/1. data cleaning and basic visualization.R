if(!require("pacman")) install.packages("pacman")
pacman::p_load(
  tidyverse,
  dplyr,
  ggplot2,
  starwars
)  

# different ways to view data
data("starwars")
glimpse(starwars)

# the most cleanest way to view data
View(starwars)

head(starwars)
starwars$name
names(starwars)

starwars %>% select(name, gender, species, height, hair_color) %>%
  filter(species == "Human") %>%
  drop_na() %>%
  unique(hair_color)



unique(starwars$species)

starwars %>%
  select(hair_color, height, species, sex) %>%
  drop_na() %>%
  mutate(species = as.factor(species),
         sex = as.factor(sex),
         sex = fct_recode(sex,
                          "Female" = "female",
                          "Male" = "male",
         )) %>%
  filter(sex != "none" & species == "Human" & hair_color != "none") %>%
  group_by(sex) %>%
  ggplot()+
  geom_boxplot(aes(x = sex, y = height))+
  geom_jitter(aes(x = sex, y = height, color = hair_color)) +
  labs(
    x = "Sex",
    y = "Height",
    color = "Hair Color"
  ) +
  theme_bw()



# will be continued