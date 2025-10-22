BEGIN {
    FS = ","
    OFS = ","

    tax_col = 0
}

NR == 1 {
    for (i = 1; i <= NF; i++) {
        col_name = $i
        gsub(/[[:space:]]+/, "", val)
        if (tolower(col_name) == "tax") {
            tax_col = i
            break
        }
    }
    print $0
    next
}

NR > 1 {
    if (tax_col > 0) {
        val = $(tax_col)
        gsub(/[[:space:]]+/, "", val)

        if (val ~ /^([0-9]+(\.[0-9]+)?|\.[0-9]+)$/) {
            percent = (val + 0) * 100  
            $(tax_col) = percent "%"
        }
        else if (val ~ /^([0-9]+(\.[0-9]+)?|\.[0-9]+)%$/) {
            $(tax_col) = val
        }
        else {
            $(tax_col) = "N/A"
        }
    }
    print $0
}
