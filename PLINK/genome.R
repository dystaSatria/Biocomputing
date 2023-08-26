install.packages("tidyverse", dependencies = TRUE)

library(tidyverse)
 
?mgp

ggplot(data= mpg) +
  geom_point(mapping = aes(x = displ, y = hwy, color = class))
