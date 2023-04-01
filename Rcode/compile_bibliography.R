library(stringr)

text_block <- function(...,
                       block_width = 80,
                       msg_width = floor(block_width * 2 / 3),
                       block_sign = "%",
                       blank_n = 7,
                       comment_sign = NULL)
{
    txt <- paste0(c(...), collapse = "")
    txt <- str_wrap(txt, width = msg_width)

    lines <- format(str_split(txt, pattern = "\n")[[1]])

    block_n <- block_width - 2 * blank_n - nchar(lines[1])
    div2 <- block_n %% 2 == 0
    block_n <- block_n / 2

    if (!div2) {
        block_n <- c(floor(block_n), ceiling(block_n))
    }

    block <- strrep(block_sign, block_n)
    space <- strrep(" ", blank_n)

    if (length(block) != 2) {
        block <- rep(block, 2)
    }

    result <- paste0(block[1], space, lines, space, block[2])
    bound <- strrep(block_sign, block_width)

    result <- paste0(comment_sign,
                     c(bound, paste0(result, collapse = "\n"), bound),
                     collapse = "\n")
    cat(result)
    return(invisible(result))
}

bibfiles <- list.files("bibliography", pattern = "\\.bib$",
                       full.names = TRUE)
fulls <- c("bibliography_full.bib", "bibliography.bib")
bibfiles <- bibfiles[!(basename(bibfiles) %in% fulls)]

codes <- str_remove(basename(bibfiles), "\\.bib$")
names(bibfiles) <- codes

entries <- lapply(bibfiles, readLines, encoding = "UTF-8")
first_lines <- sapply(entries, function(x) x[[1]])
types <- toupper(str_extract(first_lines, "(?<=@).*?(?=\\{)"))

entries_tp <- split(entries, types)

result <- c()
for (tp in seq_along(entries_tp)) {
    curr <- entries_tp[[tp]]
    block <- text_block(names(entries_tp)[tp],
                        block_width = 78,
                        comment_sign = "% ",
                        block_sign = "=")
    block <- unlist(strsplit(block, "\n"))
    result <- c(result, block, "")

    for (e in seq_along(curr)) {
        result <- c(result, curr[[e]], "")
    }

    result <- c(result, "")
}

writeLines(result, "bibliography/bibliography.bib", useBytes = TRUE)
