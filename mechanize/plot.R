## Bar chart of scores
scores <- read.csv("scores.csv", colClasses = c("character", "numeric"), col.names = c("user", "score"), header=FALSE)
x <- barplot(scores$score)
userlabels = as.vector(scores$user)
head(scores)
text(cex=0.5, x=x, y=-3.75, userlabels, xpd=TRUE, srt=90)


## Line chart of scores
data <- read.csv("records.csv", col.names=c("user", "score", "timestamp"), colClasses = c("factor", "numeric", "character"), header=FALSE)
data$timestamp <- strptime(data$timestamp, "%Y-%m-%dT%H:%M:%S")
uniqueDates <- unique(dt)

plotDrawn <- FALSE

xRange <- range(data$timestamp)
yRange <- range(data$score)

for (user in levels(data$user)) {
  userData = data[data$user == user,]
  if (plotDrawn) {
    ## lines(x=userData$timestamp, y=userData$score)
  }
  else {
    plot(x=userData$timestamp, y=userData$score, type="l")
    print(userData)
    plotDrawn <- TRUE
  }
}
