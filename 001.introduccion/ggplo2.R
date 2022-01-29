# 
# Unicode: UTF8 es tu amigo (encoding más internacional)

library(ggplot2) 

mpg
mtcars

# sirve para no cargar la librería
ggplot2::aes

ggplot(mpg, aes(class)) + geom_bar()


miFuncion <- function(calamar) {calamar+2}

miFuncion(calamar=5)



ggplot(mpg, aes(class)) + geom_point()

ggplot(mpg, aes(x=displ, y=class)) + geom_point()


ggplot(mpg, aes(x=cty, y=displ, size=hwy, color=class)) + geom_point()


ggplot(mpg, aes(x=cty, y=displ, size=hwy)) + geom_point(color="red")


ggplot(mpg, aes(x=cty)) +
  geom_bar(fill="grey") +
  geom_point(aes(y=displ, color=class, size=hwy))

ggplot(mpg, aes(x=cty, y=displ)) +
  geom_point() +
  theme_dark()




## Ggplot2 y variables

base <- ggplot(mpg, aes(x=cty, y=displ))

base +
  geom_hex()

base +
  geom_density2d()


base +
  stat_smooth()

base +
  stat_smooth(method="lm")



## Plot.ly
library(plotly)


mi_grafica <-   ggplot(mpg, aes(x=cty, y=displ)) +
  geom_point()


ggplotly(mi_grafica)


movies
library(ggplot2)

faithful
