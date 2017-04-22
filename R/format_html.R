#' @rdname format
#' @title Replacement formatters
#' @description Construct a list of replacement formatting for a given markup format
#' @param color A vector of text colors
#' @param background A vector of background colors
#' @param bold A logical vector
#' @param italic A logical vector
#' @param underline A logical vector
#' @return A length-2 list
#' @examples
#' # html
#' format_html(color = c("black", "red", "green"))
#' # latex
#' format_latex(background = c("black", "red", "green"))
#'
#' @export
format_html <- 
function(color = NULL, background = NULL, bold = NULL, italic = NULL, underline = NULL, title = NULL) {
    
    out_open <- rep('<span style="', pmax(length(background), length(color)))
    out_close <- rep("</span>", pmax(length(background), length(color)))
    
    # in the below, create classes that intersect the various forms of formatting
    if (!is.null(color)) {
        out_open <- paste0(out_open, "color: ", color, "; ")
    }
    if (!is.null(background)) {
        out_open <- paste0(out_open, "background-color: ", background, "; ")
    }
    if (!is.null(bold)) {
        out_open <- paste0(out_open, "font-weight: bold; ")
    }
    if (!is.null(italic)) {
        out_open <- paste0(out_open, "font-style: italic; ")
    }
    if (!is.null(underline)) {
        out_open <- paste0(out_open, "text-decoration; underline")
    }
    
    if (!is.null(title)) {
        out_open <- paste0(out_open, '"; title="', title,'">')
    } else {
        out_open <- paste0(out_open, '">')
    }
    
    # return two-element list containing 'open' and 'closing' character strings to produce formatting around each string
    list(open = out_open,
         close = out_close)
}
