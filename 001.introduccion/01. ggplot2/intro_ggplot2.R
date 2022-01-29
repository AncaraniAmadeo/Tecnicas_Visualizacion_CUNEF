library(ggplot2)

help(mtcars)
View(mtcars)

ggplot(mpg, aes(class)) + geom_bar()

ggplot(mpg, aes(x=class, y=displ)) +
  geom_point()


ggplot(mpg, aes(x=class)) + geom_bar(fill="blue")

# Primera tarea, cambiar el parametro fill
ggplot(mpg, aes(x=class, fill="blue")) + geom_bar()
# esto es porque lo toma como variable categorica, como solo la considera 1 variable y por eso 
# es que solo pone una leyenda con el blue 
  
# Si lo ubicamos fuera de aes, no genera error pero tampoco nos modifica el grafico
ggplot(mpg, aes(x=class), fill="blue") + geom_bar()

ggplot(mpg, aes(x=class, fill=c("xxx", "yyy"))) + geom_bar()
# error porque debe recibir algo de length 1 o el mismo largo que el dataset

ggplot(mpg, aes(class))
# el grafico esta vacio, el grafico recibe solo el eje de las x, por eso no genera grafico

help("aes")

ggplot(mpg, aes(class)) + geom_point()
# de aes falta la y

"ggplot(mpg, aes(class)) = ggplot(mpg, aes(x=class))"
# esto siempre se cumple para aes

ggplot(mpg, aes(x=class, y=displ)) +
  geom_point()

ggplot(mpg, aes(x=cty,
                y=displ,
                size=hwy,
                color=class)) +
  geom_point()

ggplot(mpg,aes(x=cty, y=displ)) +
  geom_bar() +
  geom_point()
  


ggplot(mpg, aes(x=cty)) +
  geom_bar(fill="grey") +
  geom_point(aes(y=displ, size=hwy, color=class))

# prueba, que sale mal porque invertimos el orden de las capas
ggplot(mpg, aes(x=cty)) +
  geom_point(aes(y=displ, size=hwy, color=class)) +
  geom_bar(fill="grey")
  

ggplot(mpg, aes(x=cty)) +
  geom_bar(fill="grey") +
  geom_point(aes(y=displ, size=hwy, color=class), alpha=0.5)

x <- data.frame(
  x=rnorm(5000),
  y=rnorm(5000)
)

ggplot(x, aes(x=x, y=y)) +
  geom_point(alpha=0.13)

ggplot(x, aes(x=x, y=y)) +
  geom_jitter()


ggplot(mpg) +
  geom_bar(aes(x=class, y=cty),
           stat="summary",
           fun="max")

ggplot(mpg) +
  stat_summary(aes(x=class, y=cty), 
               fun=mean,
               geom="point")

ggplot(mpg, aes(x=cty, y=displ)) +
  geom_point() + 
  stat_smooth(method="lm")


ggplot(mpg, aes(x=cty,y=displ)) +
  geom_point() +
  facet_grid(. ~ year)

ggplot(mpg, aes(x=cty,y=displ)) +
  geom_point() +
  facet_wrap(~manufacturer, ncol=3)



ggplot(mpg, aes(x=cty)) +
  geom_point(aes(y=displ, size=hwy, color=class), alpha=0.2)

ggplot(mpg, aes(x=cty)) +
  geom_jitter(aes(y=displ, size=hwy, color=class))

ggplot(mpg, aes(x=cty,y=displ)) +
  geom_density2d() +
  geom_jitter()

ggplot(mpg, aes(x=cty, y=displ)) +
  geom_point() +
  facet_grid(.~year)


ggplot(mpg, aes(x=cty, y=displ)) +
  geom_point() +
  facet_grid(year~.)

ggplot(mpg, aes(x=cty, y=displ)) +
  geom_point() +
  facet_grid(year~.)


ggplot(mpg, aes(x=cty, y=displ)) +
  geom_point() +
  facet_grid(year + class ~ .)

ggplot(mpg, aes(x=cty, y=displ)) +
  geom_point() +
  facet_grid(year ~ class)



ggplot(mpg, aes(x=cty, y=displ)) +
  geom_point() +
  facet_grid(year ~ class) +
  scale_x_log10()








