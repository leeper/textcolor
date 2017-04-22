#' @title Repeatedly gsub over a document
#' @description Introduce formatting by repeatedly gsub-ing over a source text
#' @param source A character vector
#' @param pattern A vector of patterns
#' @param replacement A vector of replacement values
#' @return A modified version of \code{source}.
#' @export
apply_formatting <- 
function(source, pattern, open, tokens, close) {
    out <- source
    for (i in seq_along(pattern)) {
        matches <- stringi::stri_extract_all_regex(out, paste0("\\b", pattern[i], "\\b"))[[1L]]
        matches <- gsub("\\(", "\\\\(", matches)
        matches <- gsub("\\)", "\\\\)", matches)
        if (length(matches) > 0L) {
            for (j in seq_along(matches)) {
                out <- stringi::stri_replace_all_regex(out, paste0("\\b", matches[j], "\\b"), paste0(open[i], matches[j], close[i]))
            }
        }
    }
    return(out)
}
