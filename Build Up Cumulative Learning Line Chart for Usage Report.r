linechart <- function()

{

	#setwd("D:/Ioana Google Drive/Data Analytics/FolensReports")
	# author: Ioana Ghergulescu
	stats = read.csv("line_chart_data_BU_week_39.csv")

	str(stats)
	summary(stats)

	# Prepare dataset with cumulative values
	statsCumul = stats[1:2]
	for(i in 1:length(stats$WeekNum))
	{
	  statsCumul$LearnHours[i] = sum(stats$hours[1:i], na.rm=TRUE)
	  statsCumul$Sparks[i] = sum(stats$sparks[1:i], na.rm=TRUE)
	  statsCumul$Concepts[i] = sum(stats$concepts[1:i], na.rm=TRUE)
	  statsCumul$Skillpoints[i] = sum(stats$skill[1:i], na.rm=TRUE)
	}

	# Colors of lines
	lineCols = c("red", "darkorange3", "blue", "black")

	# This is to output plot to .pdf
	pdf("cumulative_learning.pdf", width = 10, height = 4)

	# This is to output plot to .png
	png("cumulative_learning.png", unit="in", width = 10, height = 4, res=300)

	# Set ploting parameters
	par(mar=c(4, 4.5, 3, 4.5))    # plot margins (bottom, left, top, right)
	par(ps = 12)                  # Set text size
	par(cex.main = 1, cex.lab = 1, cex.axis = 0.8)    # text magnification


	# Plot Learning Hours
	plot(x = statsCumul$WeekNum, y = statsCumul$LearnHours, axes=FALSE, main="", xlab="", ylab="", type="l", lty=1, lwd=2.5, xlim=c(32,39), ylim=c(0,500), col=lineCols[1])

	# Plot number Concepts
	lines(x = statsCumul$WeekNum, y = statsCumul$Concepts, type="l", lty=2, lwd=2.5, col=lineCols[2])

	# Add 1st Y axis
	axis(side=2, lwd=1, ylim=c(0,500), at = seq(0,500,100))
	mtext(2, text="Learning Hours / Concepts", line=2.5)

	# Plot number Sparks (this will go on new y axis)
	par(new=T)
	plot(x = statsCumul$WeekNum, y = statsCumul$Sparks, axes=FALSE, main="", xlab="", ylab="", type="l", lty=4, lwd=2.5, xlim=c(32,39), ylim=c(0,80000), col=lineCols[3])

	# Plot number Skillpoints
	lines(x = statsCumul$WeekNum, y = statsCumul$Skillpoints, type="l", lty=6, lwd=2.5, col=lineCols[4])

	# Add 2nd Y axis
	options(scipen=5)
	axis(side=4, lwd=1, ylim=c(0,80000), at=seq(0, 80000, 10000))
	mtext(4, text="Sparks / Skillpoints", line=2.5)

	# Add X axis
	axis(1, pretty(range(statsCumul$WeekNum)))
	mtext("Week", side=1, col="black", line=2.5)

	# Add plot title
	title(main = "Cumulative Learning Indicators")

	# Add grid
	grid(lty=1)

	# And plot legend
	legend(x=32, y=80000, cex = 0.8, lty=c(1,2,4,6), lwd=2, seg.len=5, bg="white", col=lineCols, legend=c("Number of Learning Hours", "Number of Concepts", "Number of Sparks", "Number of Skillpoints"))

	# Draw box around plot
	box(which = "plot", col = "black", lwd = 1)

	dev.off()   # Close PDF device
	dev.off()   # Close PNG device
}