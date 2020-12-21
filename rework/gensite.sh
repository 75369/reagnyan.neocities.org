#!/bin/bash 
for file in pages/*; do
    filename="${file%.*}"
    markdown -o temp.html -F MKD_AUTOLINK "$file"
    cat templates/header.html temp.html templates/footer.html > $filename.html
    tidy -config templates/tidy_config.txt $filename.html
    rm temp.html
done
mv pages/*.html output/
echo "Script finished"