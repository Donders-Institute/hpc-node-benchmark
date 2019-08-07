library(ggplot2)

data <- read.table("plot.dat", quote="\"", comment.char="")

p <- ggplot(data=data) +
     geom_point(mapping=aes(x=V2, y=V3, color=V1)) + 
     geom_errorbar(mapping=aes(x=V2,ymin=V3-V4,ymax=V3+V4,color=V1)) + 
     labs(x="# jobs", y="elapsed time (sec)", title="FieldTrip") + 
     theme(legend.title = element_blank()) +
     coord_cartesian(ylim=c(10,50))

ggsave("fieldtrip.eps", width=5, height=5, units="in", dpi=300)
