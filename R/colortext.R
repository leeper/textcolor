#' @rdname colorize
#' @title Colorize a source text
#' @description Summarize a text model by visualizing a source text
#' @param data A data frame containg something summarizing a model.
#' @param format A character string specifying an output format.
#' @param text A character vector specifying a source text to format.
#' @param \dots TBD
#' @examples
#' 
#' @importFrom 
#' @export
colorize <- 
function(data, 
         text, 
         format = c("html", "latex", "shiny", "console"),  # console == crayon
         ...) {

    # determine format
    format <- mathch.arg(format)
    if (format == "html") {
        out <- text
    } else if (format == "latex") {
        out <- text
    } else if (format == "shiny") {
        out <- text
    } else if (format == "console") {
        out <- text
    }
    
    # things to control
    # - font color
    # - font background color
    # - bold
    # - italics
    # - underlining
    # - size 
    # - font

    return(out)
}

#' @rdname colorize
#' @export
colorise <- colorize
