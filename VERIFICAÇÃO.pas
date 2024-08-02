PROGRAM att_02;

VAR
    sPalavra: string[20];
    sFrase: string[255];

FUNCTION bValido(fFrase, fPalavra: string): INTEGER;
VAR
    iValido, iTamanhoFrase, itamanhoPalavra, iSoma: integer;
BEGIN
    iValido := 0;
    iTamanhoFrase := 0;
    itamanhoPalavra := 0;
    iSoma := 0;

    ffrase := upcase(fFrase);
    fPalavra := upcase(fPalavra);

    // enquanto a posi��o da frase for menor, fa�a
    while (iTamanhoFrase < Length(fFrase)) do
    begin
        // Letra e frase recebem um valor
        Inc(iTamanhoFrase);
        Inc(itamanhoPalavra);

        // Se a letra da posi��o da frase for igual a letra da posi��o, ent�o valida a letra
        if (fFrase[iTamanhoFrase] = fPalavra[itamanhoPalavra]) then
            Inc(iValido)
        else
        // Caso seja diferente, "zere" a valida��o e reinicie o valor da valida��o da palavra
        begin
            iValido := 0;
            iTamanhoPalavra := 0;
        end;

        // Valida��o final, onde se todas as letras repassadas tiverem sido validadas, ir� somar o tamanho total da palavra (seguindo a ordem)
        // iValid deve ser zerado para poder contabilizar mais de uma palavra
        // Zera a posi��o do fWord para que seja poss�vel reiniciar a verifica��o
        if (iValido = Length(fPalavra)) then
        begin
            Inc(iSoma);
            iValido := 0;
            iTamanhoPalavra := 0;
        end;
    end;
    bValido := iSoma;
END;

BEGIN
    writeln('Digite uma frase = ');
    readln(sFrase);
    writeln('Digite uma palavra para verificar se existe na sua frase = ');
    readln(sPalavra);
    writeln('A quantidade de vezes que a palavra aparece na frase � = ', bValido(sFrase, sPalavra));
END.
