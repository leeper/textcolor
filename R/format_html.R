# construct a set of opening and closing tags based upon requested formatting
format_html <- 
function(color = NULL, background = NULL, bold = NULL, italic = NULL, underline = NULL) {
    
    #out_open <- character(length(color))
    out_open <- '<span class="SOMECLASS">'
    out_close <- rep("</span>", length(color))
    
    # in the below, create classes that intersect the various forms of formatting
    if (!is.null(color)) {
        
    }
    if (!is.null(background)) {
        
    }
    if (!is.null(bold)) {
        
    }
    if (!is.null(italic)) {
        
    }
    if (!is.null(underline)) {
        
    }
    
    
    # return two-element list containing 'open' and 'closing' character strings to produce formatting around each string
    list(open = out_open,
         close = out_close)
}
