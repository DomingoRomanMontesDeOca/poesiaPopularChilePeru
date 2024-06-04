sn = selected("Sound")
sn$ = selected$("Sound")
tono = selected("Pitch")

tg = selected("TextGrid")

writeInfoLine: "===="

select tg


tiempo_total_sin_silencios = Get total duration of intervals where: 1, "is not equal to", ""

n_intervalos_tier_1 = Get number of intervals: 1

tiempo_uni_1 = Get end time of interval: 1, 1

tiempo_fin_1 = Get start time of interval: 1, n_intervalos_tier_1

tiempo_total_con_pausas = tiempo_fin_1 - tiempo_uni_1


velocidad_estrofa = 4 / tiempo_total_con_pausas

velocidad_verso = 40 /  tiempo_total_con_pausas



appendInfoLine: fixed$(tiempo_total_con_pausas,2),tab$, fixed$(tiempo_total_sin_silencios,2), tab$, fixed$(velocidad_estrofa,2),tab$,tab$,fixed$(velocidad_verso,2)



if n_intervalos_tier_1 <> 9

	appendInfoLine: "Revisar segmentación en tier 1"

endif


appendInfoLine: "Estrofa",tab$,"duracion",tab$,"promediof0",tab$,"máxf0",tab$,"mínf0",tab$,"semitonos"

for i to n_intervalos_tier_1

	select tg

	estrofa$ = Get label of interval: 1, i

	if estrofa$ <> ""

		inicio_estrofa = Get start time of interval: 1, i

		final_estrofa = Get end time of interval: 1, i

		duracion = final_estrofa - inicio_estrofa

		select tono

		x_f0 = Get mean: inicio_estrofa, final_estrofa, "Hertz"

		max_f0 =  Get maximum: inicio_estrofa, final_estrofa, "Hertz", "parabolic"

		min_f0 = Get minimum: inicio_estrofa, final_estrofa, "Hertz", "parabolic"

		st = 12*log2(max_f0/min_f0)

		appendInfoLine: estrofa$,tab$,fixed$(duracion,2), tab$, fixed$(x_f0,2),tab$,fixed$(max_f0,2), tab$,fixed$(min_f0,2), tab$, fixed$(st,2)


	endif

endfor


