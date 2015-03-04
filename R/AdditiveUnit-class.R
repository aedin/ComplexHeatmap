
# == title
# A conceptual class
#
# == detail
# This class is a super class for `Heatmap`, `HeatmapList` and `HeatmapAnnotation` classes.
#
AdditiveUnit = setClass("AdditiveUnit")


# == title
# Add two heatmaps or add row annotations as a heatmap list
#
# == param
# -x a `Heatmap` object, a `HeatmapAnnotation` object or a `HeatmapList` object.
# -y a `Heatmap` object, a `HeatmapAnnotation` object or a `HeatmapList` object.
#
# == detail
# It is only a shortcut function. It actually calls `add_heatmap,Heatmap-method`, `add_heatmap,HeatmapList-method`
# or `add_heatmap,HeatmapAnnotation-method` depending on the class of the input values.
#
# == value
# a `HeatmapList` object.
#
# == author
# Zuguang Gu <z.gu@dkfz.de>
#
"+.AdditiveUnit" = function(x, y) {
    if(inherits(x, "HeatmapAnnotation")) {
        if(y@which == "row") {
            add_heatmap(x, y)
        } else {
            stop("You should specify `which` to `row` in you add a HeatmapAnnotation which shows row annotations.")
        }
    }
    if(inherits(y, "HeatmapAnnotation")) {
        if(y@which == "row") {
            add_heatmap(x, y)
        } else {
            stop("You should specify `which` to `row` in you add a HeatmapAnnotation which shows row annotations.")
        }
    }

    add_heatmap(x, y)
}