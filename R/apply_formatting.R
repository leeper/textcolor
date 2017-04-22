apply_formatting <- 
function(source, pattern, replacement) {
    if (length(pattern) != length(replacement)) {
        stop("length(pattern) != length(replacement)")
    }
    for (i in seq_along(pattern)) {
        out <- stri_replace_all_fixed(source, pattern[i], replacement[i])
    }
    return(out)
}
