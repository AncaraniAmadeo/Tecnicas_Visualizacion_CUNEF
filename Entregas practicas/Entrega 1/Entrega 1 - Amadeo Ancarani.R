library(ggplot2)

diamonds = data.frame(diamonds)

# Enunciado A)
ggplot() +
  geom_point(data=diamonds, aes(x = price, 
                                y = carat, 
                                color = cut))


# Enunciado B)
ggplot() +
  geom_histogram(data=diamonds, aes(x = price, 
                                    fill = clarity))
