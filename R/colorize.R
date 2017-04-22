#' @rdname colorize
#' @title Colorize a source text
#' @description Summarize a text model by visualizing a source text
#' @param data A data frame containg something summarizing a model.
#' @param text A character vector specifying a source text to format.
#' @param color A character string specifying a variable name from \code{data} to be used in dictating the font color of the text.
#' @param background A character string specifying a variable name from \code{data} to be used in dictating the background color of the text.
#' @param bold A character string specifying a variable name from \code{data} to be used in dictating whether to bold the text.
#' @param italic A character string specifying a variable name from \code{data} to be used in dictating whether to italicize the text.
#' @param underline A character string specifying a variable name from \code{data} to be used in dictating whether to underline the text.
#' @param font A character string specifying a variable name from \code{data} to be used in dictating the font face/family of the text.
#' @param size A character string specifying a variable name from \code{data} to be used in dictating the fotn size of the text.
#' @param format A character string specifying an output format.
#' @param snippet A logical indicating whether to provide just a code snippet (the default) or a complete document.
#' @param \dots TBD
#' @details
#' LaTeX support requires the \samp{xcolor} package in the document header.
#' 
#' @examples
#' 
#' @import stringi
#' @import crayon
#' @export
colorize <- 
function(data, 
         text, 
         color,
         background,
         bold,
         italic,
         underline,
         format = c("html", "latex", "shiny", "console"),  # console == crayon
         snippet = TRUE,
         ...) {

    
    # stri_replace_all_fixed(string, pattern, replacement)
    # stri_replace_all_regex(string, pattern, replacement)
    
    # determine format
    format <- mathch.arg(format)
    if (format == "html") {
        out <- text
        
        # <span class="something">text</span>
        
        if (isTRUE(snippet)) {
            # snippet
            
            
        } else {
            # complete document
        }
        
        
    } else if (format == "latex") {
        out <- text
        
        # \colorbox{blue!30}{text}
        # \textcolor{blue!30}{text}
        
        
        if (isTRUE(snippet)) {
            # snippet
        } else {
            # complete document
        }
        
    } else if (format == "shiny") {
        out <- text
    } else if (format == "console") {
        out <- text
    }
    
    return(out)
}

#' @rdname colorize
#' @export
colorise <- colorize
