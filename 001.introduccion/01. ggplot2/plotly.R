library(plotly)
plot_ly(z = ~volcano) %>% add_surface()

miGraficaFavorita <- ggplot(mpg, aes(x=cty)) +
  geom_point(aes(y=displ, size=hwy, color=class), alpha=0.3)


ggplotly(miGraficaFavorita)
