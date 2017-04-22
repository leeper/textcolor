#' @rdname format
#' @export
format_latex <- 
function(color = NULL, background = NULL, bold = NULL, italic = NULL, underline = NULL) {
    out_open <- character(pmax(length(background), length(color)))
    out_close <- character(pmax(length(background), length(color)))
    
    if (!is.null(color)) {
        out_open <- paste0(out_open, "\\textcolor{", color,"}{")
        out_close <- paste0(out_close, "}")
    }
    if (!is.null(background)) {
        out_open <- paste0(out_open, "\\colorbox{", background,"}{")
        out_close <- paste0(out_close, "}")
    }
    if (!is.null(bold)) {
        out_open <- ifelse(bold, paste0(out_open, "\\textbf{"), "")
        out_close <- ifelse(bold, paste0(out_open, "}"), "")
    }
    if (!is.null(italic)) {
        out_open <- ifelse(italic, paste0(out_open, "\\textit{"), "")
        out_close <- ifelse(italic, paste0(out_open, "}"), "")
    }
    if (!is.null(underline)) {
        out_open <- ifelse(italic, paste0(out_open, "\\underline{"), "")
        out_close <- ifelse(underline, paste0(out_open, "}"), "")
    }
    
    # return two-element list containing 'open' and 'closing' character strings to produce formatting around each string
    list(open = out_open,
         close = out_close)
}
