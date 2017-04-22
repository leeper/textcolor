#' @title Repeatedly gsub over a document
#' @description Introduce formatting by repeatedly gsub-ing over a source text
#' @param source A character vector
#' @param pattern A vector of patterns
#' @param replacement A vector of replacement values
#' @return A modified version of \code{source}.
#' @export
apply_formatting <- 
function(source, pattern, replacement) {
    if (length(pattern) != length(replacement)) {
        stop("length(pattern) != length(replacement)")
    }
    out <- source
    for (i in seq_along(pattern)) {
        out <- stringi::stri_replace_all_fixed(out, pattern[i], replacement[i])
    }
    return(out)
}
