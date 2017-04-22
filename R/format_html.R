# construct a set of opening and closing tags based upon requested formatting
format_html <- 
function(color = NULL, background = NULL, bold = NULL, italic = NULL, underline = NULL) {
    
    #out_open <- character(length(color))
    out_open <- rep('<span style="', length(background))
    out_close <- rep("</span>", length(background))
    
    # in the below, create classes that intersect the various forms of formatting
    if (!is.null(color)) {
        out_open <- paste0(out_open, "color: ", color, ";")
    }
    if (!is.null(background)) {
        out_open <- paste0(out_open, "background-color: ", background, ";")
    }
    if (!is.null(bold)) {
        
    }
    if (!is.null(italic)) {
        
    }
    if (!is.null(underline)) {
        
    }
    
    out_open <- paste0(out_open, '">')
    
    # return two-element list containing 'open' and 'closing' character strings to produce formatting around each string
    list(open = out_open,
         close = out_close)
}
