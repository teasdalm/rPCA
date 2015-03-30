make_map <- function(x, outfile){
  chr <- str_replace(x[1], "chr", "")
  position <- x[2]
  snp_name <- paste0(str_replace(x[9], "]", ""), ".1")

  cat(chr, snp_name, "0", position, '\n', file=outfile, append = TRUE)
}
