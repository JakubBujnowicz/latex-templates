library(stringr)

tex <- list.files(pattern = "\\.tex$")
tex <- str_remove(tex, "\\.tex$")

other <- list.files()
relevant <- str_subset(other, paste0(tex, collapse = "|"))

remove <- str_subset(relevant, "\\.pdf$|\\.tex$", negate = TRUE)

file.remove(remove)
