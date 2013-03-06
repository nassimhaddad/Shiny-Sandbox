
json_content <- matrix(1:10, ncol = 2)
toJSON(x)

cat(toJSON(list(a = 1, b = 2L, c = TRUE,
                d = c(1, 3),
                e = "abc"), asIs = TRUE))

toJSON(matrix(c(1, 2, NA, 4), 2, 2), .na = "null")