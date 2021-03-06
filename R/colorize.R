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
#' @param \dots TBD
#' @details
#' LaTeX support requires the \samp{xcolor} package in the document header.
#'
#' @examples
#' data("billSection", package = "textcolor")
#' colorize(test_data[!test_data$terms %in% c("a", "an"),], tokens = "terms", background = "class", source = document)
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
         ...) {
         
    # extract text column as vector
    tokens <- data[[tokens]]
    
    # construct palettes if needed
    if (is.null(background)) {
        background <- rep("black", nrow(data))
    } else {
        #background <- viridis::viridis(n = length(tokens))
        u <- unique(data[[background]])
        pal <- substr(grDevices::rainbow(n = length(u)), 1, 7)
        tmp <- character(nrow(data))
        for (i in seq_along(u)) {
            tmp[data[[background]] == u[i]] <- pal[i]
        }
        background <- tmp
    }
    if (is.null(color)) {
        color <- rep("white", nrow(data))
    } else {
        u <- unique(data[[color]])
        #color <- viridis::viridis(n = length(tokens))
        pal <- substr(grDevices::rainbow(n = length(u)), 1, 7)
        tmp <- character(nrow(data))
        for (i in seq_along(u)) {
            tmp[data[[color]] == u[i]] <- pal[i]
        }
        color <- tmp
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
        out <- apply_formatting(source, tokens, open = fmt$open, tokens = tokens, close = fmt$close)
        
        # TODO: handle paragraphs!
        
        if (!isTRUE(snippet)) {
            # put into complete document
            
        }
        
    } else if (format == "latex") {
        # make open/close formats
        
        ## TODO: colors are html colors!!!
        
        fmt <- format_latex(color = color, background = background, bold = bold, italic = italic, underline = underline)
        #print(fmt)
        
        # apply them
        out <- apply_formatting(source, tokens, open = fmt$open, tokens = tokens, close = fmt$close)
        
        # TODO: handle paragraphs!
        
        if (!isTRUE(snippet)) {
            # put into complete document
            
        }
        
    } else if (format == "console") {
        # make open/close formats
        fmt <- format_console(color = color, background = background, bold = bold, italic = italic, underline = underline)
        
        # apply them
        out <- apply_formatting(source, tokens, open = fmt$open, tokens = tokens, close = fmt$close)
        
    }

    return(out)
}

#' @rdname colorize
#' @export
colorise <- colorize


