#' @rdname colorize
#' @title Colorize a source text
#' @description Summarize a text model by visualizing a source text
#' @param data A data frame containg something summarizing a model.
#' @param tokens A character string specifying the column in \code{data} that contains tokens/words/etc. to colorize.
#' @param source A character vector specifying a source text to format.
#' @param background A character string specifying a variable name from \code{data} to be used in dictating the background color of the text.
#' @param color A character string specifying a variable name from \code{data} to be used in dictating the font color of the text.
#' @param bold A character string specifying a variable name from \code{data} to be used in dictating whether to bold the text.
#' @param italic A character string specifying a variable name from \code{data} to be used in dictating whether to italicize the text.
#' @param underline A character string specifying a variable name from \code{data} to be used in dictating whether to underline the text.
#' @param font A character string specifying a variable name from \code{data} to be used in dictating the font face/family of the text.
#' @param size A character string specifying a variable name from \code{data} to be used in dictating the fotn size of the text.
#' @param format A character string specifying an output format.
#' @param snippet A logical indicating whether to provide just a code snippet (the default) or a complete document.
#' @param color_palette A color palette to use in colorization.
#' @param background_palette A color palette to use in colorization.
#' @param \dots TBD
#' @details
#' LaTeX support requires the \samp{xcolor} package in the document header.
#'
#' @examples
#' data("billSection", package = "textcolor")
#' colorize(test_data, tokens = "terms", background = "class", source = document)
#' 
#'
#' @import stringi
#' @import viridis
#' @import crayon
#' @export
colorize <- 
function(data, 
         tokens,
         source, 
         background = NULL,
         color = NULL,
         bold = NULL,
         italic = NULL,
         underline = NULL,
         format = c("html", "latex", "shiny", "console"),  # console == crayon
         snippet = TRUE,
         color_palette = "black",
         background_palette = NULL,
         ...) {

    # extract text column as vector
    tokens <- data[[tokens]]
    
    # construct palettes if needed
    background <- data[[background]]
    if (is.null(background_palette)) {
        background <- viridis::viridis(n = length(background))
    }
    if (!is.null(color_palette)) {
        color_palette <- viridis::viridis(length(tokens))
    } else if (length(color_palette) != length(tokens)) {
        color_palette <- rep(color_palette, length.out = length(tokens))
    }
    if (!is.null(color)) {
        color <- data[[color]]
        if (length(color_palette) != length(color)) {
            stop("color palette is not the right length")
        }
    } else {
        color <- color_palette
    }
    if (!is.null(bold)) {
        bold <- data[[bold]]
    }
    if (!is.null(italic)) {
        italic <- data[[italic]]
    }
    if (!is.null(underline)) {
        underline <- data[[underline]]
    }
    
    # determine format
    format <- match.arg(format)
    if (format == "html") {
        # make open/close formats
        fmt <- format_html(color = color, background = background, bold = bold, italic = italic, underline = underline)
        
        # apply them
        out <- apply_formatting(source, tokens, replacement = paste0(fmt$open, tokens, fmt$close))
        
        if (!isTRUE(snippet)) {
            # put into complete document
            
        }
        
    } else if (format == "latex") {
        # make open/close formats
        fmt <- format_latex(color = color, background = background, bold = bold, italic = italic, underline = underline)
        #print(fmt)
        # apply them
        out <- apply_formatting(source, tokens, replacement = paste0(fmt$open, tokens, fmt$close))
        
        if (!isTRUE(snippet)) {
            # put into complete document
            
        }
        
    } else if (format == "console") {
        # make open/close formats
        fmt <- format_console(color = color, background = background, bold = bold, italic = italic, underline = underline)
        
        # apply them
        out <- apply_formatting(source, tokens, replacement = paste0(fmt$open, tokens, fmt$close))
        
    }

    return(out)
}

#' @rdname colorize
#' @export
colorise <- colorize


