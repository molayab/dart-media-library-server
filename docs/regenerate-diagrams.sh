#!/bin/bash
if ! command -v mmdc &> /dev/null; then
    echo " !!! mermaid.cli could not be found... check it out at https://github.com/mermaidjs/mermaid.cli"
    exit 1
fi

for diagram in diagrams/src/*.mmd ; do
    file="$(basename -- $diagram)"

    if [ -f "./diagrams/res/$file.png" ]; then
        rm -r ./diagrams/res/$file.png
    fi
    
    mmdc -i "$diagram" -o "diagrams/res/$file.png"
done