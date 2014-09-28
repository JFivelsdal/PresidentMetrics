
library(ggplot2)
#Top 10 Youngest President script

agePres <- c(42 + 322/365, 43 + 236/365,
                  46 + 154/365, 47 + 169/365,
                  47 + 351/365,48 + 101/365,
                  49 + 105/365, 49 + 122/365,
                  50 + 183/365, 51 + 6/365)

namePres <- c("Theodore Roosevelt", "John F. Kennedy","Bill Clinton","Ulysses S. Grant",
              "Barack Obama","Grover Cleveland","Franklin Pierce","James A. Garfield",
              "James K. Polk","Millard Fillmore")

dataPres <- data.frame(namePres,agePres)

#dataPres[,1] <- as.character(dataPres[,1])
dataPres[,2] <- as.numeric(dataPres[,2])

presPlot
colnames(dataPres) <- c("Name","Age")

minAge <- min(dataPres[,2])

maxAge <- max(dataPres[,2])

minPres <- as.character(dataPres[which(dataPres$Age==minAge),1])

maxPres <- as.character(dataPres[which(dataPres$Age==maxAge),1])


presPlot <- ggplot(data = dataPres,aes(x = reorder(Name,Age),y = Age,fill = Name)) +
            geom_bar(stat = "identity") #+  ylim(minAge-1,maxAge + 1)

presPlot <- presPlot + ggtitle("The Ten Youngest Presidents of the United States") +
            theme(plot.title = element_text(size = rel(2.0),lineheight = 0.9,
                                            family = "Times",face = "bold.italic"))


presPlot <- presPlot + xlab("Name of President")

presPlot <- presPlot + theme(axis.title = element_text(size = 18))

presPlot <- presPlot + theme(axis.text.x = element_text(angle = 52,hjust = 1,vjust = 1,face = "bold",size = 14,colour = "blue"))

presPlot <- presPlot + scale_fill_discrete() +
            coord_cartesian(ylim = c(minAge-1,maxAge + 1))


presPlot <- presPlot + guides(fill = FALSE)


