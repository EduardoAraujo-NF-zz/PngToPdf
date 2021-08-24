python pdf.py | grep "sucesso" || {
    mkdir -p .old
    rm pdfFull.pdf
    echo "Ocorreu um erro"

    for f in *.png; do {
        echo "Removendo fundo transparente da imagem $f"
        mv $f .old
        convert .old/$f -background white -alpha remove -alpha off "$f"
    }
    done

    echo "Tentando novamente"
    python pdf.py | grep "sucesso" ||  {
        echo "Ta foda man..."
        rm pdfFull.pdf
        
        for f in *.png; do {
            rm $f
            mv .old/$f ./
        }
        done
    }
}
