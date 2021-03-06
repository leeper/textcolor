% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/colorize.R
\name{colorize}
\alias{colorize}
\alias{colorise}
\title{Colorize a source text}
\usage{
colorize(data, tokens, source, background = NULL, color = NULL,
  bold = NULL, italic = NULL, underline = NULL, format = c("html",
  "latex", "shiny", "console"), snippet = TRUE, ...)

colorise(data, tokens, source, background = NULL, color = NULL,
  bold = NULL, italic = NULL, underline = NULL, format = c("html",
  "latex", "shiny", "console"), snippet = TRUE, ...)
}
\arguments{
\item{data}{A data frame containg something summarizing a model.}

\item{tokens}{A character string specifying the column in \code{data} that contains tokens/words/etc. to colorize.}

\item{source}{A character vector specifying a source text to format.}

\item{background}{A character string specifying a variable name from \code{data} to be used in dictating the background color of the text.}

\item{color}{A character string specifying a variable name from \code{data} to be used in dictating the font color of the text.}

\item{bold}{A character string specifying a variable name from \code{data} to be used in dictating whether to bold the text.}

\item{italic}{A character string specifying a variable name from \code{data} to be used in dictating whether to italicize the text.}

\item{underline}{A character string specifying a variable name from \code{data} to be used in dictating whether to underline the text.}

\item{format}{A character string specifying an output format.}

\item{snippet}{A logical indicating whether to provide just a code snippet (the default) or a complete document.}

\item{\dots}{TBD}

\item{font}{A character string specifying a variable name from \code{data} to be used in dictating the font face/family of the text.}

\item{size}{A character string specifying a variable name from \code{data} to be used in dictating the fotn size of the text.}
}
\description{
Summarize a text model by visualizing a source text
}
\details{
LaTeX support requires the \samp{xcolor} package in the document header.
}
\examples{
data("billSection", package = "textcolor")
colorize(test_data[!test_data$terms \%in\% c("a", "an"),], tokens = "terms", background = "class", source = document)


}
