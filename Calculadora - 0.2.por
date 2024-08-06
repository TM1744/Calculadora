programa
{
	/*
	 * OBS: 
	 * 	Esta calculadora possui algumas limitações...
	 * 	
	 * 	1- Não será executado calculo algum que receba como primeiro "parâmetro" um número negativo. 
	 * 	Caso queira fazer um calculo que comece com um número negativo, coloque como "parâmetro" 
	 * 	primeiramente 0 e depois coloque os outros números. Exemplo: "0-120-130" ao invés de "-120-130".
	 * 	
	 * 	2- Esta calculadora, diferente das regras matématicas, não possui prioridade de calculo.
	 * 	Ela não irá calcular primeiramente as multiplicações ou divisões e posteriormente as somas e
	 * 	subtrações, será tudo calculado na ordem em que está, da esquerda para a direita.
	 * 	
	 * 	3- Não é possível realizar um calculo sobre um resultado gerado anteriormente, será necessário
	 * 	resetar para fazer outro calculo.
	 * 	
	 * 	Este modelo é apenas para fins de treinamento.
	 */
	inclua biblioteca Tipos --> tt
	inclua biblioteca Texto --> T
	funcao inicio()
	{
		cadeia info
		caracter sinal = tt.cadeia_para_caracter("z")
		inteiro indiceFinal = 0
		inteiro indiceInicial = 0
		inteiro num = 0
		inteiro result = 0

		escreva("calculadora:\n")
		leia(info)

		enquanto(indiceFinal <= T.numero_caracteres(info))
		{
			indiceFinal = scanIndice (info, indiceFinal)
			num = tt.cadeia_para_inteiro(T.extrair_subtexto(info, indiceInicial, indiceFinal), 10)
			se(indiceInicial == 0)
			{
				sinal = T.obter_caracter(info, indiceFinal)
				result = num
			}
			se(indiceFinal == T.numero_caracteres(info))
			{
				result = calculo (sinal, num, result)
			}
			se(indiceInicial != 0 e indiceFinal != T.numero_caracteres(info))
			{
				result = calculo (sinal, num, result)
				sinal = T.obter_caracter(info, indiceFinal)
			}
			indiceFinal ++
			indiceInicial = indiceFinal
		}
		escreva("\n\nResultado: ", result)
	}
	funcao inteiro scanIndice(cadeia x, inteiro y)
	{
		para(inteiro i = y; i < T.numero_caracteres(x); i++)
		{
			se((T.obter_caracter(x, i) == tt.cadeia_para_caracter("+")) ou 
			(T.obter_caracter(x, i) == tt.cadeia_para_caracter("-")) ou
			(T.obter_caracter(x, i) == tt.cadeia_para_caracter("/")) ou
			(T.obter_caracter(x, i) == tt.cadeia_para_caracter("*")))
			{
				i = T.numero_caracteres(x)
			}
			senao
			{
				y = i + 1
			}
			
		}
		retorne y
	}
	funcao inteiro calculo (caracter sinal, inteiro num2, inteiro num1)
	{
		se(sinal == tt.cadeia_para_caracter("+"))
		{
			retorne num1 + num2
		}
		se(sinal == tt.cadeia_para_caracter("-"))
		{
			retorne num1 - num2
		}
		se(sinal == tt.cadeia_para_caracter("/"))
		{
			retorne num1 / num2
		}
		se(sinal == tt.cadeia_para_caracter("*"))
		{
			retorne num1 * num2
		}
		retorne 0
	}
}
/* $$$ Portugol Studio $$$ 
 * 
 * Esta seção do arquivo guarda informações do Portugol Studio.
 * Você pode apagá-la se estiver utilizando outro editor.
 * 
 * @POSICAO-CURSOR = 2524; 
 * @PONTOS-DE-PARADA = ;
 * @SIMBOLOS-INSPECIONADOS = {sinal, 25, 11, 5}-{indiceFinal, 26, 10, 11}-{indiceInicial, 27, 10, 13}-{num, 28, 10, 3}-{result, 29, 10, 6};
 * @FILTRO-ARVORE-TIPOS-DE-DADO = inteiro, real, logico, cadeia, caracter, vazio;
 * @FILTRO-ARVORE-TIPOS-DE-SIMBOLO = variavel, vetor, matriz, funcao;
 */
