# Decor

Decor is a simple drawing library that allows you to quickly create paintings and animate them.

Your main.lua file must include the following functions in their respective love functions
decor.load()
decor.update(dt)
decor.draw()
decor.keypressed(key)


To load a painting, simply call
decor.frame(paintingName)


To make screenshots of a painting, call this function
shutter.snap(amount, folderName, screenshotRate)
